<!DOCTYPE html>
<html>
    <head>
        <title>Occurrences Import</title>
        <meta name="layout" content="main" />
        <r:require modules="sockets" />
        <style type="text/css">
            .progress {
                height: 10px !important;
            }
            #import-info-web-socket {
                height: 400px;
                overflow-y: scroll;
            }
        </style>
    </head>
    <body>
        <div>
            <!-- Breadcrumb -->
            <ol class="breadcrumb">
                <li><a class="font-xxsmall" href="../">Home</a></li>
                <li class="font-xxsmall active" href="#">Import</li>
            </ol>
            <!-- End Breadcrumb -->
            <h2 class="heading-medium">Occurrence data import</h2>

            <p class="lead">
                Augment taxon names with occurrences data - is name located in host country, index number of records. Note SOLR cores (bie / bie-offline) require swapping before searches will appear.
            </p>

            <div>
                <button id="start-import" onclick="javascript:loadOccurrenceInfo()" class="btn btn-primary">Add occurrence information</button>
            </div>

            <div class="well import-info alert-info hide" style="margin-top:20px;">
                <p></p>
                <div class="progress hide">
                    <div class="progress-bar" style="width: 0%;" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                        <span class="sr-only"><span class="percent">0</span>% Complete</span>
                    </div>
                </div>
                <div id="import-info-web-socket"></div>
            </div>

            <r:script>
                function loadOccurrenceInfo(){
                    $.get("${createLink(controller:'import', action:'importOccurrences')}", function( data ) {
                      if(data.success){
                        $('.import-info p').html('Import successfully started....')
                        $('#start-import').prop('disabled', true);
                      } else {
                        $('.import-info p').html('Import failed. Check file path...')
                      }
                      $('.import-info').removeClass('hide');
                      $('.progress').removeClass('hide');
                    });
                }
            </r:script>

            <r:script>
                $(function() {
                    var socket = new SockJS("${createLink(uri: '/stomp')}");
                    var client = Stomp.over(socket);
                    client.connect({}, function() {
                        client.subscribe("/topic/import-feedback", function(message) {
                            var msg = $.trim(message.body);
                            if ($.isNumeric(msg)) {
                                // update progress bar
                                console.log('msg', msg);
                                $('.progress-bar ').css('width', msg + '%').attr('aria-valuenow', msg);
                                $('.progress-bar span.percent').html(msg);
                            } else {
                                // just a message
                                $("#import-info-web-socket").append('<br/>' + message.body);
                                $('#import-info-web-socket').scrollTop(1E10); // keep at bottom of div
                            }
                        });
                    });
                });
            </r:script>
        </div>
    </body>
</html>
