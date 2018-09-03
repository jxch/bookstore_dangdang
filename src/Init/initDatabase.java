package Init;

//import Dao.*;
import util.DBUtil;

import java.sql.Connection;
//import java.sql.ParameterMetaData;
import java.sql.PreparedStatement;
//import java.time.Period;
//import java.util.ArrayList;

public class  initDatabase{
    public static void main(String[] args) {
        dangDang();
        System.out.print("dangdang数据库初始化完毕\n");
        Book();
        System.out.print("book表单初始化完毕\n");
        order();
        System.out.print("order表单初始化完毕\n");
        ShoppingCart();
        System.out.print("shoppingcart表单初始化完毕\n");
        User();
        System.out.print("user表单初始化完毕\n");
    }
    private static void dangDang(){
        Connection con = DBUtil.GetCon();
        String sql = "CREATE DATABASE IF NOT EXISTS DangDang DEFAULT CHARACTER SET utf8;";
        try {
            PreparedStatement prep = con.prepareStatement(sql);
            prep.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    private static void Book(){
        Connection con = DBUtil.getCon();
        String sql = "CREATE TABLE IF NOT EXISTS book (id int not null auto_increment primary key," +
                "name varchar(20) not null," +
                "price float not null," +
                "price_dangDang float not null," +
                "fraction int not null," +
                "author varchar(20) not null," +
                "press varchar(20) not null," +
                "publication_date varchar(20) not null," +
                "introduction varchar(1000) not null," +
                "image_Path varchar(100) not null)ENGINE = InnoDB DEFAULT CHARSET = utf8;";
        try {
            PreparedStatement prep = con.prepareStatement(sql);
            prep.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    private static void order(){
        Connection con = DBUtil.getCon();
        String sql = "create table IF NOT EXISTS `order` " +
                "(" +
                "id int not null auto_increment " +
                "primary key," +
                "name varchar(20) not null," +
                "address varchar(50) not null," +
                "zipCode varchar(20) not null," +
                "telephone varchar(20) not null," +
                "mobilePhone int not null" +
                ")ENGINE = InnoDB DEFAULT CHARSET = utf8" +
                ";";
        try {
            PreparedStatement prep = con.prepareStatement(sql);
            prep.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    private static void ShoppingCart(){
        Connection con = DBUtil.getCon();
        String sql = "create table IF NOT EXISTS shoppingcart" +
                "(" +
                "id int not null auto_increment " +
                "primary key," +
                "userName varchar(20) not null," +
                "book_Id int not null," +
                "number int not null" +
                ")ENGINE = InnoDB DEFAULT CHARSET = utf8" +
                ";";
        try {
            PreparedStatement prep = con.prepareStatement(sql);
            prep.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    private static void User(){
        Connection con = DBUtil.getCon();
        String sql = "create table IF NOT EXISTS `user`" +
                "(" +
                "id int not null auto_increment " +
                "primary key," +
                "email varchar(20) not null," +
                "name varchar(20) not null," +
                "password varchar(20) not null" +
                ")ENGINE = InnoDB DEFAULT CHARSET = utf8" +
                ";";
        try {
            PreparedStatement prep = con.prepareStatement(sql);
            prep.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
