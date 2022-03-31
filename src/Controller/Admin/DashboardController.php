<?php

namespace App\Controller\Admin;

use App\Entity\Category;
use App\Entity\Article;
use App\Entity\Carrier;
use App\Entity\Order;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {
        // Option 1. You can make your dashboard redirect to some common page of your backend
        //
        //$adminUrlGenerator = $this->container->get(AdminUrlGenerator::class);
        //return $this->redirect($adminUrlGenerator->setController(CategoryCrudController::class)->generateUrl());

        // Option 2. You can make your dashboard redirect to different pages depending on the user
        //
        // if ('jane' === $this->getUser()->getUsername()) {
        //     return $this->redirect('...');
        // }

        // Option 3. You can render some custom template to display a proper dashboard with widgets, etc.
        // (tip: it's easier if your template extends from @EasyAdmin/page/content.html.twig)
        //
        // return $this->render('some/path/my-dashboard.html.twig');
        return $this->render('admin/index.html.twig');
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Ecommerce');
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linkToUrl('Retour au site' , 'fas fa-laptop-house', '/')             ;            
        yield MenuItem::linkToDashboard('Dashboard', 'fa fa-home')                           ;
        yield MenuItem::linkToCrud('Orders'        , 'fa fa-shopping-cart' , Order::class)   ;
        yield MenuItem::linkToCrud('Categories'    , 'fa fa-list'          , Category::class);
        yield MenuItem::linkToCrud('Articles'      , 'fa fa-tag'           , Article::class) ;
        yield MenuItem::linkToCrud('Transporteur'  , 'fa fa-truck'         , Carrier::class) ;
    }
}
