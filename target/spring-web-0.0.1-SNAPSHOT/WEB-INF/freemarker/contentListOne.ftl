<html lang="en-US">
<head>
<#--<meta charset="UTF-8">-->
    <title>hello</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="/spring-web/css/list.css" rel="stylesheet">
</head>
<#include "headtemplate.ftl">

      <body>
                <div class="img">
                    <div class="desc"> ${content.title}</div>
                    <#if content.mark!=0 >
                        <div class="desc">已购买</div>
                    <#else >
                        <div class="desc">未购买</div>
                    </#if>
                    <a target="_blank" href="#">
                        <img src="/spring-web/image/${content.img}"  alt="Ballade" width="160" height="160">
                    </a>

                    <div class="desc">${content.currentPrice}</div>
                </div>
                <#if Session.userName?exists>
                     <div class="desc">${content.summary}</div>
                     <div class="desc">${content.body}</div>
                    <#if Session.userName=="buyer">
                        <#if content.mark==0>
                            <div><a href="/spring-web/api/shopcar/add?contentId=${content.id}">添加到购物车</a></div>
                        <#else>
                        <div class="desc">${content.buyPrice}</div>
                        </#if>
                    <#elseif Session.userName="seller">
                    <div><a href="/spring-web/api/content/updatepre/${content.id}">编辑</a></div>
                    </#if>
                    </br></br></br></br></br></br></br></br></br></br>

                <#else>

                </#if>
                <script src="https://code.jquery.com/jquery.js"></script>
                <!-- 包括所有已编译的插件 -->
                <script src="js/bootstrap.min.js"></script>
    </body>

</html>