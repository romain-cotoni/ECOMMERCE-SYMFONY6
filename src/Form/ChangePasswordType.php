<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\ResetType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ChangePasswordType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email'    , EmailType::class, 
            [
                'disabled' => true,
                'label' => 'Votre adresse email'
            ])
            ->add('firstname', TextType::class, 
            [
                'disabled' => true,
                'label' => 'Votre prénom'
            ])
            ->add('lastname' , TextType::class, 
            [
                'disabled' => true,
                'label' => 'Votre nom'
            ])
            ->add('old_password', PasswordType::class,
            [
                'mapped' => false,
                'label' => 'Votre mot de passe actuel'
            ])
            ->add('new_password', RepeatedType::class,
            [
                'type' => PasswordType::class,
                'mapped' => false,
                'invalid_message' => 'Le nouveau mot de passe et la confirmation doivent être identique.',
                'required' => true,
                'first_options' => ['label' => 'Votre nouveau mot de passe'],
                'second_options' => ['label' => 'Confirmez votre nouveau mot de passe']
            ])
            ->add('submit', SubmitType::class,
            [
                'label' => "Modifier", 
                'attr'  => ['class' => 'btn btn-primary w-25 ms-5 px-0 me-1 float-start',]
            ])
            ->add('reset', ResetType::class,[
                'label' => 'Effacer', 
                'attr'  => ['class' => 'btn btn-primary w-25 ms-1 me-5 float-end',]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
