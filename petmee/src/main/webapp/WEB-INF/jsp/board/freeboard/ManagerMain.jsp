<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="./css/manager.css" rel="stylesheet">
    <script src="./js/jquery-1.11.1.min.js"></script>
    <title>Document</title>
</head>
<body>
        <div class="home">
            <div id="header"> 
            </div>
            <div id="contents" class="main-contents">
                <section>
                 
                </section>
            </div>
            <div id="footer" class="footer_wrap clearfix"> </div>
        </div>
        
    </body>
    <script type="text/javascript">
        $(document).ready(function(){
           $("#header").load("managermenu.html")    
        });
        $(document).ready(function(){
           $("#footer").load("footer.html")    
        });
    </script>    
</html>