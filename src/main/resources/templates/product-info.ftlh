<!DOCTYPE html>
<html>
<head>
    <title>Интернет магазин</title>
</head>
<body>
<h1>Интернет магазин</h1>
<h4>Подробная информация о товаре</h4>
<#list images as img>
    <img src="/images/${img.id}" height="60px"/><br><br>
</#list>
<b>Название товара: </b>${product.title}<br>
<b>Описание товара: </b>${product.description}<br>
<b>Цена: </b>${product.price}<br>
<b>Город: </b>${product.city}<br>
<b>Автор: </b>${product.user.name}<br>
<b>Номер телефона: </b>${product.user.phoneNumber}<br>
<form action="/" method="get">
<input type="submit" value="Назад"/>
</form>
</body>
</html>