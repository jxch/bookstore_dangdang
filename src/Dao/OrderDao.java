package Dao;

import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;

public class OrderDao {
    public static void OrderAdd(Order_Information order,String username){
            Connection con = DBUtil.getCon();
            String sql = "insert into `order` (name,address,zipCode,telephone,mobilePhone) values(?,?,?,?,?)";
            try {
                PreparedStatement prep = con.prepareStatement(sql);
                prep.setString(1, order.name);
                prep.setString(2, order.address);
                prep.setString(3, order.zipCode);
                prep.setString(4, order.telephone);
                prep.setString(5, order.mobilePhone);
                prep.executeUpdate();
                delCart(username);
            } catch (Exception e) {
                e.printStackTrace();
            }
    }

    private static void delCart(String name){
        Connection con = DBUtil.getCon();
        String sql = "DELETE FROM shoppingcart WHERE userName="+"'"+name+"'";
        try {
            PreparedStatement prep = con.prepareStatement(sql);
            prep.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
