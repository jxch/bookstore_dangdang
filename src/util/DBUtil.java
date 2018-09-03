package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
    public static Connection getCon(){
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url  = "jdbc:mysql://localhost:3306/DangDang?useUnicode&characterEncoding=utf-8";
            String name = "root";
            String pwd  = "";
            con = DriverManager.getConnection(url,name,pwd);
        }catch (Exception e){
            e.printStackTrace();
        }

        return con;
    }
    public static Connection GetCon(){
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url  = "jdbc:mysql://localhost:3306/?useUnicode&characterEncoding=utf-8";
            String name = "root";
            String pwd  = "";
            con = DriverManager.getConnection(url,name,pwd);
        }catch (Exception e){
            e.printStackTrace();
        }

        return con;
    }
}
