<!DOCTYPE html>
<html>
<head>
    <title>Admin | BIE Web services | ${grailsApplication.config.skin.orgNameLong}</title>
</head>
<body>
<div id="page-body" role="main">
    <h2>BIE Web services - Admin tools</h2>
    <ul>
        <li><g:link controller="import" action="all">Import all</g:link> - re-import all information</li>
        <li><g:link controller="import" action="index">Taxonomy import tool</g:link> - import DwC-A with taxonomic information</li>
        <li><g:link controller="import" action="collectory">Collectory import tool</g:link> - import collectory information</li>
        <li><g:link controller="import" action="layers">Layer import tool</g:link> - import layer information</li>
        <li><g:link controller="import" action="regions">Region import tool</g:link> - import regions information</li>
        <li><g:link controller="import" action="localities">Localities import tool</g:link> - import localities information</li>
        <li><g:link controller="import" action="specieslist">Species List import tool</g:link> - import species lists information</li>
        <li><g:link controller="import" action="wordpress">WordPress import tool</g:link> - import WordPress pages</li>
        <li><g:link controller="import" action="links">Add links</g:link> - construct link identifiers for unique names and image links</li>
        <li><g:link controller="import" action="occurrences">Occurrence data tool</g:link> - add occcurrence info to Taxa</li>
        <br>
        <li><g:link controller="alaAdmin" action="index">ALA admin functions</g:link> - view config, build info &amp; set banner message</li>
    </ul>
</div>
</body>
</html>
