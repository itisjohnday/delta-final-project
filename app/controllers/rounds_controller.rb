class RoundsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :new, :create]
  before_action :set_tournament, except: [:new, :create]
  skip_before_action :verify_authenticity_token 

  def index
    @rounds = @tournament.rounds
  end

  def set_new_round
    case match_count = @tournament.rounds.last.matches.count
      when 8..16
        prelim_matches_order = @tournament.rounds.last.matches.to_a.sort_by! {|match| match.contestant_1.vote_count}
        @round = Round.create(tournament_id: @tournament.id, name: 'Elite 8')
        match1 = Match.create(round_id: @round.id, contestant_1_entry_id: prelim_matches_order[0].contestant_1.id, contestant_2_entry_id: prelim_matches_order[7].contestant_1.id)
        match2 = Match.create(round_id: @round.id, contestant_1_entry_id: prelim_matches_order[1].contestant_1.id, contestant_2_entry_id: prelim_matches_order[6].contestant_1.id)
        match3 = Match.create(round_id: @round.id, contestant_1_entry_id: prelim_matches_order[2].contestant_1.id, contestant_2_entry_id: prelim_matches_order[5].contestant_1.id)
        match4 = Match.create(round_id: @round.id, contestant_1_entry_id: prelim_matches_order[3].contestant_1.id, contestant_2_entry_id: prelim_matches_order[4].contestant_1.id)
      when 4..7
        @round = Round.create(tournament_id: @tournament.id, name: 'Final 4')
        match1 = Match.create(round_id: @round.id, contestant_1_entry_id: prelim_matches_order[0].contestant_1.id, contestant_2_entry_id: prelim_matches_order[7].contestant_1.id)
        match2 = Match.create(round_id: @round.id, contestant_1_entry_id: prelim_matches_order[1].contestant_1.id, contestant_2_entry_id: prelim_matches_order[6].contestant_1.id)
      when 2..3
        @round = Round.create(tournament_id: @tournament.id, name: 'Championship')
    end
    
    if @round.save
      redirect_to tournament_rounds_path(tournament_id: @tournament.id), notice: 'Round was successfully created.'
    else
      render :new
    end
  end

  private
  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end
end
