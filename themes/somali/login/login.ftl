<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>

    <#if section = "header">
    <#elseif section = "form">
        <div class="brand">
            <img src="${url.resourcesPath}/img/keycloak-logo-textt.png" alt="Logo">
        </div>
        <#if realm.password>
            <form id="kc-form-login" action="${url.loginAction}" method="post" novalidate="novalidate">
                <#if !usernameHidden??>
                    <#assign label>
                        <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                    </#assign>
                    <div class="field">
                        <label class="field-label" for="username">${label}</label>
                        <div class="input-wrap">
                            <input id="username" name="username" value="${login.username!''}" type="text" placeholder="${msg('username')}" autocomplete="username" required>
                        </div>
                    </div>
                    <div class="field">
                        <label class="field-label" for="password">${msg("password")}</label>
                        <div class="input-wrap">
                            <#if realm.resetPasswordAllowed>
                                <a class="forgot-link" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                            </#if>
                            <input id="password" name="password" type="password" placeholder="${msg('password')}" autocomplete="current-password" required>
                        </div>
                    </div>
                <#else>
                    <div class="field">
                        <label class="field-label" for="password">${msg("password")}</label>
                        <div class="input-wrap">
                            <input id="password" name="password" type="password" placeholder="${msg('password')}" autocomplete="current-password" required>
                        </div>
                    </div>
                </#if>
                <div class="form-extras">
                    <#if realm.rememberMe && !usernameHidden??>
                        <label class="remember-wrap">
                            <input id="rememberMe" name="rememberMe" type="checkbox">
                            ${msg("rememberMe")}
                        </label>
                    </#if>
                </div>
                <button type="submit" class="btn-login">${msg("doLogIn")}</button>
            </form>
        </#if>
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div class="signup-row">
                ${msg("noAccount")} <a href="${url.registrationUrl}">${msg("doRegister")}</a>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>