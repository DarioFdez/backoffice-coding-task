<?php

declare(strict_types=1);

namespace App\Application\UseCase;

use App\Domain\Games\GamesCollection;
use App\Domain\GamesRepositoryInterface;

class getGamesByCompanyUseCase
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

    public function execute(int $id, int $page): GamesCollection
    {
        return $this->gamesRepository->getGamesByCompany($id, $page);
    }
}
