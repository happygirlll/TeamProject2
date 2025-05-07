package com.example.teamproject2;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class BomController {

    @GetMapping("/bom")
     public @ResponseBody String bom() {
         return "민아님 안녕하세용용가리";
     }
    
    

}
