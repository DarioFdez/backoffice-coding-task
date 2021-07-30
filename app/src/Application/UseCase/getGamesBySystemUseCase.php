<?php

declare(strict_types=1);

namespace App\Application\UseCase;

use App\Domain\Games\GamePaginationException;
use App\Domain\Games\GamesCollection;
use App\Domain\GamesRepositoryInterface;

class getGamesBySystemUseCase
{
    /** @var GamesRepositoryInterface */
    private $gamesRepository;

    /**
     * getGamesByCompanyUseCase constructor.
     * @param GamesRepositoryInterface $gamesRepository
     */
    public function __construct(GamesRepositoryInterface $gamesRepository)
    {
        $this->gamesRepository = $gamesRepository;
    }

    public function execute(int $id, int $page): string
    {
        if ($page === 0) {
            throw GamePaginationException::build();
        }
        return $this->gamesRepository->getGamesBySystem($id, $page)->toJson();
    }
}
