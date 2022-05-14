# Snowtricks 

## Badge

[![Maintainability](https://api.codeclimate.com/v1/badges/46101176e618848b4b79/maintainability)](https://codeclimate.com/github/JoDeyme/SnowtricksOCP6/maintainability)

## Introduction

Snowtricks est le 6ème projet du parcours Développeur PHP / Symfony d'OpenClassrooms. 
Il s'agit d'un site communautaire autour du thème du snowboard. 
Ce site permet : 
- la création/modification/suppression de "tricks";
- visualisation sur page unique d'un trick avec ses attributs : (nom, description, catégorie(s), image(s) et vidéo(s);
				 
- la gestion des tricks n'est autorisée qu'aux utilisateurs inscrits;
- un espace de discussion sous chaque page de trick.

Egalement ce site fonctionne avec des slugs pour permettre un meilleur confort d'utilisation et un meilleur référencement. Il est possède également un système de récupération de mot de passe.

## Build

- Symfony 5.3
- Twig
- Jquery

## Requirements

- PHP 8.1
- Composer
- Server WEB
- MYSQL

## Installation 
- Cloner le projet
- Configurer le server Web sur le dossier du projet
- Editer le .env pour correspondre à votre server/mailer
- Exécuter  la commande "composer install";
- Exécuter la commande "php bin/console doctrine:database:create"

# Votre site communautaire est prêt à être utilisé !
