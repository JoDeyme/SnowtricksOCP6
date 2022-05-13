<?php

namespace App\Repository;

use App\Entity\Comment;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Tools\Pagination\Paginator;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Comment|null find($id, $lockMode = null, $lockVersion = null)
 * @method Comment|null findOneBy(array $criteria, array $orderBy = null)
 * @method Comment[]    findAll()
 * @method Comment[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CommentRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)

    {
        parent::__construct($registry, Comment::class);
    }

    

    public function getCommentsByPage($page = 1, $pageSize = 10, $trick = false)
    {
        $comments = [];

        // build the query for the doctrine paginator
        if($trick) {
            $query = $this->createQueryBuilder('c')
                ->join('c.Trick', 't')
                ->orderBy('c.createAt', 'DESC')
                ->where('c.Trick = :trick')
                ->setParameter('trick', $trick)
                ->getQuery();
        }else{
            $query = $this->createQueryBuilder('c')
                ->orderBy('c.createAt', 'DESC')
                ->getQuery();
        }
    
        // load doctrine Paginator
        $paginator = new Paginator($query);

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

    // /**
    //  * @return Comment[] Returns an array of Comment objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('c.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Comment
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
