User.create(username: "SansaStark", password: "winterfell")
User.create(username: "JaimeLannister", password: "cersei")
User.create(username: "Tyrion", password: "hatethisplace")

Question.create(title: "What would Tyrion Lannister say if you told him you don't want to marry him?", body: "I don't want to marry this evil dwarf whose cousin is such a douchebag. What do I do?", user_id: 1)

Comment.create(body: "I don't know, but good for you!", user_id: 2, commentable_id: 1, commentable_type: "Question")

Answer.create(body: "I have no control over these sorts of things. Sorry!", question_id: 1, user_id: 3)
