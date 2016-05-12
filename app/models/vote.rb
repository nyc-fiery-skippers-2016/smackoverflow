class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  def question
    if voteable_type == "Question"
      Question.find_by(id: voteable_id)
    elsif voteable_type == "Answer"
      parent_answer = Answer.find_by(id: voteable_id)
      parent_answer.question
    elsif voteable_type == "Comment"
      parent_comment = Comment.find_by(id: voteable_id)
      parent_comment.question
    end
  end
end
