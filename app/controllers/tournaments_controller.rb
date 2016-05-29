class TournamentsController < ApplicationController
  def index
    if params[:tab]=='finished'
      params[:tab] = 'finished'
      @tournaments = Tournament.finished.order("name").page(params[:page]).per(5)
    else
      params[:tab] = 'incoming'
      @tournaments = Tournament.unfinished.order("name").page(params[:page]).per(5)
    end
  end

  def edit
    @tournament = Tournament.find(params[:id])
  end

  def update
    @tournament = Tournament.find(params[:id])
    if @tournament.update(tournament_params)
      redirect_to tournament_path(@tournament)
    else
      render :edit
    end
  end

  def show
    if params[:tab] == 'brackets'
      params[:tab] = 'brackets'
      @tournament = Tournament.find(params[:id])
      @duels = @tournament.duels
    elsif params[:tab] == 'info'
      params[:tab] = 'info'
      @tournament = Tournament.find(params[:id])
    else
      params[:tab] = 'map'
      @tournament = Tournament.find(params[:id])
      @hash = Gmaps4rails.build_markers(@tournament) do |tournament, marker|
        marker.lat tournament.latitude
        marker.lng tournament.longitude
      end
    end
  end

  def new
    @tournament = Tournament.new
  end

  def create
    params[:tournament][:deadline] = Date.strptime(params[:tournament][:deadline], "%m/%d/%Y")
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
      respond_to do |format|
        format.html { redirect_to root_path}
      end
    else
      params[:tab] = 'info'
      render :new
    end
  end

  def tournament_params
    params.require(:tournament).permit(:name, :user_id,
                                       :participation_limit, :deadline,
                                       :street, :city, :full_street_address)
  end

  before_filter :authenticate_user!, except: [:index, :show]
end
