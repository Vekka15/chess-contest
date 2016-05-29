require 'clockwork'

require './config/boot'
require './config/environment'

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

  every(1.day, 'midnight.job', :at => '00:00') do
    DuelDraw.perform_async()
  end
end
