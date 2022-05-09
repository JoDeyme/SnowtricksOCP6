<?php

namespace App\Form;

use App\Entity\Video;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ButtonType;
use Symfony\Component\Form\Extension\Core\Type\UrlType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class VideoFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name',TextType::class, [
                'attr' => [
                    'placeholder' => 'Nom de la vidéo',
                    'class' => 'form-control',
                ],
                'label' => 'Nom de la vidéo',
                'label_attr' => [
                    'class' => 'label-video',
                ],
            ])
            ->add('path', UrlType::class, [
                
                'attr' => [
                    'placeholder' => 'Lien de la vidéo',
                    'class' => 'form-control',
                ],
                'label' => 'Url de la vidéo',
                'label_attr' => [
                    'class' => 'label-video',
                ],
                'attr' => [
                    'placeholder' => 'https://www.',
                ],
                ])
            ->add('remove', ButtonType::class, [
                'attr' => [
                    'class' => 'btn btn-primary remove-on-click',
                ],
                'label' => 'Supprimer',
            
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Video::class,
        ]);
    }
}
