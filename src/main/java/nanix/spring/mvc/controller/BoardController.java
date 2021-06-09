package nanix.spring.mvc.controller;

import nanix.spring.mvc.dao.BoardDAO;
import nanix.spring.mvc.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
    public class BoardController {

        @Autowired
        private BoardService bsrv;

        // 데이터가 왔다갔다 할때는 모델앤뷰
        @GetMapping("/board/list")
        public ModelAndView list(ModelAndView mv, String cp) {
            if (cp == null) cp = "1";
            mv.setViewName("board/list.tiles");
            mv.addObject("bds",bsrv.readBoard(cp));

            return mv;
        }

        @GetMapping("/board/view")
        public String view() {
            return "board/view.tiles";
        }

        @GetMapping("/board/write")
        public String write() {
            return "board/write.tiles";
        }

}


