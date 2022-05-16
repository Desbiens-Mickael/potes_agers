<?php

// list of accessible routes of your application, add every new route here
// key : route to match
// values : 1. controller name
//          2. method name
//          3. (optional) array of query string keys to send as parameter to the method
// e.g route '/item/edit?id=1' will execute $itemController->edit(1)
return [
    '' => ['HomeController', 'index',],

    'product/show' => ['ProductController', 'showProduct', ['product_id', 'user_id']],
    'login' => ['UserController', 'login',],
    'register' => ['UserController', 'register',],
    'logout' => ['UserController', 'logout',],
    'user' => ['UserController', 'index',],
    'category' => ['CategoryController', 'index',],
    'api/products' => ['AjaxController', 'getproducts',],
    'items' => ['ItemController', 'index',],
    'items/edit' => ['ItemController', 'edit', ['id']],
    'items/show' => ['ItemController', 'show', ['id']],
    'items/add' => ['ItemController', 'add',],
    'items/delete' => ['ItemController', 'delete',],
    'products' => ['ProductController', 'index',],
    'add' => ['ProductController', 'add',],
];
