<!DOCTYPE html>
<html>
<head>
    <title>Интернет магазин</title>
</head>
<body>
<h1>Интернет магазин</h1>
<h4>Подробная информация о товаре</h4>
<b>Название товара: </b>${product.title}<br>
<b>Описание товара: </b>${product.description}<br>
<b>Цена: </b>${product.price}<br>
<b>Город: </b>${product.city}<br>
<b>Автор: </b>${product.author}<br>
<hr>
<form action="/product/delete/${product.id}" method="post">
    <input type="submit" value="Удалить товар"/>
</form>
<form action="/" method="get">
    <input type="submit" value="Назад"/>
</form>
</body>
</html>