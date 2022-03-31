<?php

namespace App\Controller\Admin;

use App\Entity\Article;
//use App\Entity\Category;
use EasyCorp\Bundle\EasyAdminBundle\Field\CollectionField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\Field;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\SlugField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;

class ArticleCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Article::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            TextField::new('name'),
            SlugField::new('slug')->setTargetFieldName('name'),
            ImageField::new('image')->setBasePath('..\uploads')->onlyOnIndex(),
            ImageField::new('image')->setBasePath('public\uploads')
                                    ->setUploadDir('public\uploads')
                                    ->setUploadedFileNamePattern('[randomhash].[extension]')
                                    ->hideOnIndex(),
            TextareaField::new('description'),
            MoneyField::new('price')->setCurrency('EUR'),
            AssociationField::new('category')->hideOnIndex(),
            CollectionField::new('category')->onlyOnIndex(),
        ];
    }
    
}
