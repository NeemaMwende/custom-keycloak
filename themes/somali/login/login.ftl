<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>

    <#if section = "header">
        <h1 class="card-title">JS Reports</h1>
    <#elseif section = "form">
        <div class="brand">
            <img src="${url.resourcesPath}/img/keycloak-bg.png" alt="Logo">
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
                </#if>
                <div class="field">
                    <label class="field-label" for="password">${msg("password")}</label>
                    <div class="input-wrap">
                        <input id="password-field" name="password" type="password" placeholder="${msg('password')}" autocomplete="current-password" required>
                        <button type="button" class="pwd-toggle" tabindex="-1"><i class="fas fa-eye"></i></button>
                    </div>
                </div>
                <div class="form-extras">
                    <#if realm.rememberMe && !usernameHidden??>
                        <label class="remember-wrap">
                            <input id="rememberMe" name="rememberMe" type="checkbox">
                            ${msg("rememberMe")}
                        </label>
                    </#if>
                    <#if realm.resetPasswordAllowed>
                        <a class="forgot-link" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
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
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                const toggle = document.querySelector('.pwd-toggle');
                const pwd = document.getElementById('password-field');
                toggle.addEventListener('click', function() {
                    if (pwd.type === 'password') {
                        pwd.type = 'text';
                        toggle.innerHTML = '<i class="fas fa-eye-slash"></i>';
                    } else {
                        pwd.type = 'password';
                        toggle.innerHTML = '<i class="fas fa-eye"></i>';
                    }
                });
            });
        </script>
    </#if>
</@layout.registrationLayout>