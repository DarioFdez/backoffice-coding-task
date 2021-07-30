<?php

declare(strict_types=1);

namespace Tests\Application\UseCase;

use App\Application\UseCase\getAllGamesUseCase;
use App\Application\UseCase\getGamesByCompanyUseCase;
use App\Domain\Games\GamePaginationException;
use App\Domain\GamesRepositoryInterface;
use PHPUnit\Framework\MockObject\MockObject;
use PHPUnit\Framework\TestCase;
use Tests\Domain\Games\GamesCollectionMotherObject;

class getGamesByCompanyUseCaseTest extends TestCase
{
    /** @var GamesRepositoryInterface|MockObject */
    private $repository;
    /** @var getAllGamesUseCase */
    private $sut;

    protected function setUp(): void
    {
        parent::setUp();
        $this->repository = $this->createMock(GamesRepositoryInterface::class);
        $this->sut = new getGamesByCompanyUseCase($this->repository);
    }

    public function testGamesFromCompany(): void
    {
        $this->repository
            ->expects(self::once())
            ->method('getGamesByCompany')
            ->willReturn(GamesCollectionMotherObject::buildGamesFromCompany());

        $result = $this->sut->execute(1,1);
        $resultToArray = json_decode($result);
        $this->assertCount(2, $resultToArray);
        foreach ($resultToArray as $game) {
            $this->assertEquals('SEGA', $game->company);
        }
    }

    public function testReturnExceptionWhenPageIsZero(): void
    {
        $this->expectException(GamePaginationException::class);
        $this->sut->execute(1,0);
    }
}
