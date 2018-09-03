package service;

import Dao.BookDao;

//import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class delBook_ShoppingCart extends HttpServlet {
    /* 删除购物车中的图书 */
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String id = req.getParameter("id");
        String user = req.getParameter("user");
        /*把id和user传过去，调用Dao中的方法*/
        BookDao.delBook_shoppingCart(Integer.parseInt(id), user);
        resp.sendRedirect("/shoppingCart?username=" + user);
    }
}
