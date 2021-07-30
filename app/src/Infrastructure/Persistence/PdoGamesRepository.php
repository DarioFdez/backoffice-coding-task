<?php

declare(strict_types=1);

namespace App\Infrastructure\Persistence;

use App\Domain\Games\Game;
use App\Domain\Games\GamesCollection;
use App\Domain\GamesRepositoryInterface;
use DateTime;
use PDO;
use PDOStatement;

class PdoGamesRepository implements GamesRepositoryInterface
{
    private const QUERY_OFFSET = 3;
    /** @var PDO */
    private $pdo;
    /** @var int */
    private $offset;

    public function __construct()
    {
        $this->pdo = PdoDefinition::build();
        $this->offset = self::QUERY_OFFSET;
    }
    public function getGamesByCompany(int $companyId, int $page): ?GamesCollection
    {
        $start = $this->getPagination($page);
        $query = $this->pdo->prepare(
            <<<SQL
                SELECT
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
                WHERE games.company_id = :company_id
                LIMIT :start , :offset
SQL
        );
        $query->bindParam(':start', $start, PDO::PARAM_INT);
        $query->bindParam(':company_id', $companyId, PDO::PARAM_INT);
        $query->bindParam(':offset', $this->offset, PDO::PARAM_INT);
        $query->execute();

        return $this->buildGamesCollectionFromRaw($query);
    }

    public function getGamesBySystem(int $systemId, int $page): ?GamesCollection
    {
        $start = $this->getPagination($page);
        $query = $this->pdo->prepare(
            <<<SQL
                SELECT
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
                WHERE games.system_id = :system_id
                LIMIT :start , :offset
SQL
        );
        $query->bindParam(':start', $start, PDO::PARAM_INT);
        $query->bindParam(':system_id', $systemId, PDO::PARAM_INT);
        $query->bindParam(':offset', $this->offset, PDO::PARAM_INT);
        $query->execute();

        return $this->buildGamesCollectionFromRaw($query);
    }

    public function getAllGames(int $page): GamesCollection
    {
        $start = $this->getPagination($page);
        $query = $this->pdo->prepare(
            <<<SQL
                SELECT
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
                LIMIT :start , :offset
SQL
        );
        $query->bindParam(':start', $start, PDO::PARAM_INT);
        $query->bindParam(':offset', $this->offset, PDO::PARAM_INT);
        $query->execute();

        return $this->buildGamesCollectionFromRaw($query);
    }

    private function buildGamesCollectionFromRaw(PDOStatement $raw): GamesCollection
    {
        $games = [];
        foreach ($raw->fetchAll() as $game) {
            $games[] = new Game(
                (int)$game['id'],
                $game['title'],
                DateTime::createFromFormat('Y-m-d', $game['released_on']),
                $game['companyName'],
                $game['location'],
                $game['systemName'],
                $game['type']
            );
        }

        return new GamesCollection(...$games);
    }

    private function getPagination(int $page)
    {
        return $page === 1
            ? 0
            : $page * $this->offset;
    }
}
