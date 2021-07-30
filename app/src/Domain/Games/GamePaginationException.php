<?php

declare(strict_types=1);

namespace App\Domain\Games;

use App\Domain\DomainException\DomainException;

class GamePaginationException extends DomainException
{
    private const MESSAGE = 'Page is required';

    public static function build(): self
    {
        return new self(self::MESSAGE);
    }
}
