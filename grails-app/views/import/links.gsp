%{--
  - Copyright (C) 2016 Atlas of Living Australia
  - All Rights Reserved.
  - The contents of this file are subject to the Mozilla Public
  - License Version 1.1 (the "License"); you may not use this file
  - except in compliance with the License. You may obtain a copy of
  - the License at http://www.mozilla.org/MPL/
  - Software distributed under the License is distributed on an "AS
  - IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
  - implied. See the License for the specific language governing
  - rights and limitations under the License.
  --}%

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Build Links</title>
  <meta name="layout" content="${grailsApplication.config.skin.layout}"/>
    <style type="text/css">
        .progress {
            height: 10px !important;
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
    <h2 class="heading-medium">Build Links</h2>

    <p class="lead">
        Denormalise accepted taxa in the index, building links to higher-order taxa
        Scan the index for link identifiers; names that are unique and can be treated as an identifier.
        Scan the index for images; suitable images for various species.
        Note SOLR cores (bie / bie-offline) may require swapping before searches will appear.
    </p>

    <div>
        <button id="denormalise-taxa" onclick="javascript:denormaliseTaxa()" class="btn btn-primary">Denormalise Taxa</button>
    </div>
    <div>
        <button id="build-link-identifiers" onclick="javascript:buildLinkIdentifiers()" class="btn btn-primary">Build Link Identifiers</button>
    </div>
    <div>
        <button id="load-images" onclick="javascript:loadImages()" class="btn btn-primary">Load All Images</button>
    </div>
    <div>
        <button id="load-preferred-images" onclick="javascript:loadPreferredImages()" class="btn btn-primary">Load Preferred Images</button>
    </div>
    <div>
        <button id="dangling-synonyms" onclick="javascript:removeDanglingSynonyms()" class="btn btn-primary">Remove orphaned synonyms</button>
    </div>
    <div>
        <input type="checkbox" id="use-online" name="use-online"/> Use online index
    </div>

    <div class="well import-info alert-info hide" style="margin-top:20px;">
        <p></p>
        <div class="progress hide">
        </div>
    </div>

    <r:script>
        function denormaliseTaxa(){
            $.get("${createLink(controller:'import', action:'denormaliseTaxa')}?online=" + $('#use-online').is(':checked'), function( data ) {
              if(data.success){
                $('.import-info p').html('Build successfully started....')
                $('#start-import').prop('disabled', true);
              } else {
                $('.import-info p').html('Build failed. Check file path...')
              }
              $('.import-info').removeClass('hide');
              $('.progress').removeClass('hide');
            });
        }

        function removeDanglingSynonyms(){
            $.get("${createLink(controller:'import', action:'deleteDanglingSynonyms')}?online=" + $('#use-online').is(':checked'), function( data ) {
              if(data.success){
                $('.import-info p').html('Delete successfully started....')
                $('#start-import').prop('disabled', true);
              } else {
                $('.import-info p').html('Build failed. Check file path...')
              }
              $('.import-info').removeClass('hide');
              $('.progress').removeClass('hide');
            });
        }

        function buildLinkIdentifiers(){
            $.get("${createLink(controller:'import', action:'buildLinkIdentifiers')}?online=" + $('#use-online').is(':checked'), function( data ) {
              if(data.success){
                $('.import-info p').html('Build successfully started....')
                $('#start-import').prop('disabled', true);
              } else {
                $('.import-info p').html('Build failed. Check file path...')
              }
              $('.import-info').removeClass('hide');
              $('.progress').removeClass('hide');
            });
        }

        function loadImages(){
            $.get("${createLink(controller:'import', action:'loadImages')}?online=" + $('#use-online').is(':checked'), function( data ) {
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

        function loadPreferredImages(){
            $.get("${createLink(controller:'import', action:'loadPreferredImages')}?online=" + $('#use-online').is(':checked'), function( data ) {
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
</div>
</body>
</html>
