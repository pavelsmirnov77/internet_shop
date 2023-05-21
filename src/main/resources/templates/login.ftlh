<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Авторизация</h1>
    <hr>
    <form action="/login" method="post">
        <div class="form-group">
            <label for="email">Электронная почта</label>
            <input type="email" class="form-control" id="email" name="username">
        </div>
        <div class="form-group">
            <label for="password">Пароль</label>
            <input type="password" class="form-control" id="password" name="password">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" style="width: 100%" class="btn btn-dark">
            Войти
        </button>
    </form>
    <hr>
    <#if error??>
        <h2 style="color: red">${error}</h2>
    </#if>
    <h2>Нет аккаунта? <a href="/registration">Зарегистрируйся!</a></h2>
</@t.template>