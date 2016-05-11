class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  has_secure_password
  validates :username, presence: true, uniqueness: true

  def self.get_quote
    quotes = ["Money buys a man's silence for a time. A bolt in the heart buys it forever- Petyr Baelish",
      "Can a man still be brave when he's afraid?- Bran",
      "Explain to me why it's more noble to kill 10,000 men in battle than a dozen at dinner - Tywin Lannister",
      "The more people you love, the weaker you are- Cersei Lannister",
      "A very small man can cast a very large shadow- Lord Varys",
      "There is only one thing we say to death- not today. - Syrio Forel",
      "A lion doesn't concern himself with the opinion of the sheep- Tywin Lannister",
      "Any man who must say,'I am the king' is no true king- Tywin Lannister"]

    quotes.sample
  end
end
