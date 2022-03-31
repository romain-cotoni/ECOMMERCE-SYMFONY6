<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CheckOutController extends AbstractController
{
    #[Route('/checkout', name: 'checkout')]
    public function index(): Response
    {
        return $this->render('check_out/index.html.twig', []);
    }
}
