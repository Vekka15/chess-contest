class Tournament < ActiveRecord::Base
  belongs_to :user
  has_many :participations
  before_validation :fix_address, only: [:create]

  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode

  scope :finished, -> { where("deadline < ?", Date.today) }
  scope :unfinished, -> { where("deadline >= ?", Date.today) }

  validates :name,
    presence: { message: 'Name is required' },
    uniqueness: { message: 'Tournament with this name already exists' }

  validates :deadline,
    presence: {message: 'Deadline is required'}
    # format: {with: /[0-3]{1}[0-9]{1}\/[0-1]{1}[0-9]{1}\/[1-2]{1}[0-9]{3}/, message: "Time is in wrong format"}
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

  def check_if_participate(user)
    @state = self.participations.where(user_id: user).empty?
  end

  def fix_address
    binding.pry
    self.full_street_address = self.street + ", " + self.city
  end

end
