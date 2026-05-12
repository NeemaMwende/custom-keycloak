<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','email','firstName','lastName','password','password-confirm'); section>

    <#if section = "header">
        <h1 class="card-title">JS Reports</h1>
        <p class="card-subtitle">Create your account</p>
    <#elseif section = "form">
        <div class="brand">
            <img src="${url.resourcesPath}/img/keycloak-bg.png" alt="Logo">
        </div>
        <#if realm.registrationAllowed>
            <form id="kc-register-form" action="${url.registrationAction}" method="post" novalidate="novalidate">
                <#if !usernameHidden??>
                  <div class="field">
                      <label class="field-label" for="username">
                          <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                      </label>
                      <div class="input-wrap">
                          <input id="username" name="username" value="${(register.formData.username)!''}" type="text" placeholder="${msg('username')}" autocomplete="username" required>
                      </div>
                  </div>
                </#if>
                <#if realm.registrationEmailAsUsername || !realm.loginWithEmailAllowed>
                    <div class="field">
                        <label class="field-label" for="email">${msg("email")}</label>
                        <div class="input-wrap">
                            <input id="email" name="email" value="${(register.formData.email)!''}" type="email" placeholder="${msg('email')}" autocomplete="email" required>
                        </div>
                    </div>
                </#if>
                <div class="field">
                    <label class="field-label" for="password">${msg("password")}</label>
                    <div class="input-wrap">
                        <input id="password" name="password" type="password" placeholder="${msg('password')}" autocomplete="new-password" required>
                    </div>
                </div>
                <div class="field">
                    <label class="field-label" for="password-confirm">${msg("passwordConfirm")}</label>
                    <div class="input-wrap">
                        <input id="password-confirm" name="password-confirm" type="password" placeholder="${msg('passwordConfirm')}" autocomplete="new-password" required>
                    </div>
                </div>
                <button type="submit" class="btn-login">${msg("doRegister")}</button>
            </form>
        </#if>
        <div class="signup-row">
            <a href="${url.loginUrl}">« ${msg("backToLogin")}</a>
        </div>
    </#if>
</@layout.registrationLayout>