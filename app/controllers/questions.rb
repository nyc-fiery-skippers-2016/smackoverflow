# this serves the index page with all questions
get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

# this serves a form to post a new question
get '/questions/new' do
  if logged_in?
    erb :'/questions/new'
  else
    @errors = ["You must be logged in to do this."]
    erb :'/login/new'
  end
end

# this handles saving the new question
post '/questions' do
  title = params[:title]
  body = params[:body]
  user_id = current_user.id
  @question = Question.new(title: title, body: body, user_id: user_id)
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'/questions/new'
  end
end

# this shows a specific question on a show page
get '/questions/:id' do
  @question = Question.find_by( id: params[ :id ] )
  @vote_count = Question.count_votes(@question)
  erb :'questions/show'
end

# this serves a specific question for editing
get '/questions/:id/edit' do
  @question = Question.find_by( id: params[ :id ] )
  if logged_in? && current_user.id == @question.user_id
    erb :'questions/edit'
  else
    redirect '/questions/index'
  end
end

# this handles saving and posting the edited question
put '/questions/:id' do
  @question = Question.find_by( id: params[ :id ] )
  @question.assign_attributes( params[ :question ] )
  if @question.save
    redirect "/questions/<%= @question.id %>"
  else
    @errors = @question.errors.full_messages
    erb :'questions/edit'
  end
end

# this destroys the question from the database
delete '/questions/:id' do
  question = Question.find_by( id: params[ :id ] )
  question.destroy_dependencies
  question.destroy
  redirect '/questions'
end
