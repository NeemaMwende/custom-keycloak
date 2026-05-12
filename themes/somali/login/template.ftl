<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html>
<html class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
</head>

<body>
    <div class="bg-scene"></div>
    <div class="bg-dash">
        <div class="dash-card"><div class="label"></div><div class="value"></div></div>
        <div class="dash-chart"></div>
        <div class="dash-donut"></div>
        <div class="dash-map"></div>
        <div class="dash-card"><div class="label"></div><div class="value"></div></div>
        <div class="dash-chart"></div>
        <div class="dash-map"></div>
        <div class="dash-donut"></div>
    </div>
    <div class="card-wrap">
        <div class="card">
            <#nested "header">
            <#nested "form">
            <#nested "info">
        </div>
    </div>
</body>
</html>
</#macro>