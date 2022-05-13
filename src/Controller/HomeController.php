<?php

namespace App\Controller;

class HomeController extends AbstractController
{
    /**
     * Display home page
     */
    public function index(): string
    {
        var_dump($_SESSION['ip'] = $_SERVER['REMOTE_ADDR']);
        return $this->twig->render('Home/index.html.twig');
    }
}
