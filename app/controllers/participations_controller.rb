class ParticipationsController < ApplicationController
  def create

    participation = Participation.new(user_id: params[:user_id],
                                      tournament_id: params[:tournament_id])
    if participation.save
      respond_to do |format|
        format.js {}
      end
    else
      respond_to do |format|
        if current_user.nil?
          flash[:error] = 'You need to log in to participate'
        else
          flash[:error] = 'You already participate in this tournament'
        end
        format.js {render status: 500 }
      end
    end
  end

  def destroy
    participation = Participation.find(params[:id])
    if participation.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
