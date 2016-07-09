class Subcheckit < ActiveRecord::Base
  has_many :messages
  has_many :users, through: :messages

  has_many :moderators
  has_many :users, through: :moderators

  belongs_to :owner, class_name: "User", foreign_key: "created_by"

  validates_presence_of :category, :name
end
