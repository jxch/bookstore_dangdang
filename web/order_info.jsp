<%@ page import="Dao.book_Information" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Dao.BookDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>--%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>生成订单 - 当当网</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/login.css" rel="stylesheet" type="text/css" />
    <link href="css/page_bottom.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.5.min.js"></script>
    <script type="text/javascript" src="jsp.js"></script>
</head>
<body onload="pageInit('order_info')">
<%--<%@include file="common/head1.jsp"%>--%>
<div class="login_step" id="user_order_info">
    生成订单骤:
    <span class="red_bold">1.确认订单</span> > 2.填写送货地址 > 3.订单成功
</div>
<div class="fill_message">

    <table class="tab_login">
        <tr>
            <td valign="top" class="w1" style="text-align: left">
                <b>序号</b>
            </td>
            <td valign="top" class="w1" style="text-align: left">
                <b>商品名称</b>
            </td>
            <td valign="top" class="w1" style="text-align: left">
                <b>商品单价</b>
            </td>
            <td valign="top" class="w1" style="text-align: left">
                <b>商品数量</b>
            </td>
            <td valign="top" class="w1" style="text-align: left">
                <b>小计</b>
            </td>
        </tr>
        <!-- 订单开始 -->
<%
    ArrayList<book_Information> books = (ArrayList<book_Information>) request.getAttribute("shoppingCart");
    float price = 0;
    for (int i=0;i<books.size();i++){
        book_Information book = books.get(i);
%>
        <tr>
            <td valign="top">
                <% out.print(i+1); %>
            </td>
            <td valign="top">
                <% out.print(book.name); %>
            </td>
            <td valign="top">
                ￥<% out.print(book.price_dangDang); %>
            </td>
            <td valign="top">
                <% int num = BookDao.bookNum(book.id); out.print(num); %>
            </td>
            <td valign="top">
                <% out.print(num * book.price_dangDang); price += num * book.price_dangDang; %>
            </td>
        </tr>
<% } %>

        <%--<tr>
            <td valign="top">
                1
            </td>
            <td valign="top">
                霸王别姬
            </td>
            <td valign="top">
                ￥180.0
            </td>
            <td valign="top">
                1
            </td>
            <td valign="top">
                180.0
            </td>
        </tr>


        <tr>
            <td valign="top">
                2
            </td>
            <td valign="top">
                霸王别姬
            </td>
            <td valign="top">
                ￥180.0
            </td>
            <td valign="top">
                1
            </td>
            <td valign="top">
                180.0
            </td>
        </tr>

        <tr>
            <td valign="top">
                3
            </td>
            <td valign="top">
                霸王别姬
            </td>
            <td valign="top">
                ￥180.0
            </td>
            <td valign="top">
                1
            </td>
            <td valign="top">
                180.0
            </td>
        </tr>--%>


        <!-- 订单结束 -->
        <tr>
            <td valign="top" class="w1" style="text-align: left" colspan="5">
                <b>总价￥
                    <% out.print(price); %>
                </b>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <div class="login_in">
        <input id="cancel" class="button_1" type="button" value="取消" onclick="quxiao('order_info')"/>
        <input id="next" class="button_1" type="button" onclick="javascrtpt:window.location.href='/address_from'" value="下一步" />
    </div>

</div>
<%--<%@include file="common/foot1.jsp"%>--%>
</body>
</html>
