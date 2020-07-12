package com.shu.oa.global;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();

        if (url.toLowerCase().indexOf("login") != -1) {
            return true;
        }


        if (request.getSession().getAttribute("employee") != null) {
            return true;
        }

        response.sendRedirect("/to_login");
        return false;
    }
}
