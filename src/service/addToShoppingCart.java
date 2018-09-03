package service;

import Dao.BookDao;

//import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class addToShoppingCart extends HttpServlet{
    /*增加购物车中的商品*/
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("utf-8");
        String name = req.getParameter("username");
        String id = req.getParameter("id");
        String num = req.getParameter("number");
        int bookId = Integer.parseInt(id);
        int number = Integer.parseInt(num);
        BookDao.bookAddToShoppingCart(bookId,name,number);
        resp.sendRedirect("shoppingCart?username="+name);/* 传输数据 */
    }
}
