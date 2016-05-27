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

  def new
    @tournament = Tournament.new
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def create
    binding.pry
    params[:tournament][:deadline] = Date.strptime(params[:tournament][:deadline], "%m/%d/%Y")
        binding.pry
    @tournament = Tournament.new(tournament_params)
    binding.pry
    if @tournament.save
      respond_to do |format|
        format.html { redirect_to root_path}
      end
    else
      render :new
    end
  end

  def tournament_params
    params.require(:tournament).permit(:name, :user_id,
                                       :participation_limit, :deadline,
                                       :street, :city)
  end

  before_filter :authenticate_user!, except: [:index]
end
