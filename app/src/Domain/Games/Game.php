<?php

declare(strict_types=1);

namespace App\Domain\Games;

use DateTime;

class Game
{
    private const NIPON_TAG = 'Nipón';
    private const MACHACABOTONES_TAG = 'Machacabotones';
    private const OLD_BUT_GOLDIE_TAG = 'Oldie but Goldie';
    private const VINTAGE_TAG = 'Vintage';
    private const JAPAN_COMPANY = 'Japón';
    private const BEAT_EM_UP_TYPE = 'Beat \'em up';

    /** @var int */
    private $id;
    /** @var string */
    private $title;
    /** @var DateTime */
    private $releasedOn;
    /** @var string */
    private $company;
    /** @var array */
    private $tags;
    /** @var string */
    private $companyCountry;
    /** @var string */
    private $system;
    /** @var string */
    private $type;

    /**
     * Game constructor.
     * @param int $id
     * @param string $title
     * @param DateTime $releasedOn
     * @param string $company
     */
    public function __construct(
        int $id,
        string $title,
        DateTime $releasedOn,
        string $company,
        string $companyCountry,
        string $system,
        string $type
    ) {

        $this->id = $id;
        $this->title = $title;
        $this->releasedOn = $releasedOn;
        $this->company = $company;
        $this->companyCountry = $companyCountry;
        $this->system = $system;
        $this->type = $type;
        $this->tags = [];

        $this->createTags();
    }

    /** @return int */
    public function id(): int
    {
        return $this->id;
    }

    /** @return string */
    public function title(): string
    {
        return $this->title;
    }

    /** @return DateTime */
    public function releasedOn(): DateTime
    {
        return $this->releasedOn;
    }

    /** @return string */
    public function company(): string
    {
        return $this->company;
    }

    /** @return string */
    public function system(): string
    {
        return $this->system;
    }

    /** @return string */
    public function type(): string
    {
        return $this->type;
    }

    /** @return array */
    public function tags(): array
    {
        return $this->tags;
    }

    private function createTags(): void
    {
        if (self::JAPAN_COMPANY === $this->companyCountry) {
            $this->addTag(self::NIPON_TAG);
        }

        if (self::BEAT_EM_UP_TYPE === $this->type) {
            $this->addTag(self::MACHACABOTONES_TAG);
        }

        $timeAgo = strtotime('now') - strtotime((string)$this->releasedOn->getTimestamp());
        $timeAgoInYears = $timeAgo / 60 / 60 / 30 / 12;
        if ($timeAgoInYears >= 20) {
            $this->addTag(self::VINTAGE_TAG);
        }

        if($timeAgoInYears >= 30) {
            $this->addTag(self::OLD_BUT_GOLDIE_TAG);
        }
    }

    private function addTag(string $tag): void
    {
        $this->tags[] = $tag;
    }
}
