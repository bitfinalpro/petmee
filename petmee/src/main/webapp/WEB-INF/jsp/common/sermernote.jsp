<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- include libraries(jQuery, bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <!-- include summernote css/js -->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
    <!-- include summernote-ko-KR -->
    <script src="./js/summernote-ko-KR.js"></script>


    <title>시바 먼치킨</title>
    <style>
        #y-content {
            overflow: hidden;
        }

        .midle-btn {
            text-align: center;
        }

        .midle-btn>button {
            width: 100px;
            height: 50px;
            font-size: 20px;
            right: 25px;
        }

        #yy-img {
            margin-bottom: 20px;
        }

        .yy-img {
            width: 140px;
            height: 180px;
            border: 1px solid black;
            pointer-events: none;
        }
    </style>
</head>


<body>
    <div id="y-content">
        <form method="post" name="">
            <div id="yy-img">
                <div class="yy-img">썸네일을 넣어주세요</div>
                <input type="file" name="yy-img">
            </div>
            <textarea id="summernote" name="editordata">
            </textarea>
            <div class="midle-btn">
                <button id="y-regist">등록</button>
                <button type="button" id="return-list">목록</button>
            </div>
        </form>
    </div>

    <script>
        $(document).ready(function () {
            $('#summernote').summernote({
                lang: 'ko-KR', // default: 'en-US'
                height: 500,
                width: 1080,
                toolbar: [
                    ['style', ['style']],
                    ['font', ['bold', 'underline', 'clear']],
                    ['color', ['color']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['table', ['table']],
                    ['insert', ['link', 'picture', 'video']],
                    ['view', ['fullscreen', 'codeview', 'help']],
                ],
                disableResizeEditor: true
            });
        });
    </script>
</body>

</html>