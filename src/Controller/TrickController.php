<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Trick;
use App\Entity\Video;
use App\Form\TrickFormType;
use App\Form\CommentFormType;
use Symfony\Component\HttpFoundation\Request;
use App\Repository\TrickRepository;
use App\Repository\CommentRepository;
use App\Repository\UserRepository;
use App\Entity\Comment;
use App\Entity\Picture;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Filesystem\Filesystem;

;

class TrickController extends AbstractController
{
    /**
     * @Route("/trick/new", name="creation_trick")
     */

    public function createtrick(Request $request, TrickRepository $trickRepository, UserRepository $userRepository): Response
    {
        if (!$this->getUser()) {
            $this->addFlash(
                'warninglogin',
                'Vous devez être connecté pour créer un trick'
            );

            return $this->redirectToRoute('login');
        }


        $trick = new Trick();
        $form = $this->createForm(TrickFormType::class, $trick);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $pictures = $form->get('pictures')->getData();
            $i=0;
            foreach($pictures as $picture){
                // On génère un nouveau nom de fichier
                $i++;
                $filename = $trick->getName() . "_" . $i . "." . $picture->getClientOriginalExtension();
                
                // On copie le fichier dans le dossier uploads
                
                $destination = $this->getParameter('kernel.project_dir') . '/public/assets/img/tricks/pictures';
                $picture->move($destination,$filename);            
                // On crée l'image dans la base de données
                $pict= new Picture();
                $pict->setName($filename);
                $trick->addPicture($pict);
            }

            $trick->setUser($userRepository->find($this->getUser()->getId()));
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($trick);
            $entityManager->flush();

            $this->addFlash(
                'success',
                'Votre trick a bien été créé');

            return $this->redirectToRoute('home');
        }

        return $this->render('/tricks_features/create_trick.html.twig', [
            'trick' => $trick,
            'TrickForm' => $form->createView(),
        ]);
    }

    /**
     * @Route("/trick/delete/{id}", name="delete_trick")
     */

    public function deletetrick($id, EntityManagerInterface $entityManagerInterface, TrickRepository $trickRepository): Response
    
    {      
        $trick=$trickRepository->find($id);
        if (!$this->getUser()) {
            $this->addFlash(
                'warninglogin',
                'Vous devez être connecté pour supprimer un trick'
            );

            return $this->redirectToRoute('login');
        }

        if ($trick->getUser()->getId() != $this->getUser()->getId()) {
            $this->addFlash(
                'warninglogin',
                'Vous ne pouvez pas supprimer ce trick'
            );

            return $this->redirectToRoute('login');
        } 
        
        
        $entityManagerInterface->remove($trick);
        $entityManagerInterface->flush();

        $this->addFlash(
            'success',
            'Votre trick a bien été supprimé'
        );
        

        return $this->redirectToRoute('home');
        
    }

    /**
     * @Route("/trick/edit/{id}", name="edit_trick",) 
     */

    public function edittrick($id, Request $request, TrickRepository $trickRepository, UserRepository $userRepository, Filesystem $filesystem): Response
        {
        if (!$this->getUser()) {
            $this->addFlash(
                'warninglogin',
                'Vous devez être connecté pour modifier un trick'
            );

            return $this->redirectToRoute('login');
        }
        if ($trickRepository->find($id)->getUser()->getId() != $this->getUser()->getId()) {
            $this->addFlash(
                'warninglogin',
                'Vous ne pouvez pas modifier ce trick'
            );

            return $this->redirectToRoute('login');
        }


        

        $trick = $trickRepository->find($id);
        $form = $this->createForm(TrickFormType::class, $trick);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $pictures = $form->get('pictures')->getData();
            $i=0;
            // si le formulaire est valide, on remplace les images par les nouvelles
            if (isset($pictures) && !empty($pictures)) {

                // On supprime les anciennes images
                foreach ($trick->getPictures() as $picture) {
                    $trick->removePicture($picture);
                    $filesystem->remove(['symlink', $this->getParameter('kernel.project_dir') . "/public/assets/img/tricks/pictures/" . $picture->getName(), $picture->getName()]);
                }
            
                foreach ($pictures as $picture) {
                    // On génère un nouveau nom de fichier
                    $i++;
                    $filename = $trick->getName() . "_" . $i . "." . $picture->getClientOriginalExtension();
                
                    // On copie le fichier dans le dossier uploads
                
                    $destination = $this->getParameter('kernel.project_dir') . '/public/assets/img/tricks/pictures';
                    $picture->move($destination, $filename);
                    // On crée l'image dans la base de données
                    $pict= new Picture();
                    $pict->setName($filename);
                    $trick->addPicture($pict);
                }
            }
            

            $trick->setUser($userRepository->find($this->getUser()->getId()));
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($trick);
            $entityManager->flush();

            return $this->redirectToRoute('creation_trick_validate');
        }
        return $this->render('/tricks_features/edit_trick.html.twig', [
            'trick' => $trick,
            'TrickForm' => $form->createView(),
        ]);
    }



    

    /**
     * @Route("/trick/validate", name="creation_trick_validate")
     */
    public function validatetrick(): Response
    {
        return $this->render('/tricks_features/validate_trick.html.twig');
    }

    /**
     * @Route("/", name="home")
     */
    public function home(TrickRepository $trickRepository): Response
    {
        $tricks = $trickRepository->findAll();

        return $this->render('/home/home.html.twig', ["tricks" => $tricks]);
    }


    
    /**
     * @Route("/trick/{id}", name="getTrick")
     */
    public function showtrick(TrickRepository $trickRepository, $id, Request $request, CommentRepository $commentRepository, UserRepository $userRepository): Response
    {
        $trick = $trickRepository->find($id);
        $comments = $commentRepository->findBy(["Trick" => $trick]);

        if (!$trick) {
            echo 'erreur';
            return new Response();
        }

        $comment = new Comment();
        $form = $this->createForm(CommentFormType::class, $comment);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            // $form->getData() holds the submitted values
            // but, the original `$task` variable has also been updated
            $user = $userRepository->findOneBy(["email" => $this->getUser()->getEmail()]);
            $comment->setUser($user);
            $comment->setTrick($trick);
            $comment->setCreateAt(new \DateTimeImmutable());

            // ... perform some action, such as saving the task to the database
            // for example, if Task is a Doctrine entity, save it!
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($comment);
            $entityManager->flush();

            $this->addFlash('success', 'Nouveau commentaire ajouté!');
            return $this->redirectToRoute('getTrick', ['id' => $id]);
        }
        $params = ["Trick" => $trick, "Comments" => $comments];
        if ($this->getUser()) {
            $params["CommentForm"] = $form->createView();
        }
        return $this->render('/tricks_features/show_trick.html.twig', $params);
    }
}
