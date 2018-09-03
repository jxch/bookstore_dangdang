package service;

import Dao.BookDao;
import Dao.book_Information;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class shoppingCartList extends HttpServlet{
    /*显示购物车的列表的servlet*/
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String name = BookDao.getUsername();
        String name = req.getParameter("username");
        /*调用Dao方法里面的shoppingCart方法，获得名字信息，并创建一个ArryList来存储获取到的信息*/
        ArrayList<book_Information> books = BookDao.shoppingCart(name);
        req.setAttribute("shoppingCart",books);/*设置参数的属性*/
        req.getRequestDispatcher("cart.jsp").forward(req,resp);/*把数据传输到cart.jsp页面*/
    }
}
