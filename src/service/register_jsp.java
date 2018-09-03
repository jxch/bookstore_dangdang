package service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
//跳到开始注册界面
public class register_jsp extends HttpServlet{
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int sign = 0;
        req.setAttribute("sign",sign);
        //传到jsp,js端判断
        req.getRequestDispatcher("register.jsp").forward(req,resp);
    }
}
