package nanix.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PdsController {

    @GetMapping("/pds/list")
    public String list() {
        return "join/list.tiles";
    }

    @GetMapping("/pds/view")
    public String view() {
        return "join/view.tiles";
    }

    @GetMapping("/pds/write")
    public String write() {
        return "join/write.tiles";
    }

}
