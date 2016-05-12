class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  def destroy_dependencies
    comments.each{|comment| comment.destroy}
    votes.each{|vote| vote.destroy}
  end
end
