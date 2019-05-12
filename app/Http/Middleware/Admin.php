<?php

namespace gavca\Http\Middleware;

use Closure;
use Illuminate\Contracts\Auth\Guard;
use Session;

class Admin
{
    protected $auth;

    public function __construct(Guard $auth){
        $this->auth = $auth;
    }
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if($this->auth->user()->privilegio != 'admin'){
            Session::flash('message-error','Usted no tiene los privilegios necesarios para acceder a esta area. ');
            return redirect()->to('admin');
        }
        return $next($request);
    }
}
