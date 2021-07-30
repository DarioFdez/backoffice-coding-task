<?php

declare(strict_types=1);

namespace App\Infrastructure\Slim\Action\Games;

use App\Infrastructure\Slim\Action\Action;
use Psr\Http\Message\ResponseInterface as Response;

class GamesAction extends Action
{
    protected function action(): Response
    {
        return $this->respondWithData([
            'message' => '¡Hola mundo!',
            'ruta' => __FILE__,
        ]);
    }
}
