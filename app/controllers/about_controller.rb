class AboutController < ApplicationController
  # protect_from_forgery only: [:vote_reg], with: :null_session
  def index
  end

  def show 
  end

  def search
    @pets = Pet.where(name: params['search'])
    @users = User.where(username: params['search'])
  end

  def return_links
    output_json = []
    Match.all.each do |current_match|
      # current_match.vote_checks.each do |vote_check|
        # if current_user.id != vote_check.user_id && current_match.id != vote_check.match_id
          output_json.push({link: current_match.find_link, entry_id: current_match.contestant_1.id})
        # end
      # end
    end
    render json:output_json
  end

  def prelim
    output_json = []
    Match.all.each do |current_match|
      output_json.push({link: current_match.find_link, entry_id: current_match.contestant_1.id})
    end
    @media = output_json
  end

  def bracket
    p Tournament.all
    @tournament = Tournament.first
    last_round = @tournament.rounds.count
    @game = {}
    round = {}
    rounds = 4
    init_seeding = [0,3,1,2]
    @tournament.rounds.each_with_index do |round, index|
      if index == 1
        matches = []
        round_one = @tournament.rounds.where(name: round.name)[0].matches
        init_seeding.each do |index2|
          matches << ({contestant_1: round_one[index2].contestant_1.pet.name, contestant_1_prof_pic: round_one[index2].contestant_1.pet.profile_pic, contestant_1_entry_id: round_one[index2].contestant_1.id, contestant_1_entry_pic: round_one[index2].contestant_1.media_link.link,
            contestant_2: round_one[index2].contestant_2.pet.name, contestant_2_prof_pic: round_one[index2].contestant_2.pet.profile_pic, contestant_2_entry_id: round_one[index2].contestant_2.id, contestant_2_entry_pic: round_one[index2].contestant_2.media_link.link,})
        end
        @game["round_#{index}"] = matches
      elsif index > 1 
        matches = @tournament.rounds.where(name: round.name)[0].matches.map.with_index{|match, index2|
          {contestant_1: match.contestant_1.pet.name, contestant_1_prof_pic: match.contestant_1.pet.profile_pic, contestant_1_entry_id: match.contestant_1.id, contestant_1_entry_pic: match.contestant_1.media_link.link, contestant_2: match.contestant_2.pet.name, contestant_2_prof_pic: match.contestant_2.pet.profile_pic, contestant_2_entry_id: match.contestant_2.id, contestant_2_entry_pic: match.contestant_2.media_link.link}
          }
        @game["round_#{index}"] = matches
      elsif index == rounds
        @game["round_#{index}"] = [{contestant_1: nil, contestant_1_prof_pic: nil}]
      end
      if index < rounds
        (index + 1 .. rounds).each do |val|
          matches = []
          (rounds-val).times do
            matches << ({contestant_1: nil, contestant_1_prof_pic: nil, contestant_1_entry_id: nil, contestant_1_entry_pic: nil,contestant_2: nil, contestant_2_prof_pic: nil, contestant_2_entry_id: nil, contestant_2_entry_pic: nil
            })
          end
          if rounds == val
            matches << ({contestant_1: @tournament.winner.pet.name, contestant_1_prof_pic: @tournament.winner.pet.profile_pic})
          end

          @game["round_#{val}"] = matches
        end
      end
    end
    p 'testing'

  
  end

  def dummyjson
    render json: [{link: "hahhaha", key: "1"}]
  end

  def vote_reg
    # binding.pry
    render body: nil
  end

  def pics
    if output_json.length == 0
      redirect_to no_entries_path
    end
  end

  def no_entries
  end

   
  private
end