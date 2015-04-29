<html>
<head>
<title>AJAX in Servlet using JQuery and JSON</title>
<script src="resource/js/jquery-1.11.2.min.js" type="text/javascript"></script>

<style type="text/css">
.main-content {
        padding: 20px;
}

.lightblue {
        background-color: rgb(185, 224, 243)
}

.page-content div {
        padding: 5px
}
</style>

<script>
        $(document).ready(function() {

                $('.ajax-link').click(function() {
                        $('.page-content').hide();
                        var category = $(this).attr("data-category");
                       // the URL for the request
                        $.get('ajaxAction', {
                                // Parameter to be sent to server side
                                category : category
                        });
                });
        });
</script>
</head>
<body>
     <div class="main-content">
        <div>
             <h3>Click on the links</h3>
              <ul>
                <li><a href="#" class="ajax-link" data-category="serial">Top 5 Serial</a></li>
                <li><a href="#" class="ajax-link" data-category="movies">Top 5 Movies</a></li>
                <li><a href="#" class="ajax-link" data-category="sports">Top 5 Sports</a></li>
              </ul>

                <h3>Result will be displayed below via Ajax</h3>
                <div class="page-content">
                        <div id="0"></div>
                        <div id="1"></div>
                        <div id="2"></div>
                        <div id="3"></div>
                        <div id="4"></div>
                </div>
        </div>                  
      </div>
</body>
</html>