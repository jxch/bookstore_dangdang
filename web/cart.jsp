<%@ page import="Dao.book_Information" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Dao.BookDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>当当图书 – 全球最大的中文网上书店</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link href="css/book.css" rel="stylesheet" type="text/css" />
    <link href="css/second.css" rel="stylesheet" type="text/css" />
    <link href="css/secBook_Show.css" rel="stylesheet" type="text/css" />
    <link href="css/shopping_vehicle.css" rel="stylesheet"
          type="text/css" />
    <link href="css/public_footer.css" rel="stylesheet" type="text/css" />
    <script src="jsp.js"></script>
</head>
<body onload="pageInit('cart')">
<br />
<br />
<div class="my_shopping">
    <img class="pic_shop" src="images/pic_myshopping.gif" />
</div>
<div id="div_no_choice">
    <div class="choice_title"></div>
<%
    ArrayList<book_Information> books = (ArrayList<book_Information>) request.getAttribute("shoppingCart");
    if (books.size() == 0){
%>
    <div class="no_select">
        您还没有选购任何商品[
        <a href="/bookList"> 继续挑选商品&gt;&gt;</a>]
    </div>
<% } %>

</div>
<div id="div_choice" class="choice_merch">
    <span id="cart_tips"></span><h2>您已选购以下商品</h2>
    <div class="choice_bord">
        <table class="tabl_buy" id="tbCartItemsNormal">
            <tr class="tabl_buy_title">
                <td class="buy_td_6">
                    <span>&nbsp;</span>
                </td>
                <td>
                    <span class="span_w1">商品名</span>
                </td>
                <td class="buy_td_5">
                    <span class="span_w2">市场价</span>
                </td>
                <td class="buy_td_4">
                    <span class="span_w3">当当价</span>
                </td>
                <td class="buy_td_1">
                    <span class="span_w2">数量</span>
                </td>
                <td class="buy_td_2">
                    <span>变更数量</span>
                </td>
                <td class="buy_td_1">
                    <span>删除</span>
                </td>
            </tr>
            <tr class='objhide'>
                <td colspan="8">
                    &nbsp;
                </td>
            </tr>
<%
    float price = 0;
    float price_dangDang = 0;
    for (int i=0;i<books.size();i++){
        book_Information book = books.get(i);
%>
            <tr class='td_no_bord'>
                <td style='display: none'>
                    <p><%out.print(book.id);%></p>
                </td>
                <td class="buy_td_6">
                    <span class="objhide"><img /> </span>
                </td>
                <td>
                    <a href="#"> <% out.print(book.name); %> </a>
                </td>
                <td class="buy_td_5">
                    <span class="c_gray"><% out.print(book.price); %></span>
                </td>
                <td class="buy_td_4">
                    &nbsp;&nbsp;
                    <span>￥<% out.print(book.price_dangDang); %> </span>
                </td>
                <td class="buy_td_1">
                    &nbsp;&nbsp; <% int num = BookDao.bookNum(book.id); out.print(num); %>
                </td>
                <td>
                    <input class="del_num" type="text" size="3"	id="num<%out.print(book.id);%>" value="1" />
                    <a onclick="changBookNum(<%out.print(book.id);%>)">变更</a>
                </td>
                <td>
                    <a onclick="delBook(<%out.print(book.id);%>)">删除</a>
                </td>
            </tr>
<%
        price += book.price * num;
        price_dangDang += book.price_dangDang * num;
    }

%>
<%--
            <tr class='td_no_bord'>
                <td style='display: none'>
                    商品ID
                </td>
                <td class="buy_td_6">
                    <span class="objhide"><img /> </span>
                </td>
                <td>
                    <a href="#"> 商品名称 </a>
                </td>
                <td class="buy_td_5">
                    <span class="c_gray">定价</span>
                </td>
                <td class="buy_td_4">
                    &nbsp;&nbsp;
                    <span>￥当当价 </span>
                </td>
                <td class="buy_td_1">
                    &nbsp;&nbsp;商品数目
                </td>

                <td>
                    <input class="del_num" type="text" size="3"	id="num3" value="4" />
                    <a href="javascript:;">变更</a>
                </td>
                <td>
                    <a href="#">删除</a>
                </td>
            </tr>
--%>
            <!-- 购物列表结束 -->
        </table>
        <div class="choice_balance">
            <div class="select_merch">
                <a href="/bookList"> 继续挑选商品&gt;&gt;</a>
            </div>
            <div class="total_balance">
                <div class="save_total">
                    您共节省：
                    <span class="c_red"> ￥<span id="total_economy">  <% out.print(price-price_dangDang); %>  </span> </span>
                    <span id='total_vip_economy' class='objhide'> ( 其中享有优惠： <span
                            class="c_red"> ￥<span id='span_vip_economy'>0.00</span> </span>
								) </span>
                    <span style="font-size: 14px">|</span>
                    <span class="t_add">商品金额总计：</span>
                    <span class="c_red_b"> ￥<span id='total_account'> <% out.print(price_dangDang); %> </span>
							</span>
                </div>
                <div id="balance" class="balance" >
                    <a name='checkout' onclick="jiesuan()">
                        <img src="images/butt_balance.gif" alt="结算" border="0" title="结算" />
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 用户删除恢复区 -->

<div id="divCartItemsRemoved" class="del_merch">

</div>
<br />
<br />
<br />
<!--页尾开始 -->

<div class="public_footer">
    <div class="public_footer_bottom">
        <div class="public_footer_icp" style="line-height: 48px;">
            Copyright (C) 当当网 2004-2008, All Rights Reserved
            <a href="#" target="_blank"><img
                    src="images/bottom/validate.gif" border="0" align="middle" />
            </a>
            <a href="#" target="_blank" style="color: #666;">京ICP证041189号</a>
        </div>
    </div>
</div>
<!--页尾结束 -->
</body>
</html>
