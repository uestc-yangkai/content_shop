<html lang="en-US">
    <head>
    <#--<meta charset="UTF-8">-->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>结算页面</title>
        <title>账单页面</title>
        <style>
            table tr:hover
            {
                background-color:yellow;
            }
        </style>
     <#include "headtemplate.ftl">
    </head>

    <body>
            <div  style="background-color: #bebebe;height: 50px;color: bisque">已添加到购物车的内容</div>
            <table style="background-color: aliceblue;width: 100%;">
                <thead> <td>标题</td><td>当前价格</td><td>购买数量</td></thead>
            <#list carViewList as shopcar>
            <tr>
                <td><a href="/spring-web/api/content/listone?contentId=${shopcar.content_id}">${shopcar.title}</a></td>
                 <td>${shopcar.currentPrice}</td>
                  <td>  ${shopcar.count}</td>
             </tr>
            </#list>
            </table>
            <div style="width: 100%;">
            <a href="/spring-web/api/user/logout" style="color: aqua;width: 50%" >退出</a>
            <a href="/spring-web/api/bill/add" style="color: aqua;width: 50%" >购买</a>
            </div>
    </body>

</html>