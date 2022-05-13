<?php

namespace App\Controller;

use App\Model\UserManager;
use App\Controller\AbstractController;

class UserController extends AbstractController
{
    public function login(): string|null
    {

        return $this->twig->render('User/login.html.twig');
    }

    public function register(): string|null
    {

        return $this->twig->render('User/register.html.twig');
    }

    public function logout()
    {
        header('Location: /');
    }
}
