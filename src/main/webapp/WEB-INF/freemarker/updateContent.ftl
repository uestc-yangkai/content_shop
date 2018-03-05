<html lang="en-US">
    <head>
    <#--<meta charset="UTF-8">-->
        <title>hello</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link href="/spring-web/css/list.css" rel="stylesheet">
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
        <form action="" id="form1" method="post" enctype="multipart/form-data">
            <input type="file" name="file" id="file"/>
            <input type="button" value="上传文件" onclick="upload()">
        </form>
            <form action="/spring-web/api/content/update" method="post" role="form" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="title">标题</label>
                    <input type="text" class="form-control"  id="title" name="title" placeholder="2-80字符" value="${content.title}">
                 </div>

                <input type="text" value="${content.id}" id="id" name="id" hidden/>
                <div class="form-group" id="imgdiv">
                    <img src="/spring-web/image/${content.img}"  alt="Ballade" width="160" height="160" >
                </div>
                <input type="text"  id="preImg" name="preImg" value="${content.img}" hidden>
                <div class="form-group">
                    <label for="summary">摘要</label>
                    <input type="text" class="form-control"  id="summary" name="summary" placeholder="2-40字符"  value=" ${content.summary}">
                </div>
                <div class="form-group">
                    <label for="body">正文</label>
                    <textarea aria-describedby="2-1000个字符" class="form-control" id="body" name="body" >${content.body}</textarea></br>
                </div>
                <div class="form-group">
                    <label for="currentPrice">价格</label>
                    <input type="text" class="form-control"  id="currentPrice" name="currentPrice" placeholder="2-40字符" value="${content.currentPrice?c}">
                </div>
                <input type="submit" value="修改" />
            </form>
            <script src="https://code.jquery.com/jquery.js"></script>
            <!-- 包括所有已编译的插件 -->
            <script src="js/bootstrap.min.js"></script>
    </body>

</html>