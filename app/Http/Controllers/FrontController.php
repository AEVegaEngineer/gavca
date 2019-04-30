<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use Session;
use Redirect;
use gavca\Http\Requests;
use gavca\Http\Controllers\Controller;

class FrontController extends Controller
{
    public function __construct(){
        $this->middleware('auth',['only' => 'admin']);
    }
    /**
     * Muestra el login.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if($user = Auth::user())
        {
            return Redirect::to('admin');
        }
        else
        {
            return view('auth.login');
        }        
    }

    /**
     * Retorna vista de administración.
     *
     * @return \Illuminate\Http\Response
     */
    public function admin()
    {
        return view('admin');
    }   
    /**
     * Retorna vista de recuperación de contraseña.
     *
     * @return \Illuminate\Http\Response
     */
    public function recover()
    {
        return view('auth/recover');
    } 
    
}
