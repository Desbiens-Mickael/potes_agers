<?php

namespace App\Controller;

use App\Controller\AbstractController;
use App\Model\ProductManager;
use App\Model\CategoryManager;

class ProductController extends AbstractController
{
    public function index(): string
    {
        $categoryManager = new CategoryManager();
        $categories = $categoryManager->selectDistinctAll();
        $productManager = new ProductManager();
        $products = $productManager->selectAll();
        return $this->twig->render('Product/index.html.twig', [
            'categories' => $categories,
            'products' => $products
        ]);
    }

    public function showProduct()
    {
        return $this->twig->render('Product/show.html.twig');
    }
}
