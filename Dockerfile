#빌드 단계,
FROM openjdk:17-jdk-slim AS build

WORKDIR /app

#gradle wrapper 파일 복사,
COPY gradlew .
COPY gradle ./gradle
COPY build.gradle settings.gradle ./

#의존성 캐시,
RUN ./gradlew dependencies --no-daemon

#소스 코드 복사 및 빌드,
COPY src ./src
RUN ./gradlew build --no-daemon -x test

#실행 단계,
FROM openjdk:17-jdk-slim

WORKDIR /app

COPY --from=build /app/build/libs/*.jar app.jar

ENV JAVA_OPTS="-Xms512m -Xmx512m"
ENV SERVER_PORT=8080

EXPOSE 8080



ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar app.jar"]