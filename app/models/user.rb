class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :participations
  has_many :tournaments
  has_many :duels, class_name: 'Duel', foreign_key: 'user_one_id'
  has_many :duels_two, class_name: 'Duel', foreign_key: 'user_two_id'
end
