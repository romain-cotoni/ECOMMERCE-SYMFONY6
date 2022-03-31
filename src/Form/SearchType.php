<?php

namespace App\Form;

use App\Classe\Search;
use App\Entity\Category;
use Symfony\Component\Form\AbstractType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class SearchType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('string', TextType::class,
            [
                'label'    => false,
                'required' => false,
                'attr'     => ['placeholder' => 'Votre recherche...',
                               'class'       => 'form-control',
                               'style'       => 'width: 100%']
            ])
            ->add('categories', EntityType::class, 
            [
                'class'        => Category::class,
                'label'        => false,
                'required'     => false,
                'multiple'     => true ,
                'expanded'     => true ,
                'attr'         => ['class' => 'mb-3 fs-5']
            ])
            ->add('submit', SubmitType::class,
            [
                'label' => 'Filtrer',
                'attr'  => ['style' => 'width: 100%','class' =>'btn-block btn-secondary fs-5']
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class'      => Search::class,
            'method'          => 'GET',
            'crsf_protection' => false
        ]);
    }

    public function getBlockPrefix()
    {
        return '';
    }
}
