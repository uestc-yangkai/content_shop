<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!--<meta charset="UTF-8">-->
    <title>内容增加</title>
<#include "headtemplate.ftl">
    <script type="text/javascript">
        function upload(){
            $.ajax({
                url: 'http://localhost:8080/spring-web/api/content/upload',
                type: 'POST',
                cache: false,
                data: new FormData($('#form1')[0]),
                dataType:'json',
                processData: false,
                contentType: false
            }).done(function(data) {
                $( '#serverResponse').html(data["img"]);
                var a=data["img"];
                var filepath="/spring-web/image/"+a;
//                '<div><img src="filepath" ></div>'
//                '<img src="'+filepath+'" width="160" height="160" id="img" />'
                $( '#imgdiv').html('<img src="'+filepath+'" width="160" height="160"  />' +
                        '<input type="text" id="img" name="img" value="'+a+'"  hidden>');
            }).fail(function(data) {
                $( '#serverResponse').html(data.status + " : " + data.statusText + " : " + data.responseText);
            });
        }
    </script>

</head>
<body>
    <div id="serverResponse">

    </div>
 <!--<form action="/spring-web/api/content/add" method="post" enctype="multipart/form-data">-->
<!--标题 :<input type="text" id="title" name="title" placeholder="2-80字符"></br>-->
<!--摘要 :<input type="text" id="summary" name="summary" placeholder="2-40字符"></br>-->
<!--图片 :     <input type="radio" value="图片地址" id="image1" name="image1"/>-->
     <!--<input type="radio" value="本地上传" id="image2" name="image2"/>-->
     <!--<input type="file" name="file" id="file"/>-->
<!--正文 :<input type="text" id="body" name="body"></br>-->
<!--设定价格 :<input type="text" id="currentPrice" name="currentPrice"></br>-->
     <!--<input type="submit" value="发布" />-->
     <!--</form>-->
 <form action="" id="form1" method="post" enctype="multipart/form-data">
    <input type="file" name="file" id="file"/>
     <input type="button" value="上传文件" onclick="upload()">
 </form>
 <form action="/spring-web/api/content/add" method="post"  id="form2" role="form">
     <#--<input type="file" name="file1" id="file1"/>-->
     <#--<input type="button" onclick="UpladFile()" value="上传" />-->

     <!--<input type="submit" value="上传文件">-->
         <div id="imgdiv">
         </div>
     <div class="form-group">
         <label for="title">标题</label>
         <input type="text" class="form-control"  id="title" name="title" placeholder="2-80字符" >
     </div>
     <div class="form-group">
     <label for="summary">摘要</label>
     <input type="text" class="form-control"  id="summary" name="summary" placeholder="2-40字符">
 </div>
     <div class="form-group">
         <label for="body">正文</label>
         <textarea aria-describedby="2-1000个字符" class="form-control" id="body" name="body"></textarea></br>
     </div>
     <div class="form-group">
         <label for="currentPrice">价格</label>
         <input type="text" class="form-control"  id="currentPrice" name="currentPrice" placeholder="2-40字符">
     </div>
         <input type="submit" value="发布" />
 </form>
 <#if errors?exists>
     <#list errors as error>
     ${error.defaultMessage}
     </#list>
 </#if>
 <#if msg?exists>
        ${msg}
 </#if>

 <script src="https://code.jquery.com/jquery.js"></script>
 <!-- 包括所有已编译的插件 -->
 <script src="js/bootstrap.min.js"></script>
</body>
</html>