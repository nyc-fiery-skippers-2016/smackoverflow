post '/answers' do
  @answer = Answer.new( params[:answer] )
  if @answer.save
    redirect "/questions/#{ params[:answer][:question_id] }"
  end
end
