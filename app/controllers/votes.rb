post '/votes' do
  if logged_in? && !(Vote.exists?(params[:vote]))
    vote = Vote.create(params[:vote])
  end
  redirect "/questions/#{vote.question.id}"
end
