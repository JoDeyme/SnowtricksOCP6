<?php

namespace App\Service;

use App\Entity\Comment;
use Doctrine\ORM\EntityManagerInterface;

class CustomPaginatorService

{

private $entityManager;


    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }



    public function getCommentsByPage($page = 1, $pageSize = 10, $trick = false)
    {
        $comments = [];

        // get the comment repository
        $developers = $this->entityManager->getRepository(Comment::class);

        // build the query for the doctrine paginator
        if($trick) {
            $query = $developers->createQueryBuilder('c')
                ->join('c.Trick', 't')
                ->orderBy('c.createAt', 'DESC')
                ->where('c.Trick = :trick')
                ->setParameter('trick', $trick)
                ->getQuery();
        }else{
            $query = $developers->createQueryBuilder('c')
                ->orderBy('c.createAt', 'DESC')
                ->getQuery();
        }
    
        // load doctrine Paginator
        $paginator = new \Doctrine\ORM\Tools\Pagination\Paginator($query);

        // you can get total items
        $totalItems = count($paginator);

        // get total pages
        $pagesCount = ceil($totalItems / $pageSize);

        // now get one page's items:
        $firstResult = $pageSize * ($page-1);
        $paginator
            ->getQuery()
            ->setFirstResult($firstResult) // set the offset
            ->setMaxResults($pageSize); // set the limit

        foreach ($paginator as $pageItem) {
            $comments[] = $pageItem;
        }

        // return stuff..
        return ['comments'=>$comments,'pagesCount'=>$pagesCount];
    }

}