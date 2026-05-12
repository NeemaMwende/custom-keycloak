<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>

    <#if section = "header">
    <#elseif section = "form">
        <div class="brand">
            <img src="${url.resourcesPath}/img/keycloak-logo-textt.png" alt="Logo">
        </div>
        <#if realm.resetPasswordAllowed>
            <form id="kc-reset-password-form" action="${url.loginAction}" method="post" novalidate="novalidate">
                <div class="field">
                    <label class="field-label" for="username">
                        <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                    </label>
                    <div class="input-wrap">
                        <input id="username" name="username" value="${(auth.attemptedUsername)!''}" type="text" placeholder="${msg('username')}" autocomplete="username" required>
                    </div>
                </div>
                <div class="signup-row">
                    <a href="${url.loginUrl}">« ${msg("backToLogin")}</a>
                </div>
                <button type="submit" class="btn-login">${msg("doSubmit")}</button>
            </form>
        </#if>
    <#elseif section = "info">
        <#if realm.duplicateEmailsAllowed>
            <p class="card-subtitle">${msg("emailInstructionUsername")}</p>
        <#else>
            <p class="card-subtitle">${msg("emailInstruction")}</p>
        </#if>
    </#if>
</@layout.registrationLayout>