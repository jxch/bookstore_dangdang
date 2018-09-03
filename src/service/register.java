package service;

//import Dao.pageUser_Information;

import Dao.userDao;
import Dao.user_Information;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class register extends HttpServlet {
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        /*
         *验证注册信息
        */
        //从jsp端获取数据
        String email = req.getParameter("email");
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        //确认密码
        String passeword1 = req.getParameter("password1");

        user_Information user = new user_Information();
        user.email = email;
        user.name = name;
        user.password = password;
//        char[] Email = email.toCharArray();
//        int count = 0;
//        for (int i = 0; i < email.length(); i++) {
//            if ('@' == Email[i]) {
//                if ('.' == Email[i + 1]) {
//                    count++;
//                }
//            }
//        }

        int l = -1;
        //注册内容有一项为空或密码不匹配
        if (email.equals("") || name.equals("") || password.equals("") || !passeword1.equals(password)) {
            int s = 3;
            req.setAttribute("sign", s);
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
        else {
            //注册信息正确获取l
            l = userDao.register(user);
        }

        //注册信息正确判断注册的内容是否正确
        // 注册成功
        if (l == 0) {
            req.setAttribute("user", user);
            req.getRequestDispatcher("register_ok.jsp").forward(req, resp);
        }
        //注册过
        else if (l == 1) {
            int sign = 2;
            req.setAttribute("sign", sign);
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
        //用户名不可用
        else if (l == 2) {
            int s = 1;
            req.setAttribute("sign", s);
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
        //传到jsp后，js判断sign
    }
}
