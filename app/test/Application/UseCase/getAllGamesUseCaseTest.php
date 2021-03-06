<?php

declare(strict_types=1);

namespace Tests\Application\UseCase;

use App\Application\UseCase\getAllGamesUseCase;
use App\Domain\Games\GamePaginationException;
use App\Domain\GamesRepositoryInterface;
use PHPUnit\Framework\MockObject\MockObject;
use PHPUnit\Framework\TestCase;
use Tests\Domain\Games\GamesCollectionMotherObject;

class getAllGamesUseCaseTest extends TestCase
{
    /** @var GamesRepositoryInterface|MockObject */
    private $repository;
    /** @var getAllGamesUseCase */
    private $sut;

    protected function setUp(): void
    {
        parent::setUp();
        $this->repository = $this->createMock(GamesRepositoryInterface::class);
        $this->sut = new getAllGamesUseCase($this->repository);
    }

    public function testGetAllGames(): void
    {
        $this->repository
            ->expects(self::once())
            ->method('getAllGames')
            ->willReturn(GamesCollectionMotherObject::buildAllGames());

        $result = $this->sut->execute(1);
        $resultToArray = json_decode($result);
        $this->assertCount(3, $resultToArray);
    }

    public function testReturnExceptionWhenPageIsZero(): void
    {
        $this->expectException(GamePaginationException::class);
        $this->sut->execute(0);
    }
}
