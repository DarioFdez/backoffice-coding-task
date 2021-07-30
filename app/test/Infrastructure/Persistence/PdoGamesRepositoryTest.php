<?php

declare(strict_types=1);

namespace Tests\Infrastructure\Persistence;

use App\Infrastructure\Persistence\PdoGamesRepository;
use PHPUnit\Framework\TestCase;

class PdoGamesRepositoryTest extends TestCase
{
    /** @var PdoGamesRepository */
    private $sut;

    protected function setUp(): void
    {
        parent::setUp();
        $this->sut = new PdoGamesRepository();
    }

    public function testGetAllGamesHappyPath(): void
    {
        $result = $this->sut->getAllGames(1);
        $this->assertEquals(3, $result->count());
    }

    public function testGetAllGamesWhenPageIsOutOfRange(): void
    {
        $result = $this->sut->getAllGames(1000);
        $this->assertEquals(0, $result->count());
        $this->assertEquals('{}', $result->toJson());
    }

    public function testGetGamesByCompanyHappyPath(): void
    {
        $result = $this->sut->getGamesByCompany(1, 1);
        $this->assertEquals(3, $result->count());
    }

    public function testGetGamesByCompanyCheckGamesAreFromCorrectCompany(): void
    {
        $result = $this->sut->getGamesByCompany(1, 1);
        foreach ($result->collection() as $game)
        {
            $this->assertEquals('SEGA', $game->company());
        }
    }

    public function testGetGamesBySystemHappyPath(): void
    {
        $result = $this->sut->getGamesBySystem(1, 1);
        $this->assertEquals(3, $result->count());
    }

    public function testGetGamesByCompanyCheckGamesAreFromCorrectSystem(): void
    {
        $result = $this->sut->getGamesBySystem(1, 1);
        foreach ($result->collection() as $game)
        {
            $this->assertEquals('Master System', $game->system());
        }
    }
}
