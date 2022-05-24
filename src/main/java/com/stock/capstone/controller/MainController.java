package com.stock.capstone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
    @RequestMapping(value = "/index", method = RequestMethod.GET)
public String index() { return "index";
    }

    @RequestMapping(value = "/recommend", method = RequestMethod.GET)
    public String recommend() { return "recommend";
    }

    @RequestMapping(value = "/prediction", method = RequestMethod.GET)
    public String prediction() { return "prediction";
    }
    @RequestMapping(value = "/prediction_result", method = {RequestMethod.GET,RequestMethod.POST})
    public String prediction_result() { return "prediction_result";
    }

    @RequestMapping(value = "/prediction_s033160", method = {RequestMethod.GET,RequestMethod.POST})
    public String prediction_s033160() { return "prediction_s033160";
    }

    @RequestMapping(value = "/prediction_s046890", method = {RequestMethod.GET,RequestMethod.POST})
    public String prediction_s046890() { return "prediction_s046890";
    }


    @RequestMapping(value = "/recommend_sector1", method = {RequestMethod.GET,RequestMethod.POST})
    public String recommend_sector1() { return "recommend_sector1";
    }

    @RequestMapping(value = "/recommend_sector2", method = {RequestMethod.GET,RequestMethod.POST})
    public String recommend_sector2() { return "recommend_sector2";
    }
}

