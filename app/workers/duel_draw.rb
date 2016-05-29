class DuelDraw
  include Sidekiq::Worker

  def perform
    tournaments = Tournament.all
    tournaments.each do |t|
      if Date.today == t.deadline
        tournament = Tournament.last
        participations = tournament.participations
        participations.each do |s|
          puts s.user_id
        end
        shuffled = participations.shuffle
        shuffled.each do |s|
          puts s.user_id
        end

        shuffled.each_with_index do |s, index|
          if index%2==0
            @duel = Duel.new(tournament_id: tournament.id, user_one: s.user)
            @duel.save
          else
            @duel.update(user_two: s.user)
          end
        end
      end
    end
  end
end
