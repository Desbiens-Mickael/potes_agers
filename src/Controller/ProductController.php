<?php

namespace App\Controller;

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
}
