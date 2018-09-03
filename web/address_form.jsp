
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>生成订单 - 当当网</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/login.css" rel="stylesheet" type="text/css" />
    <link href="css/page_bottom.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.5.min.js"></script>
    <script type="text/javascript" src="jsp.js"></script>
</head>
<body onload="pageInit('address_form')">
<%--<%@include file="common/head1.jsp"%>--%>
<div class="login_step" id="user_address_form">
    生成订单骤: 1.确认订单 &gt;
    <span class="red_bold"> 2.填写送货地址</span> &gt; 3.订单成功
</div>
<p style="display: none" id="sign"><%int sign = (int) request.getAttribute("sign");out.print(sign);%></p>
<div class="fill_message">
    <form name="ctl00" method="post" id="f">
        <input type="hidden" id="userId"  name="userId" value="#" />

        <table class="tab_login">
            <tr>
                <td valign="top" class="w1">
                    收件人姓名：
                </td>
                <td>
                    <input type="text" class="text_input" name="name"
                           id="receiveName" />
                    <div class="text_left" id="nameValidMsg">
                        <p>
                            请填写有效的收件人姓名<font color="red">*(带星号的必须填写)</font>
                        </p>

                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top" class="w1">
                    收件人详细地址：
                </td>
                <td>
                    <input type="text" name="address" class="text_input"
                           id="fullAddress" />
                    <div class="text_left" id="addressValidMsg">
                        <p>
                            请填写有效的收件人的详细地址<font color="red">*</font>
                        </p>
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top" class="w1">
                    邮政编码
                </td>
                <td>
                    <input type="text" class="text_input" name="zipCode"
                           id="postalCode" />
                    <div class="text_left" id="codeValidMsg">
                        <p>
                            请填写有效的收件人的邮政编码<font color="red">*</font>
                        </p>
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top" class="w1">
                    电话
                </td>
                <td>
                    <input type="text" class="text_input" name="telephone"
                           id="phone" />
                    <div class="text_left" id="phoneValidMsg">
                        <p>
                            请填写有效的收件人的电话
                        </p>
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top" class="w1">
                    手机
                </td>
                <td>
                    <input type="text" class="text_input" name="mobilePhone"
                           id="mobile" />
                    <div class="text_left" id="mobileValidMsg">
                        <p>
                            请填写有效的收件人的手机<font color="red">*</font>
                        </p>
                    </div>
                </td>
            </tr>
        </table>

        <div class="login_in">

            <input id="cancel" class="button_1" type="button" onclick="quxiao('address_form')" value="取消" />
            <input id="next" class="button_1" type="submit"  value="下一步" />
            <%--<input id="next" class="button_1" type="submit"  disabled="disabled" value="下一步" />--%>

        </div>
    </form>
</div>
<%--<%@include file="common/foot1.jsp"%>--%>
</body>
</html>
