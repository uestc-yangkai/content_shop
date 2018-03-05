
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


<div style="height: 50px;background-color: red" >

    <div  style="height: 50px;width: 33%;float: left" id="login"><a href="/spring-web/api/user/logout">退出</a></div>
    <div  style="height: 50px;width: 33%;float:right" id="begin"><a href="/spring-web/api/content/list">首页</a></div>
    <div  style="height: 50px;width: 34%;float:right" id="begin"><a href="/spring-web/api/content/addpre">发布</a></div>
</div>

