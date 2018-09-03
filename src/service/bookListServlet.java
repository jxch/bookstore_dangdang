package service;

import Dao.book_Information;
import Dao.BookDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class bookListServlet extends HttpServlet{
    /*显示图书的列表*/
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bookName = req.getParameter("bookName");
        String num = req.getParameter("num");
        int number;
        if (bookName == null){
            bookName = "";
        }
        if (num == null){
            number = 1;
        } else {
            number = Integer.parseInt(num);
        }

        ArrayList<book_Information> books = BookDao.bookList(bookName, number);/*调用BookDao里面的BookList方法，从数据库里面查询图书的信息*/
        ArrayList<String> bookClass = BookDao.bookClassList();
        req.setAttribute("books",books);/*设置属性*/
        /* 重定向到bookList,jsp，显示这个网页，页面里面显示图书信息 */
        req.setAttribute("bookClass",bookClass);
        req.getRequestDispatcher("bookList.jsp").forward(req,resp);
    }
}
