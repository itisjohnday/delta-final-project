class TournamentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tournament, except: [:index, :new, :create]


  def index
    @tournaments = Tournament.all
  end

  def show
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)
    
    if @tournament.save
      redirect_to pets_path, notice: 'pet was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tournament.update(tournament_params)
      redirect_to tournaments_path, notice: 'tournament was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tournament.destroy
    redirect_to tournaments_path, notice: 'tournament was successfully removed'
  end

  private
  def tournament_params  
    params['tournament'].permit(:theme)
  end

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end
end
