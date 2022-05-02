<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

  class LoginController extends AbstractController
  {
      /**
     * @Route("/login", name="login")
     */
    public function index(AuthenticationUtils $authenticationUtils): Response
      {
	  
         $error = $authenticationUtils->getLastAuthenticationError();
         $lastUsername = $authenticationUtils->getLastUsername();

          return $this->render('login/index.html.twig', [
             'last_username' => $lastUsername,
             'error'         => $error,
          ]);
      }

      /**
       * This is the route the user can use to logout.
       *
       * But, this will never be executed. Symfony will intercept this first
       * and handle the logout automatically. See logout in config/packages/security.yaml
       *
       * @Route("/logout", name="logout")
       */
      public function logout(): void
      {
          throw new \Exception('This should never be reached!');
      }
  }

