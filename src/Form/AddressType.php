<?php

namespace App\Form;

use App\Entity\Address;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CountryType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TelType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class AddressType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
        ->add('name', TextType::class, [
            'label' => 'Nommez votre adresse',
            'attr'  => ['placeholder' => 'Nommez votre adresse']
         ])
        ->add('firstname', TextType::class, [
            'label' => 'Votre prénom',
            'attr'  => ['placeholder' => 'Votre prénom']
        ])
        ->add('lastname', TextType::class, [
            'label' => 'Votre nom',
            'attr'  => ['placeholder' => 'Votre nom']
        ])
        ->add('company', TextType::class, [
            'label' => 'Votre société',
            'required' => false,
            'attr'  => ['placeholder' => '(facultatif) Votre société']
        ])
        ->add('address', TextType::class, [
            'label' => 'Votre adresse',
            'attr'  => ['placeholder' => 'Votre adresse']
        ])
        ->add('postal', TextType::class, [
            'label' => 'Votre code postal',
            'attr'  => ['placeholder' => 'Votre code postal']
        ])
        ->add('city', TextType::class, [
            'label' => 'Votre ville',
            'attr'  => ['placeholder' => 'Votre ville']
        ])
        ->add('pays', CountryType::class, [
            'label' => 'Votre pays',
            'attr'  => ['placeholder' => 'Votre pays']
        ])
        ->add('phone', TelType::class, [
            'label' => 'Votre téléphone',
            'attr'  => ['placeholder' => 'Votre téléphone']
        ])
        ->add('submit', SubmitType::class,[
            'label' => 'Valider',
            'attr'  => ['class' => 'btn btn-secondary fs-5']
        ])
    ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Address::class,
        ]);
    }
}
