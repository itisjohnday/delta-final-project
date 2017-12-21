class TournamentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
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
    @tournament.save
    round = Round.new(tournament_id: @tournament.id, name: 'Prelim Round')
    round.save

    if @tournament.id
      redirect_to tournament_path(@tournament.id), notice: 'Tournament was successfully created.'
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
      if index > 0
        round.matches.each do |match|
          match.contestant_1 ? match.contestant_1.destroy : nil
          match.contestant_2 ? match.contestant_2.destroy : nil
          match.destroy
        end
        round.destroy
      else
        round.matches.each do |match|
          match.contestant_1.update(vote_count: 0) 
          match.contestant_2.update(vote_count: 0)
        end
      end
    end
    VoteCheck.delete_all
    redirect_to tournaments_path
  end

  def enter
    @user = current_user
    @pets = @user.pets
  end

  def enter_return
    pet_id = eval(params[:entries])[:pet_id]
    media_link_id = eval(params[:entries])[:media_link_id]
    pets_media_link = PetsMediaLink.where(pet_id: pet_id, media_link_id: media_link_id)[0]
    entry = Entry.new(pets_media_link_id: pets_media_link.id)
    entry.save
    match = Match.new(round_id: @tournament.rounds.first.id, contestant_1_entry_id: entry.id, contestant_2_entry_id: entry.id)

    if match.save
      redirect_to tournaments_path, notice: 'Entry was successfully created.'
    else
      redirect_to "tournaments/#{@tournament.id}/enter"
    end
  end

  private
  def tournament_params  
    params['tournament'].permit(:theme)
  end

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end
end
