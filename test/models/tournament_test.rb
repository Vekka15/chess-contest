require "test_helper"

class TournamentTest < ActiveSupport::TestCase
  def tournament
    @tournament ||= Tournament.new
  end

  def test_valid
    assert tournament.valid?
  end
end
