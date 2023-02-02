<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<h2>commentTest</h2>
<button id="sendBtn" type="button">SEND</button>
<div id="commentList"></div>
<script>

    let bno = 1085;

    let showList = function(bno) {
        $.ajax({
            type:'GET',       // 요청 메서드
            url: '/ch4/comments?bno='+bno,  // 요청 URI
            success : function(result){
                $("#commentList").html(toHtml(result));
            },
            error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
    }

    $(document).ready(function(){
        $("#sendBtn").click(function(){
            showList(bno);
        });
    });

    let toHtml = function(comments) {
        let tmp = "<ul>";

        comments.forEach(function(comment){
            tmp += '<li data-cno='+ comment.cno
            tmp += ' data-pcno='+ comment.pcno
            tmp += ' data-bno='+ comment.bno + '>'
            tmp += ' commenter=<span class="commenter">'+comment.commenter + '</span>'
            tmp += ' comment=<span class="comment">'+comment.comment + '</span>'
            tmp += ' up_date='+comment.up_date
            tmp += '</li>'
        })

        return tmp + "</ul>";
    }
</script>
</body>
</html>