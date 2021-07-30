<?php

declare(strict_types=1);

namespace App\Domain;

use App\Domain\Games\GamesCollection;

interface GamesRepositoryInterface
{
    public function getGamesByCompany(int $companyId, int $page): ?GamesCollection;
    public function getGamesBySystem(int $systemId, int $page): ?GamesCollection;
    public function getAllGames(int $page): GamesCollection;
}
