class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  validates :body, :title, presence: true

  def count_votes
    return 0 if votes.empty? || votes.nil?
    votes.map{|vote| vote.value }.map(&:to_i).inject(:+)
  end

  def count_answers
    answers.length
  end

  def count_comments
    comments.length
  end

  def destroy_dependencies
    answers.each{|answer| answer.destroy}
    comments.each{|comment| comment.destroy}
    votes.each{|vote| vote.destroy}
  end

end
