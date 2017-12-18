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


  def prelim
    output_json = []
    Match.all.each do |current_match|
      output_json.push({link: current_match.find_link, entry_id: current_match.contestant_1.id})
    end
    @media = output_json
  end

  def bracket
    @tournament = Tournament.find(1)
    round = 1
    @round_matches = @tournament.rounds.find(round).matches
    p @around_matches
    p @tournament
  end

  def dummyjson
    render json: [{link: "hahhaha", key: "1"}]
  end

  def vote_reg
    # binding.pry
    render body: nil
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
    if output_json.length == 0
      redirect_to no_entries_path
    end
    render json:output_json
  end

  def no_entries
  end
end