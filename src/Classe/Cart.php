<?php

namespace App\Classe;

use App\Entity\Article;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\RequestStack;

class Cart
{
    private $session;

    public function __construct(EntityManagerInterface $entityManager, RequestStack $requestStack)
    {
        $this->session = $requestStack->getSession('cart');
        $this->entityManager = $entityManager;
    }

    public function add($id)
    {
        
        $cart = $this->session->get('cart',[]);
        if(!empty($cart[$id]))
        {
            $cart[$id]++;
        }
        else 
        {
            $cart[$id] = 1;
        }
        $this->session->set('cart',$cart);
    }

    public function get()
    {
        return $this->session->get('cart');
    }

    public function remove()
    {
        return $this->session->remove('cart');
    }

    public function delete($id)
    {
        $cart = $this->session->get('cart', []);

        unset($cart[$id]);
        
        return $this->session->set('cart',$cart);
    }

    public function decrease($id)
    {
        $cart = $this->session->get('cart',[]);
        if($cart[$id] > 1)
        {
            $cart[$id]--;
        }
        else 
        {
            unset($cart[$id]);
        }

        return $this->session->set('cart', $cart);
    }

    public function getFull()
    {
        $fullCart = [];

        if($this->get()) 
        {
            foreach ($this->get() as $id => $quantity) 
            {
                $article = $this->entityManager->getRepository(Article::class)->findOneBy(['id' => $id]);
                if(!$article)
                {
                    $this->delete($id);
                    continue;
                }
                $fullCart[] =
                [
                    'article'  => $article,
                    'quantity' => $quantity
                ];
            }
        }
        return $fullCart;
    }

}