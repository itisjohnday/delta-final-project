class RoundsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :new, :create]
  before_action :set_tournament, except: [:new, :create]

  def index
    @rounds = @tournament.rounds
  end

  def set_new_round
    case @tournament.rounds.count
      when 1
        prelim_matches_order = @tournament.rounds.last.matches.to_a.sort_by! {|match| match.contestant_1.vote_count}
        prelim_matches_order = prelim_matches_order.reverse
        @round = Round.create(tournament_id: @tournament.id, name: 'Elite 8')
        @match1 = Match.create(round_id: @round.id, contestant_1_entry_id: prelim_matches_order[0].contestant_1.id, contestant_2_entry_id: prelim_matches_order[7].contestant_1.id)
        @match2 = Match.create(round_id: @round.id, contestant_1_entry_id: prelim_matches_order[1].contestant_1.id, contestant_2_entry_id: prelim_matches_order[6].contestant_1.id)
        @match3 = Match.create(round_id: @round.id, contestant_1_entry_id: prelim_matches_order[2].contestant_1.id, contestant_2_entry_id: prelim_matches_order[5].contestant_1.id)
        @match4 = Match.create(round_id: @round.id, contestant_1_entry_id: prelim_matches_order[3].contestant_1.id, contestant_2_entry_id: prelim_matches_order[4].contestant_1.id)
      when 2
        @match1 = @tournament.rounds.second.matches.first
        @match2 = @tournament.rounds.second.matches.second
        @match3 = @tournament.rounds.second.matches.third
        @match4 = @tournament.rounds.second.matches.fourth
        @round = Round.create(tournament_id: @tournament.id, name: 'Final 4')
        if @match1.contestant_1.vote_count > @match1.contestant_2.vote_count
          match_1_winner = @match1.contestant_1
        else
          match_1_winner = @match1.contestant_2
        end
        if @match2.contestant_1.vote_count > @match2.contestant_2.vote_count
          match_2_winner = @match2.contestant_1
        else
          match_2_winner = @match2.contestant_2
        end
        if @match3.contestant_1.vote_count > @match3.contestant_2.vote_count
          match_3_winner = @match3.contestant_1
        else
          match_3_winner = @match3.contestant_2
        end
        if @match4.contestant_1.vote_count > @match4.contestant_2.vote_count
          match_4_winner = @match4.contestant_1
        else
          match_4_winner = @match4.contestant_2
        end
        @match5 = Match.create(round_id: @round.id, contestant_1_entry_id: match_1_winner.id, contestant_2_entry_id: match_4_winner.id)
        @match6 = Match.create(round_id: @round.id, contestant_1_entry_id: match_2_winner.id, contestant_2_entry_id: match_3_winner.id)
      when 3
        @match5 = @tournament.rounds.third.matches.first
        @match6 = @tournament.rounds.third.matches.second
        @round = Round.create(tournament_id: @tournament.id, name: 'Championship')
        if @match5.contestant_1.vote_count > @match5.contestant_2.vote_count
          match_5_winner = @match5.contestant_1
        else
          match_5_winner = @match5.contestant_2
        end
        if @match6.contestant_1.vote_count > @match6.contestant_2.vote_count
          match_6_winner = @match6.contestant_1
        else
          match_6_winner = @match6.contestant_2
        end
        @match7 = Match.create(round_id: @round.id, contestant_1_entry_id: match_5_winner.id, contestant_2_entry_id: match_6_winner.id)
        redirect_to tournaments_path
    end
    
    if @round.save
      redirect_to tournament_path(id: @tournament.id), notice: 'Round was successfully created.'
    else
      render :new
    end
    render body: nil
  end

  private
  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end
end
