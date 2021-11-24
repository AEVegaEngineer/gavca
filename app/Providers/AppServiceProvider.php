<?php

namespace gavca\Providers;

use DB;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\URL;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        if (env('APP_ENV') != 'local') {
            URL::forceScheme('https');
        }
        Validator::extend('uniqueClienteNombre', function ($attribute, $value, $parameters, $validator) {
            $count = DB::table('clientes')->where('cli_nombre', $value)
                ->where('cli_codigo', $parameters[0])
                ->count();
            if($count>0)                
                return false;
            else
                return true;
        });        
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        if (env('APP_ENV') === 'production') {
            $this->app['request']->server->set('HTTPS', true);
        }
    }
}
