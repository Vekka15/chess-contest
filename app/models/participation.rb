class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :tournament
  has_many :user_one, class_name: 'Duel', foreign_key: 'user_one_id'
  has_many :user_two, class_name: 'Duel', foreign_key: 'user_two_id'

  validates :user_id,
    presence: {message: "Presence is required"},
    uniqueness: {scope: [:tournament_id]}

end
