<html lang="en-US">
    <head>
    <#--<meta charset="UTF-8">-->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
            <div  style="background-color: azure;height: 50px;color: brown">已购买的内容</div>
            <table style="background-color: aliceblue;width: 100%;">
                <thead> <td>内容图片</td><td>内容名称</td><td>购买时间</td><td>购买数量</td><td>购买价格</td></thead>
            <#list billViewList as billview>
            <tr>
                <td><a href="/spring-web/api/content/listone?contentId=${billview.contentId}">
                        <img src="/spring-web/image/${billview.img}"  alt="Ballade" width="60px" height="60px"></a></td>
                 <td>${billview.title}</td>
                 <td>${billview.buyDate}</td>
                 <td>${billview.count}</td>
                  <td>  ${billview.buyPrice}</td>
             </tr>
            </#list>
                <tr><td></td><td></td><td></td><td></td>
                    <td>总计：${sumPrice}</td>
                </tr>
            </table>

</html>