class Post < ActiveRecord::Base
belongs_to :user
belongs_to :subcheckit

has_many :votes
has_many :comments

validates_presence_of :title, :content, :user_id, :subcheckit_id

def vote_total
  self.votes.reduce(0) { |sum, vote| sum + vote.vote }
end

def upvote_color user
  vote = user.votes.find_by post_id: self.id
  if vote && vote.vote == 1
     return "orange"
  else
    return ""
  end
end

def downvote_color user
  vote = user.votes.find_by post_id: self.id
  if vote && vote.vote == -1
     return "orange"
  else
    return ""
  end
end

end
