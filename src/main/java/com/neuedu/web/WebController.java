package com.neuedu.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/manage/web")
public class WebController {
    /**
     * 退出登录
     * @return
     */
    @RequestMapping("webcache.do")
    public String webCache(){
        return "web_cache";
    }
    /**
     * 修改登录密码
     */
    @RequestMapping("/update_pasd.do")
    public String toUpdatePsd(){
        return "update_psd";
    }
}
