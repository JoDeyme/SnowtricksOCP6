<?php

namespace App\Form;

use App\Entity\Category;
use App\Entity\Trick;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Validator\Constraints\Image;
use Symfony\Component\Validator\Constraints\File;

class TrickFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name', TextType::class, [
                'label' => 'Nom du trick',
                'label_attr' => [
                    'class' => 'label-trick',
                ],
                'attr' => [
                    'placeholder' => 'Nom du trick',
                    'class' => 'form-control',
                ],
            ])
                
            ->add('description', TextareaType::class,
                [
                    'label' => 'Description du trick',
                    'label_attr' => [
                        'class' => 'label-trick',
                    ],
                    'attr' => [
                        'placeholder' => 'Description du trick',
                        'class' => 'form-control',
                    ],
                ])
            ->add('categories', EntityType::class, [
                'attr' => [
                    'class' => 'form-control',
                ],
                'class' => Category::class,
                'multiple' => true,
                'choice_label' => 'name',
            ])

            ->add('pictures', FileType::class, [
                'attr' => [
                    'class' => 'form-control',
                ],
                'label' => 'Photo de trick',
                'multiple' => true,
                'attr'     => [
                    'accept' => 'image/*',
                    'multiple' => 'multiple',
                    'maxSize' => '2M',
                ],
                'mapped' => false, 
                'required' => false,                                              
            ])

            
            ->add('videos', CollectionType::class, [
                'entry_type' => VideoFormType::class,
                'label' => false,
                'allow_add' => true,
                'allow_delete' => true,
                'by_reference' => false,
            ])

/*             ->add('videos', CollectionType::class, [
                'entry_type' => UrlType::class,
                'allow_add' => true,
                'prototype' => true,
                'prototype_data' => 'osef',
                'by_reference' => false,
                'allow_delete' => true,
                'label' => false
            ]) */


            ->add('Submit', SubmitType::class, ['label' => 'Envoyer']);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            //'data_class' => Trick::class,
        ]);
    }
}
