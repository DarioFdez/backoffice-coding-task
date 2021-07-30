<?php

declare(strict_types=1);

namespace Tests\Domain\Games;

use App\Domain\Games\Game;
use App\Domain\Games\GamesCollection;

class GamesCollectionMotherObject
{
    public static function buildAllGames(): GamesCollection
    {
        return new GamesCollection(
            new Game(
                1,
                'Alex Kidd in Miracle world',
                \DateTime::createFromFormat('Y-m-d', '1986-11-01'),
                'SEGA',
                'Japón',
                'Master System',
                'Plataformas'
            ),
            new Game(
                2,
                'Phantasy Star',
                \DateTime::createFromFormat('Y-m-d', '1986-11-01'),
                'SEGA',
                'Japón',
                'Master System',
                'JRPG'
            ),
            new Game(
                3,
                'Sonic 2',
                \DateTime::createFromFormat('Y-m-d', '1986-11-01'),
                'Aspect',
                'Japón',
                'Master System',
                'Plataformas'
            )
        );
    }
    public static function buildGamesFromCompany(): GamesCollection
    {
        return new GamesCollection(
            new Game(
                1,
                'Alex Kidd in Miracle world',
                \DateTime::createFromFormat('Y-m-d', '1986-11-01'),
                'SEGA',
                'Japón',
                'Master System',
                'Plataformas'
            ),
            new Game(
                2,
                'Phantasy Star',
                \DateTime::createFromFormat('Y-m-d', '1986-11-01'),
                'SEGA',
                'Japón',
                'Master System',
                'JRPG'
            )
        );
    }
}

