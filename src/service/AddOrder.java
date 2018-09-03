package service;

import Dao.OrderDao;
import Dao.Order_Information;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddOrder extends HttpServlet {
    /*增加订单*/
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        /*截取消息中的字符串信息*/
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String zipCode = req.getParameter("zipCode");//邮编
        String telephone = req.getParameter("telephone");
        String mobilePhone = req.getParameter("mobilePhone");
        String username = req.getParameter("username");
        /*创建订单信息的对象，得到订单的信息*/
        Order_Information order = new Order_Information();
        order.name = name;
        order.address = address;
        order.zipCode = zipCode;
        order.telephone = telephone;
        order.mobilePhone = mobilePhone;
        /*调用Dao中的增加订单的方法，传递username参数过去*/
        OrderDao.OrderAdd(order,username);
        /*判断订单是否完成，如果完成了跳转到订单完成界面，如果*/
        if (name.equals("") || address.equals("") || zipCode.equals("") || telephone.equals("") || mobilePhone.equals("")){
            int sign = 1;
            req.setAttribute("sign",sign);
            req.getRequestDispatcher("address_form.jsp").forward(req,resp);
        }else {
            //订单信息如果完整，把订单的信息床底到下一个jsp界面，并且跳转到订单成功的界面
            req.setAttribute("money", order);
            req.getRequestDispatcher("order_ok.jsp").forward(req, resp);
        }
    }
}
