class Tournament < ActiveRecord::Base
  belongs_to :user
  has_many :participations

  validates :name,
    presence: { message: 'Name is required' },
    uniqueness: { message: 'Tournament with this name already exists' }

  validates_date :deadline,
    presence: {message: 'Deadline is required'}
    # date: { after: Proc.new { Date.today }}

  validates :participation_limit,
    presence: {message: 'Participation limit is required'},
    numericality: { greater_than: 0 }

  validates :street,
    presence: {message: 'Street is required'}

  validates :city,
    presence: {message: 'City is required'}

  def participation_number
    @participation_number ||=
      self.participations.size
  end

  def check_participation_limit
    @state = self.participations.size == self.participation_limit ? true : false
  end

end
