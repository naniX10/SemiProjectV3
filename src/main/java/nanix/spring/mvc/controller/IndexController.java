package nanix.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class IndexController {

    @GetMapping("/") // ver 5 이상에서만 가능!!!!
    public String index() {
        return "index.tiles";
    }

    @GetMapping("/pds")
    public String pds() {
        return "pds.tiles";
    }

}
