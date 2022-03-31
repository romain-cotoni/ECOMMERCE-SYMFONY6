<?php

namespace App\Controller;

use App\Classe\Search;
use App\Form\SearchType;
use App\Entity\Article;
//use App\Entity\Category;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;
use SebastianBergmann\Environment\Console;

class HomeController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/', name: 'home')]
    public function index(Request $request): Response
    {
        $search = new Search();
        $form   = $this->createForm(SearchType::class, $search);   
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            $articles = $this->entityManager->getRepository(Article::class)->findWithSearch($search);
        } 
        else 
        {
            $articles = $this->entityManager->getRepository(Article::class)->findAll();
        }
        $categories = $form->get('categories')->getData();
        
        return $this->render('home/index.html.twig', [
            'controller_name' => 'home',
            'articles'        => $articles,
            'categories'      => $categories,
            'form'            => $form->createView(),
        ]);
    }

    #[Route('/article/{slug}', name: 'article')]
    public function show($slug): Response
    {   
        $article = $this->entityManager->getRepository(Article::class)->findOneBy(['slug'=>$slug]);
        if(!$article) 
        {
            return $this->redirectToRoute('home');
        }
        
        return $this->render('/article/show.html.twig',
        [ 
            'article' => $article 
        ]);
    }
    
}
