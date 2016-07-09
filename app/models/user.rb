 class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_many :votes

 has_many :messages
 has_many :subcheckits, through: :messages

 has_many :moderators
 has_many :subcheckits, through: :moderators
end
