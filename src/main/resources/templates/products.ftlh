<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Объявления</h1><hr>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group col-md-10">
                <label for="searchWord">Поиск по объявлениям</label>
                <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control"
                       id="searchWord">
            </div>
            <button style="width: 83%" type="submit" class="btn btn-dark">Поиск</button>
        </div>
    </form>
    <hr>
    <div class="card-deck">
        <#list products as product>
            <a href="/product/${product.id}" class="product-link">
                <div class="card text-white bg-dark my-3 product">

                    <img src="/images/${product.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
                        <p class="card-text">${product.price} ₽</p>
                    </div>
                    <div class="card-footer">
                        Город: ${product.city}
                        <div>
                            Автор: ${product.user.name}
                        </div>
                        <div>
                            Дата объявления: ${product.dateOfCreated.getDayOfMonth()}.${product.dateOfCreated.getMonthValue()}.${product.dateOfCreated.year - 2000}
                            ${product.dateOfCreated.getHour()}:${product.dateOfCreated.getMinute()}
                        </div>
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center; white-space: nowrap;">Ничего не найдено :(</h1>
        </#list>
    </div>
</@t.template>
