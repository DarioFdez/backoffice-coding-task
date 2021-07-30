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

    /*public function testGetAllGames(): void
    {
        var_dump($this->sut->getAllGames());
        die();
    }*/
}
