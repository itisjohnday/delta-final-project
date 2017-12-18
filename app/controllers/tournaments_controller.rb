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

  def enter_tournament(pets_media_link_id)
    entry = Entry.create(pets_media_link_id: pets_media_link_id, vote_count: 0)
    Match.create!(contestant_1_entry_id: entry.id, contestant_2_entry_id: entry.id, round_id: 1)
  end

  private
  def tournament_params  
    params['tournament'].permit(:theme)
  end

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end
end
