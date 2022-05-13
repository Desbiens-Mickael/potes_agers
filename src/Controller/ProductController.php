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
  
    public function add(): ?string
    {
        // if (!$this->user) {
        //     header('Location: /login');
        //     return null;
        // }
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $product = array_map('trim', $_POST);

            $fileName = $_FILES['image']['name'];
            $uploadFile = __DIR__ . '/../../public/uploads/' . $fileName;
            if (move_uploaded_file($_FILES['image']['tmp_name'], $uploadFile)) {
                $productManager = new ProductManager();
                $product['image'] = $fileName;
                $product['user_id'] = 1;
                $productManager->insert($product);
                header('Location:/products');
                return null;
            }
        }
        $categoryManager = new CategoryManager();
        $productManager = new ProductManager();
        return $this->twig->render('Product/add.html.twig', [
            'categories' => $categoryManager->selectAll(),
            'products' => $productManager->selectAll()
        ]);
    }
}
