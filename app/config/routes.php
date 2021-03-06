<?php
declare(strict_types=1);

use App\Infrastructure\Slim\Action\Companies\CompaniesAction;
use App\Infrastructure\Slim\Action\Games\GamesAction;
use App\Infrastructure\Slim\Action\Hello\GreetingAction;
use App\Infrastructure\Slim\Action\Systems\SystemsAction;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\App;

return static function (App $app) {
    $app->options('/{routes:.*}', function (Request $request, Response $response) {
        // CORS Pre-Flight OPTIONS Request Handler
        return $response;
    });

    $app->get('/', GreetingAction::class);
    $app->get('/companies', CompaniesAction::class);
    $app->get('/systems', SystemsAction::class);
    $app->get('/games', GamesAction::class);
};
