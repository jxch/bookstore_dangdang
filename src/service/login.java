package service;

import Dao.pageUser_Information;
import Dao.user_Information;
import Dao.userDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class login extends HttpServlet{
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        user_Information user = new user_Information();
        user.email = email;
        user.password = password;
        /*
         *  验证登录
         */
        int l = userDao.login(user);
        pageUser_Information sign = new pageUser_Information();
        /*密码正确   返回 0
         *密码不正确 返回 1
         * 用户未注册 返回 2*/

        //浏览器的数据库存储登录的用户信息
        //密码不正确
        if (l == 1){
            sign.sign = 1;
            sign.name = null;
            sign.email = null;
            req.setAttribute("sign",sign);
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
        //用户未注册
        else if (l == 2){
            sign.sign = 2;
            sign.name = null;
            sign.email = null;
            req.setAttribute("sign",sign);
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
        //密码正确，验证成功
        else {
            //为了加入浏览器的库中
            sign.sign = 0;
            sign.name = userDao.GetPageUser(user.email);
            sign.email = user.email;
            req.setAttribute("sign",sign);
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
        //传到jsp端，js判断sign
    }
}
