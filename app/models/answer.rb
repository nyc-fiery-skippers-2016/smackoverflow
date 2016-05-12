class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  def destroy_dependencies
    comments.each{|comment| comment.destroy}
    votes.each{|vote| vote.destroy}
  end

  def blurb
    return body if body.split.length <= 10
    body.split[0..10].join(" ") + "..."
  end

  def count_votes
    return 0 if votes.empty? || votes.nil?
    votes.map{|vote| vote.value }.map(&:to_i).inject(:+)
  end

  def count_comments
    comments.length
  end
end
