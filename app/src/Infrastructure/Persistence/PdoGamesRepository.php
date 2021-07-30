<?php

declare(strict_types=1);

namespace App\Infrastructure\Persistence;

use App\Domain\Games\Game;
use App\Domain\Games\GamesCollection;
use App\Domain\GamesRepositoryInterface;
use DateTime;
use PDO;

class PdoGamesRepository implements GamesRepositoryInterface
{
    /** @var PDO */
    private $pdo;

    public function __construct()
    {
        $dsn = "mysql:host=db;port=3306;dbname=good_old_videogames;charset=utf8";
        $this->pdo = new PDO($dsn, 'root', 'root');
    }
    public function getGamesByCompany(int $companyId, int $page): ?GamesCollection
    {
        // TODO: Implement getGamesByCompany() method.
    }

    public function getGamesBySystem(int $systemId, int $page): ?GamesCollection
    {
        // TODO: Implement getGamesBySystem() method.
    }

    public function getAllGames(int $page): GamesCollection
    {
        $offset = $page + 3;
        $query = $this->pdo->prepare(
            "SELECT
                games.id,
                games.title,
                games.released_on,
                companies.name as companyName,
                companies.location,
                systems.name as systemName,
                games.type
            FROM
                games
            INNER JOIN
                    companies ON games.company_id = companies.id
            INNER JOIN
                    systems ON games.system_id = systems.id
            LIMIT :page , :offset"
        );
        $query->bindParam(':page', $page, PDO::PARAM_INT);
        $query->bindParam('offset', $offset, PDO::PARAM_INT);
        $query->execute();

       $games = [];
       foreach ($query->fetchAll() as $game) {
           $games[] = new Game(
               $game['id'],
               $game['title'],
               DateTime::createFromFormat('Y-m-d', $game['release_on']),
               $game['companyName'],
               $game['location'],
               $game['systemName'],
               $game['type']
           );
       }

       return new GamesCollection(...$games);
    }
}
