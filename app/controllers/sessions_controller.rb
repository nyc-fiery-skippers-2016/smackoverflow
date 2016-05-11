get '/login' do
  if logged_in?
    redirect '/'
  else
    erb :'login/new'
  end
end

post '/login' do
  @user = User.find_by(params[:user])

  if @user
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ["Did you input a username and password?"]
    erb :'login/new'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
