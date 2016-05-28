require "test_helper"

class DuelTest < ActiveSupport::TestCase
  def duel
    @duel ||= Duel.new
  end

  def test_valid
    assert duel.valid?
  end
end
