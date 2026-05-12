<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>

    <#if section = "header">
    <#elseif section = "form">
        <div class="brand">
            <img src="${url.resourcesPath}/img/keycloak-bg.png" alt="Logo">
        </div>
        <div class="alert">
            <strong>${kcSanitize(message.summary)}</strong>
        </div>
        <div class="signup-row">
            <a href="${url.loginUrl}">« Back to Login</a>
        </div>
    </#if>
</@layout.registrationLayout>