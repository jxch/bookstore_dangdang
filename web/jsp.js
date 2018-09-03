var db = openDatabase("UserLogin", "", "user database", 1024 * 10);

function IsLogin() {
    db.transaction(function (tx) {
        tx.executeSql("CREATE TABLE IF NOT EXISTS user(name,email)", []);
        tx.executeSql("SELECT * FROM user", [], function (tx, rs) {
            if (rs.rows.length == 0) {
                alert("请先登陆");
                self.location = '/login_jsp';
            } else {
                var email = rs.rows.item(0).email;
                var username = rs.rows.item(0).name;
                var user_1 = document.getElementById("user_1");
                var user_2 = document.getElementById("user_2");
                var user1 = document.getElementById("user1");
                var user2 = document.getElementById("user2");
                user1.style.display = "none";
                user2.style.display = "none";
                var name = document.createElement("a");
                name.href = "/shoppingCart?username=" + username;
                name.name = "mydangdang";
                name.className = "head_black12a";
                name.innerHTML = username;
                var WriteOff = document.createElement("a");
                WriteOff.href = "/bookList";
                WriteOff.name = "helpcenter";
                WriteOff.className = "head_black12a";
                WriteOff.target = "_blank";
                WriteOff.innerHTML = "注销";
                WriteOff.onclick = function () {
                    Write_Off(email);
                };
                var userName = document.createElement("p");
                userName.style.display = "none";
                userName.id = "userName";
                userName.innerHTML = username;
                user_1.appendChild(name);
                user_2.appendChild(WriteOff);
                user_1.appendChild(userName);
            }
        })
    })

    var bookNum = document.getElementById("bookNum").innerText;
    if (parseInt(bookNum) == 0) {
        history.go(-1);
    }
}

function Write_Off(email) {
    db.transaction(function (tx) {
        tx.executeSql("CREATE TABLE IF NOT EXISTS user(name,email)", []);
        tx.executeSql("DELETE FROM user WHERE email=?", [email], function () {
                alert("注销成功");
            },
            function (error) {
                alert(error.source + "::" + error.message);
            }
        )

    })
}

function LoginIN() {

    db.transaction(function (tx) {
        tx.executeSql("SELECT * FROM user", [], function (tx, rs) {
            if (rs.rows.length != 0) {
                tx.executeSql("DELETE FROM user WHERE email=?", [rs.rows.item(0).email]);
            }
        });
    });
    var s = document.getElementById("sign");
    var sign = document.getElementById("sign").innerHTML;
    if (sign == "0") {
        var email = document.getElementById("userEmail").innerHTML;
        var name = document.getElementById("name").innerHTML;
        db.transaction(function (tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS user(name,email)", []);
            tx.executeSql("INSERT INTO user (name,email) VALUES (?,?)", [name, email], function () {
                    alert("登陆成功");
                },
                function (error) {
                    alert(error.source + "::" + error.message);
                }
            )
        });
        self.location = '/bookList';
    } else if (sign == "1") {
        alert("密码错误");
        s.innerHTML = "3";
    } else if (sign == "2") {
        alert("请先注册");
        self.location = "/register_jsp";
        s.innerHTML = "3";
    } else if (sign == "3") {
        alert("请先验证");
        s.innerHTML = "3";
    } else if (sign == "4") {
        alert("你已经注册过，请登录");
        s.innerHTML = "3";
    }
}

function init() {
    var sign = document.getElementById("sign");
    sign.innerHTML = "3";
    var yanZh = document.getElementById("yanZh");
    yanZh.innerHTML = "";
}

function username(ser, id) {
    var name = document.getElementById("userName").innerHTML;
    var user = document.getElementById(id);
    user.href = "/" + ser + "?username=" + name;

}

function pageInit(sign) {
    db.transaction(function (tx) {
        tx.executeSql("CREATE TABLE IF NOT EXISTS user(name,email)", []);
        tx.executeSql("SELECT * FROM user", [], function (tx, rs) {
            if (rs.rows.length == 0) {
                if (sign != "register") {
                    alert("请先登陆");
                    self.location = '/login_jsp';
                } else {
                    var ss = document.getElementById("registerU");
                    var s = ss.innerHTML;
                    var text = document.getElementById("nameInfo");
                    if (s == "0") {
                        alert("请认真填写以下信息");
                        text.innerHTML = "";
                    } else if (s == "1") {
                        text.innerHTML = "该用户名已经注册过,请重新填写";
                        ss.innerHTML = "0";
                    } else if (s == "2") {
                        alert("该账号已经注册过，请重新填写或者直接登陆");
                        ss.innerHTML = "0";
                    } else if (s == "3") {
                        alert("你输入的信息格式不对，请重新输入");
                        ss.innerHTML = "0";
                    }
                }
            } else if (sign == "cart") {
                var user = document.getElementById("cart_tips");
                user.innerHTML = rs.rows.item(0).name;
            } else if (sign == "order_info") {
                var user_order_info = document.getElementById("user_order_info");
                var username_order_info = document.createElement("p");
                username_order_info.innerHTML = rs.rows.item(0).name;
                username_order_info.id = "username_order_info";
                username_order_info.style.display = "none";
                user_order_info.appendChild(username_order_info);
            } else if (sign == "address_form") {
                var user_address_form = document.getElementById("user_address_form");
                var username_address_form = document.createElement("p");
                username_address_form.innerHTML = rs.rows.item(0).name;
                username_address_form.id = "username_address_form";
                username_address_form.style.display = "none";
                user_address_form.appendChild(username_address_form);
                var f = document.getElementById("f");
                f.action = "addOrder?username=" + rs.rows.item(0).name;
                var sig = document.getElementById("sign");
                var si = sig.innerHTML;
                if (si == "0") {
                    alert("请认准填写以下信息");
                } else if (si == "1") {
                    alert("你填写的信息格式有误，请检查后填写");
                    sig.innerHTML = "0";
                }
            }
        })
    })
}

function changBookNum(id) {
    var number = document.getElementById("num" + id).value;
    var user = document.getElementById("cart_tips").innerHTML;
    self.location = "addShoppingCart?id=" + id + "&username=" + user + "&number=" + number;
}

function add_cart(id) {
    var name = document.getElementById("userName").innerHTML;
    var num = -1;
    self.location = "addShoppingCart?id=" + id + "&username=" + name + "&number=" + num;
}

function jiesuan() {
    var user = document.getElementById("cart_tips").innerHTML;
    self.location = "confirmOrder?username=" + user;
}

function quxiao(name) {
    var user = document.getElementById("username_" + name).innerHTML;
    self.location = "shoppingCart?username=" + user;
}

function pwd() {
    var pwd1 = document.getElementById("txtPassword");
    var pwd2 = document.getElementById("txtRepeatPass");
    var text = document.getElementById("password1Info");
    if (pwd1.value == "") {
        text.innerHTML = "密码不能为空";
    }
    if (pwd1.value == pwd2.value) {
        text.innerHTML = "密码可用";
    } else {
        text.innerHTML = "密码不一致，请重新输入";
        pwd2.value = "";
    }
    Email();
}

function Email() {
    var email = document.getElementById("email");
    var text = document.getElementById("emailInfo");
    var str = email.value;
    var sign = str.indexOf("@");
    var sign2 = str.indexOf(".");
    if (sign == -1 || sign2 == -1 || sign2 <= sign) {
        text.innerHTML = "此邮箱无效，请重新填写";
        email.value = "";
    } else {
        text.innerHTML = "";
    }
}

function delBook(id) {
    var user = document.getElementById("cart_tips");
    self.location = "/delShoppingCartBook?id=" + id + "&user=" + user.innerText;
}