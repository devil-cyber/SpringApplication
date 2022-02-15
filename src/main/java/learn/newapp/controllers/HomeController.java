package learn.newapp.controllers;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
    @RequestMapping(value = "/", method = RequestMethod.GET)
    ModelAndView Home(){
        return new ModelAndView("home");
    }
}
