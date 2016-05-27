class ParticipationsController < ApplicationController
  def create

    participation = Participation.new(user_id: params[:user_id],
                                      tournament_id: params[:tournament_id])
    if participation.save
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js {flash[:error] = 'You already participate in this tournament'}
      end
    end
  end
end
