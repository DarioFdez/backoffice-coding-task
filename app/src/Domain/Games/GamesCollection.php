<?php

declare(strict_types=1);

namespace App\Domain\Games;

class GamesCollection
{
    /** @var Game[] */
    private $collection;

    public function __construct(Game ...$game)
    {
        $this->collection = $game;
    }

    public function count(): int
    {
        return count($this->collection);
    }

    public function collection(): array
    {
        return $this->collection;
    }

    public function toJson(): string
    {
        if (0 === $this->count()) {
            return '{}';
        }

        $data = [];
        foreach ($this->collection as $game) {
            $tags = [];
            foreach ($game->tags() as $tag) {
                $tags[] = $tag;
            }
            $data[] = [
                'id' => $game->id(),
                'title' => $game->title(),
                'type' => $game->type(),
                'released_on' => $game->releasedOn()->format('Y-m-d'),
                'company' => $game->company(),
                'system' => $game->system(),
                'tags' => $tags
            ];
        }

        $encode = json_encode($data);

        if ($encode === false) {
            return '{}';
        }

        return $encode;
    }
}
