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
    <body >
        <#if userName=="buyer">
            <ul class="nav nav-tabs">
                <li class="active"><a href="/spring-web/api/content/list">所有内容</a></li>
                <li ><a href="/spring-web/api/content/nobuy">未购买内容</a></li>
            </ul>
        <#else >
        <ul class="nav nav-tabs">
            <li class="active"><a href="/spring-web/api/content/list">所有内容</a></li>
        </ul>
        </#if>
            <#list contents as content>
                <div class="img">
                    <div class="desc"> ${content.title}</div>

                <#if Session.userName?exists>
                    <#if Session.userName=="buyer">
                        <#if content.mark!=0>
                            <div class="desc">已购买</div>
                        <#else >
                            <div class="desc">未购买</div>
                        </#if>
                    <#elseif Session.userName="seller">
                        <#if content.mark!=0>
                            <div class="desc">已售出</div>
                        <#else >
                            <div class="desc">未售出/<a href="/spring-web/api/content/del?contentId=${content.id}">删除</a></div>
                        </#if>

                    </#if>
                <#else >
                </#if>
                    <a target="_blank" href="/spring-web/api/content/listone?contentId=${content.id}">
                        <img src="/spring-web/image/${content.img}"  alt="Ballade" width="160" height="160">
                    </a>

                    <div class="desc">  ${content.body}</div>
                        <div class="desc">${content.currentPrice}</div>
                    <div class="desc"> ${content.summary}</div>
                </div>

            </#list>
            <script src="https://code.jquery.com/jquery.js"></script>
            <!-- 包括所有已编译的插件 -->
            <script src="js/bootstrap.min.js"></script>
    </body>

</html>