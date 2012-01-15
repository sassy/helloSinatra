use Rack::Session::Cookie,
:expire_after => 3600,
:secret => 'test'

helpers do
  def auth_ok?(user, password)
    user == 'guest' && password == 'guest'
  end

  def login
    if auth_ok?(params['user'], params['password'])
      session[:login] = 'test'
      redirect '/'
    else
      redirect '/login'
    end
  end

  def logout
    session.delete(:login)
    redirect '/'
  end

  def need_auth
    unless session[:login]
      redirect '/login'
    else
      yield
    end
  end
end
