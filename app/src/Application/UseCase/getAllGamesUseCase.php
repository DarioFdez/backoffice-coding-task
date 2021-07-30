<?php

declare(strict_types=1);

namespace App\Application\UseCase;

use App\Domain\Games\GamePaginationException;
use App\Domain\Games\GamesCollection;
use App\Domain\GamesRepositoryInterface;

class getAllGamesUseCase
{
    /** @var GamesRepositoryInterface */
    private $gamesRepository;

    /**
     * getAllGamesUseCase constructor.
     * @param GamesRepositoryInterface $gamesRepository
     */
    public function __construct(GamesRepositoryInterface $gamesRepository)
    {
        $this->gamesRepository = $gamesRepository;
    }

    /**
     * @throws GamePaginationException
     */
    public function execute(int $page): string
    {
        if ($page === 0) {
            throw GamePaginationException::build();
        }
        return $this->gamesRepository->getAllGames($page)->toJson();
    }
}
