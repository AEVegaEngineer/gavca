<?php

namespace gavca\Http;

use Illuminate\Foundation\Http\Kernel as HttpKernel;

class Kernel extends HttpKernel
{
    /**
     * The application's global HTTP middleware stack.
     *
     * @var array
     */
    protected $middleware = [
        \Illuminate\Foundation\Http\Middleware\CheckForMaintenanceMode::class,
        \gavca\Http\Middleware\EncryptCookies::class,
        \Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse::class,
        \Illuminate\Session\Middleware\StartSession::class,
        \Illuminate\View\Middleware\ShareErrorsFromSession::class,
        \gavca\Http\Middleware\VerifyCsrfToken::class,
    ];

    /**
     * The application's route middleware.
     *
     * @var array
     */
    protected $routeMiddleware = [
        'auth' => \gavca\Http\Middleware\Authenticate::class,
        'auth.basic' => \Illuminate\Auth\Middleware\AuthenticateWithBasicAuth::class,
        'guest' => \gavca\Http\Middleware\RedirectIfAuthenticated::class,
        'admin' => \gavca\Http\Middleware\Admin::class,
        'adminotipo1' => \gavca\Http\Middleware\AdminOTipo1::class,
        'todos' => \gavca\Http\Middleware\Todos::class,
        'currentuser' => \gavca\Http\Middleware\CurrentUser::class,
    ];
}
