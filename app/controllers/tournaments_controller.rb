class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
  end

  def new
    @tournament = Tournament.new
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def create
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
      respond_to do |format|
        format.html { redirect_to tournament_path(@tournament) }
      end
    else
      render :new
    end
  end

  def tournament_params
    params.require(:tournament).permit(:name, :user_id,
                                       :time, :participation_limit, :deadline)
  end
end
