post '/answers' do
  @answer = Answer.new( params[:answer] )
  if request.xhr?
    @answer.save
    erb :'/questions/_comment_ajax', layout: false, locals: { answer: @answer, question_id: params[:answer][:question_id], type: @answer}
  else
    @answer.save
    redirect "/questions/#{ params[:answer][:question_id] }"
  end
end
