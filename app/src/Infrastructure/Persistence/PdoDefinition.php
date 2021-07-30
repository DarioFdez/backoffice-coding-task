<?php

declare(strict_types=1);

namespace App\Infrastructure\Persistence;

use PDO;

class PdoDefinition
{
    /**
     * @return PDO
     */
    public static function build(): PDO
    {
        $dsn = "mysql:host=db;port=3306;dbname=good_old_videogames;charset=utf8";
        return new PDO($dsn, 'root', 'root');
    }
}
