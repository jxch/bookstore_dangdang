package service;

import Dao.BookDao;
import Dao.book_Information;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class ConfirmOrder extends HttpServlet{
    /*确认订单*/
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String name = BookDao.getUsername();
        String name = req.getParameter("username");
        ArrayList<book_Information> books = BookDao.shoppingCart(name);
        //给books设置属性名，然后传递到下面的jsp文件中
        req.setAttribute("shoppingCart",books);
        req.getRequestDispatcher("order_info.jsp").forward(req,resp);
    }
}
