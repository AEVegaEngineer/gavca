<?php

namespace gavca\Http\Middleware;

use Closure;
use Illuminate\Contracts\Auth\Guard;
use Session;

class CurrentUser
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
        $id = $request->route('id');
        if($this->auth->user()->id != $id){
            Session::flash('message-error','Usted no tiene los privilegios necesarios para acceder a esta area. CurrentUserError'.$this->auth->user()->id."!=".$id);
            return redirect()->to('admin');
        }
        return $next($request);
    }
}
