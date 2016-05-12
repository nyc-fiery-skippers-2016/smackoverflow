post '/comments' do
  @comment = Comment.new( params[:comment] )
  if request.xhr?
    @comment.save
    erb :'questions/_comment', layout: false, locals: { comment: @comment }
  else
    @comment.save
    redirect "/questions/#{ params[:question_id] }"
  end
end
