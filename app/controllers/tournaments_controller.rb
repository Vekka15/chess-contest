class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.order("name").page(params[:page]).per(5)
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

  before_filter :authenticate_user!, except: [:index]
end
