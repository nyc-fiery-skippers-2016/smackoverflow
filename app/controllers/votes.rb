post '/votes' do
  @vote = Vote.new(params[:vote])
  if logged_in? && !(Vote.exists?(params[:vote]))
    @vote.save
  end
  redirect "/questions/#{@vote.question.id}"
end
