post '/comments' do
  @comment = Comment.new( params[:comment] )
  if @comment.save
    redirect "/questions/#{ params[:question_id] }"
  end
end
