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
        $id = 1;
        $userManager = new UserManager();
        $users = $userManager->selectOneById($id);
        return json_encode($users);
    }
}
