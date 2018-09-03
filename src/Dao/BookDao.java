package Dao;

import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BookDao {
    private static final int PAGE_BOOKS = 5;

    public static ArrayList<book_Information> bookList(String bookName, int number) {
        ArrayList<book_Information> books = new ArrayList<>();
        Connection con = DBUtil.getCon();
        String sql;
        int flag = 1;
        if (bookName.equals("")) {
            sql = "select * from book LIMIT " + (number - 1) * PAGE_BOOKS + "," + PAGE_BOOKS;
            flag = 0;
        } else if (bookName.split("::")[0].equals("class")) {
            sql = "select * from book where className = " + "'" + bookName.split("::")[1] + "'";
        } else {
            sql = "select * from book where name = " + "'" + bookName + "'";
        }
        try {
            PreparedStatement prep = con.prepareStatement(sql);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                book_Information book = new book_Information();
                book.id = rs.getInt("id");
                book.name = rs.getString("name");
                book.price = rs.getFloat("price");
                book.price_dangDang = rs.getFloat("price_dangDang");
                book.fraction = rs.getInt("fraction");
                book.author = rs.getString("author");
                book.press = rs.getString("press");
                book.publication_date = rs.getString("publication_date");
                book.introduction = rs.getString("introduction");
                book.image_Path = rs.getString("image_Path");
                book.bookClass = rs.getString("className");
                books.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (flag == 1) {
            ArrayList<book_Information> bs = new ArrayList<>();
            for (int i = (number - 1) * 5, j = 0; j < 5 && i < books.size(); i++, j++) {
                bs.add(books.get(i));
            }
            return bs;
        }

        return books;
    }

    public static ArrayList<String> bookClassList() {
        ArrayList<String> classList = new ArrayList<>();
        Connection con = DBUtil.getCon();
        String sql = "select className from class";
        try {
            PreparedStatement prep = con.prepareStatement(sql);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                classList.add(rs.getString("className"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return classList;
    }

    public static void bookAddToShoppingCart(int id, String name, int number) {
        Connection con = DBUtil.getCon();
//        name = getUsername();
        if (IsNull(name, id) == 0) {
            String sql = "insert into shoppingcart(userName,book_Id,number) values(?,?,?)";
            try {
                PreparedStatement prep = con.prepareStatement(sql);
                prep.setString(1, name);
                prep.setInt(2, id);
                prep.setInt(3, 1);
                prep.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            String sql = "update shoppingcart set number=? where book_Id=" + id + " and userName=" + "'" + name + "'";
            try {
                PreparedStatement prep = con.prepareStatement(sql);
                int num = bookNum(id);
                if (number == -1) {
                    num += 1;
                } else {
                    num = number;
                }
                prep.setInt(1, num);
                prep.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static int bookNum(int id) {
        int num = 0;
        Connection con = DBUtil.getCon();
        String sql = "select number from shoppingcart where book_Id=" + id;
        try {
            PreparedStatement prep = con.prepareStatement(sql);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                num = rs.getInt("number");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return num;
    }

    private static int IsNull(String name, int id) {
        Connection con = DBUtil.getCon();
        String sql = "select * from shoppingcart where book_Id = " + id + " and userName = " + "'" + name + "'";
        try {
            PreparedStatement prep = con.prepareStatement(sql);
            ResultSet rs = prep.executeQuery();
            if (rs.next()) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }


    public static void delBook_shoppingCart(int id, String user) {
        Connection con = DBUtil.getCon();
        String sql = "delete from shoppingcart where book_Id=? AND userName=?";
        try {
            PreparedStatement prep = con.prepareStatement(sql);
            prep.setInt(1, id);
            prep.setString(2, user);
            prep.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<book_Information> shoppingCart(String username) {
        ArrayList<book_Information> books = new ArrayList<>();
        Connection con = DBUtil.getCon();
        String sql = "select * from shoppingcart WHERE userName=" + "'" + username + "'";
        try {
            PreparedStatement prep = con.prepareStatement(sql);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                book_Information book;
                int book_Id;
                book_Id = rs.getInt("book_Id");
                book = bookId(book_Id);
                books.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return books;
    }

    private static book_Information bookId(int id) {
        book_Information book = new book_Information();
        Connection con = DBUtil.getCon();
        String sql = "select * from book where id=" + id;
        try {
            PreparedStatement prep = con.prepareStatement(sql);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                book.id = rs.getInt("id");
                book.name = rs.getString("name");
                book.price = rs.getFloat("price");
                book.price_dangDang = rs.getFloat("price_dangDang");
                book.fraction = rs.getInt("fraction");
                book.author = rs.getString("author");
                book.press = rs.getString("press");
                book.publication_date = rs.getString("publication_date");
                book.introduction = rs.getString("introduction");
                book.image_Path = rs.getString("image_Path");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return book;
    }

}
