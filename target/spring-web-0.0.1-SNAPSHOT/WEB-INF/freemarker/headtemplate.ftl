
<#--<#if (userName)=="buyer">-->
<#--买家你好，buyer!-->
<#--<a href="/spring-web/api/user/logout">退出</a>-->
<#--<a href="/spring-web/api/content/list">首页</a>-->
<#--<a href="/spring-web/api/user/logout">账务</a>-->
<#--<a href="/spring-web/api/shopcar/list">购物车</a>-->
<#--<a href="/spring-web/api/content/list">所有内容</a>-->
<#--<a href="/spring-web/api/content/nobuy">未购买内容</a>-->
<#--<#elseif (userName)=="seller">-->
<#--卖家你好，seller!-->
<#--<a href="/spring-web/api/user/logout">退出</a>-->
<#--<a href="/spring-web/api/content/list">首页</a>-->
<#--<a href="/spring-web/api/content/addpre">发布</a>-->
<#--<#else >-->
<#if Session.userName?exists>
    <#if Session.userName=="buyer">
        <#include "headbuyer.ftl">
    <#elseif Session.userName="seller">
        <#include "headseller.ftl">
    </#if>
<#else >
    <#include "head.ftl">
</#if>
