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
      redirect_to pets_path, notice: 'Tournament was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tournament.update(tournament_params)
      redirect_to tournaments_path, notice: 'Tournament was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tournament.destroy
    redirect_to tournaments_path, notice: 'Tournament was successfully removed'
  end

  def enter_tournament(pets_media_link_id)
    entry = Entry.create(pets_media_link_id: pets_media_link_id, vote_count: 0)
    Match.create!(contestant_1_entry_id: entry.id, contestant_2_entry_id: entry.id, round_id: 1)
  end

  def reset
    @tournament.rounds.each_with_index do |round, index|
      binding.pry
      if index > 0
        round.matches.each do |match|
          match.vote_checks.destroy
          match.contestant_1 ? match.contestant_1.destroy : nil
          match.contestant_2 ? match.contestant_2.destroy : nil
          match.destroy
        end
        round.destroy
      end
    end
    redirect_to tournaments_path
  end

  private
  def tournament_params  
    params['tournament'].permit(:theme)
  end

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end
end
