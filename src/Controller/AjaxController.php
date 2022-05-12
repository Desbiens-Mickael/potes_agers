<?php

namespace App\Controller;

use App\Model\UserManager;

class AjaxController extends AbstractController
{
    public function __construct()
    {
        parent::__construct();

        header('Content-Type: application/json');
    }

    public function getproducts(): string
    {
        $userManager = new UserManager();
        $users = $userManager->selectAll();

        return json_encode($users);
    }
}
