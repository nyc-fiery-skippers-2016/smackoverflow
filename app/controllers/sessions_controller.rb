get '/login' do
  if logged_in?
    redirect '/'
  else
    erb :'login/new'
  end
end

post '/login' do
  user = User.find_by(username: params[:username])

  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  elsif user
    @errors = ["Incorrect password!"]
    erb :'login/new'
  else
    @errors = ["No such user found! Please make a new account:"]
    erb :'users/new'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
