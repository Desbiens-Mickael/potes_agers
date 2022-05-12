<?php

namespace App\Controller;

use App\Controller\AbstractController;

class ProductController extends AbstractController
{
    public function showProduct()
    {
        return $this->twig->render('Product/show.html.twig');
    }
}
