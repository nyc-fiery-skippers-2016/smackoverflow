class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  validates :body, :title, presence: true

  def self.count_votes(question)
    votes = question.votes
    votes.map{|vote| vote.value }.map(&:to_i).inject(:+)
  end

  def number_of_answers
    answers.length
  end

  def number_of_comments
    comments.length
  end

end
