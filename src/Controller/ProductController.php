<?php

namespace App\Controller;

use App\Controller\AbstractController;
use App\Model\ProductManager;
use App\Model\CategoryManager;
use App\Model\UserManager;

class ProductController extends AbstractController
{
    public function index(int $categoryId): string
    {
        $categoryManager = new CategoryManager();
        $categories = $categoryManager->selectOneById($categoryId);
        $productManager = new ProductManager();
        $products = $productManager->selectByCategory($categoryId);
        return $this->twig->render('Product/index.html.twig', [
            'categories' => $categories,
            'products' => $products
        ]);
    }

    public function showProduct(int $productId, int $userId): string
    {
        $productManager = new ProductManager();
        $product = $productManager->selectOneById($productId);
        $userManager = new UserManager();
        $user = $userManager->selectOneById($userId);
        return $this->twig->render('Product/show.html.twig', [
            'user' => $user,
            'product' => $product
        ]);
    }

    public function add(): ?string
    {
        if (isset($_SESSION['user']) && !empty($_SESSION['user'])) {
            $userManager = new UserManager();
            $user = $userManager->selectOneById($_SESSION['user']['id']);
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                $product = array_map('trim', $_POST);

                $fileName = $_FILES['image']['name'];
                $uploadFile = __DIR__ . '/../../public/uploads/' . $fileName;
                if (move_uploaded_file($_FILES['image']['tmp_name'], $uploadFile)) {
                    $productManager = new ProductManager();
                    $product['image'] = $fileName;
                    $product['user_id'] = $user['id'];
                    $productManager->insert($product);
                    header('Location:/products');
                    return null;
                }
            }
        }

        $categoryManager = new CategoryManager();
        $productManager = new ProductManager();
        return $this->twig->render('Product/add.html.twig', [
            'categories' => $categoryManager->selectAll(),
            // 'products' => $productManager->selectAll()
        ]);
    }
}
