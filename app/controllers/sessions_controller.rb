get '/login' do
  erb :'login/new'
end

post '/login' do
  @user = User.new(params[:user])

  if @login.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ["Did you input a username and password?"]
    erb :'login/new'
  end
end
