<!DOCTYPE html>
<html>
    <head>
        <title>Regions</title>
        <meta name="layout" content="main" />
        <r:require modules="sockets" />
    </head>
    <body>
        <div>
            <!-- Breadcrumb -->
            <ol class="breadcrumb">
                <li><a class="font-xxsmall" href="../">Home</a></li>
                <li class="font-xxsmall active" href="#">Import</li>
            </ol>
            <!-- End Breadcrumb -->
            <h2 class="heading-medium">Regions import</h2>

            <p class="lead">
                Reload regions information into the main search index
            </p>

            <div>
                <button id="start-import" onclick="javascript:loadInfo()" class="btn btn-primary">Import regions information</button>
            </div>

            <div class="well import-info alert-info hide" style="margin-top:20px;">
                <p></p>
                <p id="import-info-web-socket"></p>
            </div>

            <r:script>
                function loadInfo(){
                    $.get("${createLink(controller:'import', action:'importRegions')}", function( data ) {
                      if(data.success){
                        $('.import-info p').html('Import successfully started....')
                        $('#start-import').prop('disabled', true);
                      } else {
                        $('.import-info p').html('Import failed. Check file path...')
                      }
                      $('.import-info').removeClass('hide');
                    });
                }
            </r:script>
            <r:script>
                $(function() {
                    var socket = new SockJS("${createLink(uri: '/stomp')}");
                    var client = Stomp.over(socket);
                    client.connect({}, function() {
                        client.subscribe("/topic/import-feedback", function(message) {
                            $("#import-info-web-socket").append('<br/>' + message.body);
                        });
                    });
                });
            </r:script>
        </div>
    </body>
</html>
