<%@ page import="java.util.ArrayList" %>
<%@ page import="Dao.book_Information" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>当当图书 – 全球最大的中文网上书店</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <link href="css/book.css" rel="stylesheet" type="text/css"/>
    <link href="css/second.css" rel="stylesheet" type="text/css"/>
    <link href="css/secBook_Show.css" rel="stylesheet" type="text/css"/>
    <link href="css/list.css" rel="stylesheet" type="text/css"/>
    <link href="css/book_head090107.css" rel="stylesheet"
          type="text/css"/>
    <link href="css/public_footer.css" rel="stylesheet" type="text/css"/>
    <script src="jsp.js"></script>
</head>
<body onload="IsLogin()">

<div style="width: 962px; margin: auto;">
    <a href="#"><img src="images/default/book_banner_081203.jpg"
                     border="0"/> </a>
</div>
<!-- 头部开始 -->
<div class="head_container">
    <div class="head_welcome">
        <div class="head_welcome_right">
            <span class="head_welcome_text"> </span>
            <span class="head_welcome_text">
                <span class="little_n"> |
                    <span id="user_1"><a href="/login_jsp" name="mydangdang" class="head_black12a"
                                         id="user1">登录</a></span> |
					<span id="user_2"><a href="/register_jsp" name="helpcenter" class="head_black12a" target="_blank"
                                         id="user2">注册</a></span> |
                </span>
            </span>
            <div class="cart gray4012" onclick="username('shoppingCart','user')">
                <%--<a href="/shoppingCart?username=jxc">购物车</a>--%>
                <a id="user">购物车</a>
            </div>
        </div>
    </div>
    <div class="head_head_list">
        <div class="head_head_list_left">
					<span class="head_logo"><a href="/bookList" name="backtobook"><img
                            src="images/booksaleimg/book_logo.gif"/> </a> </span>
        </div>
        <div class="head_head_list_right">

            <div class="head_head_list_right_b">
            </div>
        </div>
    </div>
</div>
<!-- 头部结束 -->

<div class="book">

    <!--左栏开始-->
    <div id="left" class="book_left">
    </div>
    <!--左栏结束-->
    <input type="text" id="findBook">
    <button onclick="findBookName()">搜索</button>
    <script>
        function findBookName() {
            var bookName = document.getElementById("findBook").value;
            self.location = "/bookList?bookName=" + bookName;
        }
    </script>

    <%--导航栏--%>

    <div class="class">
        <p>导航栏</p>
        <%
            ArrayList<String> bookClass = (ArrayList<String>) request.getAttribute("bookClass");
            for (int i = 0; i < bookClass.size(); ++i) {
        %>
        &emsp;
        <a style="display: inline-block"
           href="${pageContext.request.contextPath}/bookList?bookName=class::<%out.print(bookClass.get(i));%>"><%
            out.print(bookClass.get(i)); %></a> &emsp;
        <%
            }
        %>
    </div>

    <!--中栏开始-->
    <div class="book_center">

        <!--图书列表开始-->
        <div id="divRight" class="list_right">

            <div id="book_list" class="list_r_title">
                <div>
                    您现在的位置:&nbsp;
                    <a href="#" style="font-size: 12pt;font-family: sans-serif;color: white">图书热卖场</a>
                </div>
            </div>

            <!--商品条目开始-->
            <div class="list_r_line"></div>
            <div class="clear"></div>
            <%
                ArrayList<book_Information> books = (ArrayList<book_Information>) request.getAttribute("books");
                for (int i = 0; i < books.size(); i++) {
                    book_Information book = books.get(i);
            %>
            <div class="list_r_list">
						<span class="list_r_list_book">
                            <a target='_blank' name="link_prd_img" href='#'>
                             <%
                                 out.print("<img title=\"" + book.name + "\" class=\"dang_img\" src='" + book.image_Path + "'/>"); %>
                            </a>
                        </span>
                <h2>
                    <a target='_blank' name="link_prd_name"
                       href='#'>
                        <% out.print(book.name); %>
                    </a>
                </h2>
                <h3>
                    顾客评分：<% out.print(book.fraction); %>
                </h3>
                <h4 class="list_r_list_h4">
                    作 者:
                    <a href='#' name='作者'>
                        <% out.print(book.author); %>
                    </a>
                </h4>
                <h4>
                    出版社：
                    <a href='#' name='出版社'>
                        <% out.print(book.press); %>
                    </a>
                </h4>
                <h4>
                    出版日期：<% out.print(book.publication_date); %>
                </h4>
                <h5>
                    <% out.print(book.introduction); %>
                </h5>
                <div class="clear"></div>
                <h6>
                    <span class="del">定价: <% out.print(book.price); %></span>
                    <span class="red">当当价: <% out.print(book.price_dangDang); %></span> 节省：￥<%
                    float price = book.price - book.price_dangDang;
                    out.print(price);
                %>
                </h6>
                <span class="list_r_list_button">
                    <a onclick="add_cart(<%out.print(book.id); %>)"><img align="top"
                                                                         src='images/buttom_goumai.gif'/></a>
                    <%--<img align="top" src='images/buttom_goumai.gif' onclick="javascript:window.location.href='cart.jsp'"/>--%>
                    <%--<a href="/addShoppingCart?id=<% out.print(book.id); %>" id="addCart">加入购物车</a>--%>
                    <%--<a href="/addShoppingCart?id=<% out.print(book.id); %>&username=jxc">加入购物车</a>--%>
                </span>
                <span id="cartInfo_1"></span>
            </div>
            <%
                }
            %>

            <div style="display: none" id="bookNum"><% out.print(books.size()); %></div>

            <div>
                <button style="display: inline-block" onclick="page(-1)">上一页</button>
                <input style="display:inline-block;width: 40px" type="text" id="pageNum">
                <button style="display: inline-block" onclick="page(1)">下一页</button>
                <button style="display: inline-block" onclick="page(0)">跳转</button>

                <script>
                    function page(num) {
                        var url = self.location.href;
                        var bookNameIndex = url.indexOf("?");
                        var bookListIndex = url.indexOf("/bookList");
                        var numIndex = url.indexOf("num=");
                        var pageNumber = document.getElementById("pageNum").value;
                        if (numIndex == -1) {
                            if (bookListIndex == -1 && num != -1) {
                                if (num == 1) {
                                    url += "/bookList?num=" + (num + 1);
                                } else if (num == 0) {
                                    url += "/bookList?num=" + pageNumber;
                                }
                            } else if (bookNameIndex == -1 && num != -1) {
                                if (num == 1) {
                                    url += "?num=" + (num + 1);
                                } else if (num == 0) {
                                    url += "?num=" + pageNumber;
                                }
                            } else if (num != -1) {
                                if (num == 1) {
                                    url += "&num=" + (num + 1);
                                } else if (num == 0) {
                                    url += "&num=" + pageNumber;
                                }
                            }
                        } else {
                            var urlArr = url.split("num=");
                            if (num == 1) {
                                url = urlArr[0] + "num=" + (parseInt(urlArr[1]) + num);
                            } else if (num == -1 && parseInt(urlArr[1]) - 1 > 0) {
                                url = urlArr[0] + "num=" + (parseInt(urlArr[1]) + num);
                            } else if (num == 0) {
                                url = urlArr[0] + "num=" + pageNumber;
                            }
                        }
                        self.location = url;
                    }
                </script>
            </div>
            <%-- <div class="list_r_list">
                         <span class="list_r_list_book"><a target='_blank'
                                                           name="link_prd_img" href='#'> <img
                                 title="上课头疼的故事" class="dang_img"
                                 src='productImages/1.jpg'/> </a> </span>
                 <h2>
                     <a target='_blank' name="link_prd_name"
                        href='#'>上课头疼的故事</a>
                 </h2>
                 <h3>
                     顾客评分：100
                 </h3>
                 <h4 class="list_r_list_h4">
                     作 者:
                     <a href='#' name='作者'>我写的</a>
                 </h4>
                 <h4>
                     出版社：
                     <a href='#' name='出版社'>地球出版社</a>
                 </h4>
                 <h4>
                     出版日期：2011-11-11
                 </h4>
                 <h5>
                     这真是一本好书啊
                 </h5>
                 <div class="clear"></div>
                 <h6>
                     <span class="del">定价</span>
                     <span class="red">当当价</span> 节省：￥200
                 </h6>
                 <span class="list_r_list_button"> <img align="top"
                                                        src='images/buttom_goumai.gif'
                                                        onclick="javascript:window.location.href='cart.jsp'"/> </span>
                 <span id="cartInfo_1"></span>
             </div>


             <div class="list_r_list">
                         <span class="list_r_list_book"><a target='_blank'
                                                           name="link_prd_img" href=''> <img
                                 title="上课头疼的故事" class="dang_img"
                                 src='productImages/2.jpg'/> </a> </span>
                 <h2>
                     <a target='_blank' name="link_prd_name"
                        href='product.action?id=2'>上课头疼的故事</a>
                 </h2>
                 <h3>
                     顾客评分：100
                 </h3>
                 <h4 class="list_r_list_h4">
                     作 者:
                     <a href='#' name='作者'>我写的</a>
                 </h4>
                 <h4>
                     出版社：
                     <a href='#' name='出版社'>地球出版社</a>
                 </h4>
                 <h4>
                     出版日期：2011-11-11
                 </h4>
                 <h5>
                     这真是一本好书啊
                 </h5>
                 <div class="clear"></div>
                 <h6>
                     <span class="del">定价</span>
                     <span class="red">当当价</span> 节省：￥200
                 </h6>
                 <span class="list_r_list_button"> <img align="top"
                                                        src='images/buttom_goumai.gif'
                                                        onclick="javascript:window.location.href='cart.jsp'"/> </span>
                 <span id="cartInfo_2"></span>
             </div>


             <div class="list_r_list">
                         <span class="list_r_list_book"><a target='_blank'
                                                           name="link_prd_img" href=''> <img
                                 title="上课睡觉的故事" class="dang_img"
                                 src='productImages/3.jpg'/> </a> </span>
                 <h2>
                     <a target='_blank' name="link_prd_name"
                        href='product.action?id=3'>上课睡觉的故事</a>
                 </h2>
                 <h3>
                     顾客评分：100
                 </h3>
                 <h4 class="list_r_list_h4">
                     作 者:
                     <a href='#' name='作者'>我写的</a>
                 </h4>
                 <h4>
                     出版社：
                     <a href='#' name='出版社'>地球出版社</a>
                 </h4>
                 <h4>
                     出版日期：
                 </h4>
                 <h5>
                     这真是一本好书啊
                 </h5>
                 <div class="clear"></div>
                 <h6>
                     <span class="del">定价</span>
                     <span class="red">当当价</span> 节省：￥200
                 </h6>
                 <span class="list_r_list_button"> <img align="top"
                                                        src='images/buttom_goumai.gif'
                                                        onclick="javascript:window.location.href='cart.jsp'"/> </span>
                 <span id="cartInfo_3"></span>
             </div>


             <div class="list_r_list">
                         <span class="list_r_list_book"><a target='_blank'
                                                           name="link_prd_img" href=''> <img
                                 title="上课睡觉的故事" class="dang_img"
                                 src='productImages/4.jpg'/> </a> </span>
                 <h2>
                     <a target='_blank' name="link_prd_name"
                        href='product.action?id=4'>上课睡觉的故事</a>
                 </h2>
                 <h3>
                     顾客评分：100
                 </h3>
                 <h4 class="list_r_list_h4">
                     作 者:
                     <a href='#' name='作者'>我写的</a>
                 </h4>
                 <h4>
                     出版社：
                     <a href='#' name='出版社'>地球出版社</a>
                 </h4>
                 <h4>
                     出版日期：
                 </h4>
                 <h5>
                     这真是一本好书啊
                 </h5>
                 <div class="clear"></div>
                 <h6>
                     <span class="del">定价</span>
                     <span class="red">当当价</span> 节省：￥200
                 </h6>
                 <span class="list_r_list_button"> <img align="top"
                                                        src='images/buttom_goumai.gif'
                                                        onclick="javascript:window.location.href='cart.jsp'"/> </span>
                 <span id="cartInfo_4"></span>
             </div>--%>

            <div class="clear"></div>
            <!--商品条目结束-->

            <div class="clear"></div>
            <div id="divBottomPageNavi" class="fanye_bottom">
            </div>

        </div>
        <!--图书列表结束-->

    </div>
    <!--中栏结束-->
    <div class="clear"></div>
</div>

<!--页尾开始 -->

<div class="public_footer">
    <div class="public_footer_bottom">
        <div class="public_footer_icp" style="line-height: 48px;">
            Copyright (C) 当当网 2004-2008, All Rights Reserved
            <a href="#" target="_blank"><img
                    src="images/bottom/validate.gif" border="0" align="middle"/>
            </a>
            <a href="#" target="_blank" style="color: #666;">京ICP证041189号</a>
        </div>
    </div>
</div>
<!--页尾结束 -->
</body>
</html>
