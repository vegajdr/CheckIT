class Vote < ActiveRecord::Base

  validates_uniqueness_of :user_id, scope: :post_id, post: "Only one vote per post"

  belongs_to :user
  belongs_to :post
  belongs_to :comment

end
