package Dao;

import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userDao {
    //判断是否注册
    private static int IsRegistered(String email){
        /*不存在返回 1
          存在返回   0
        * */
        Connection con = DBUtil.getCon();
        String sql = "select * from `user` where (email like '"+email+"')";
        try {
            PreparedStatement prep = con.prepareStatement(sql);
            ResultSet rs = prep.executeQuery();
            if (!rs.next()){
                return 1;
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return 0;
    }
    public static int register(user_Information user){
        /*用户注册过 返回1
        * 用户注册成功 返回0
        * 用户名不可用  返回2*/
        if (IsRegistered(user.email) == 1) {
            if (name(user.name) == 1) {
                Connection con = DBUtil.getCon();
                String sql = "insert into `user` (email,name,password) values(?,?,?)";
                try {
                    PreparedStatement prep = con.prepareStatement(sql);
                    prep.setString(1, user.email);
                    prep.setString(2, user.name);
                    prep.setString(3, user.password);
                    prep.executeUpdate();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }else{
                return 2;
            }
        }else {
            return 1;
        }
        return 0;
    }
    public static int name(String username){
        /*用户名存在 返回0
        * 用户名不存在 返回1*/
        Connection con = DBUtil.getCon();
        String sql = "select * from `user` where name="+"'"+username+"'";
        try {
            PreparedStatement prep = con.prepareStatement(sql);
            ResultSet rs = prep.executeQuery();
            if (rs.next()){
                return 0;
            }else {
                return 1;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }
    public static int login(user_Information user){
        /*密码不正确 返回 1
        * 密码正确   返回 0
        * 用户未注册 返回 2*/
        if (IsRegistered(user.email) == 0) {
            Connection con = DBUtil.getCon();
            String sql = "select * from `user` where email='" + user.email + "'";
            try {
                PreparedStatement prep = con.prepareStatement(sql);
                ResultSet rs = prep.executeQuery();
                while (rs.next()){
                    String password = rs.getString("password");
                    if (!password.equals(user.password)) {
                        return 1;
                    }
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        }else {
            return 2;
        }
        return 0;
    }
    //查库获取email对应的name
    public static String GetPageUser(String email){
        Connection con = DBUtil.getCon();
        String sql = "select name from `user` where email='"+email+"'";
        String username = null;
        try {
            PreparedStatement prep = con.prepareStatement(sql);
            ResultSet rs = prep.executeQuery();
            while (rs.next()){
                String name = rs.getString("name");
                username = name;
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return username;
    }
}

