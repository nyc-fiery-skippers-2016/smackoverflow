class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :voteable

  def destroy_dependencies
    votes.each{|vote| vote.destroy}
  end
end
