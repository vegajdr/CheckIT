class Moderator < ActiveRecord::Base
  belongs_to :user
  belongs_to :subcheckit

  validates_uniqueness_of :user_id, scope: :subcheckit_id
  validates_presence_of :user_id, :subcheckit_id
end
