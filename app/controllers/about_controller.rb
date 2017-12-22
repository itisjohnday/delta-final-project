class AboutController < ApplicationController
  before_action :set_tournament, only: [:prelim, :bracket, :current_scores, :set_tournament]
  
  def index
  end

  def show 
  end

  def search
    @pets = Pet.where("lower(name) = ? OR lower(breed) = ?", params[:search].downcase, params[:search].downcase)
    @users = User.where("lower(username) = ? OR lower(f_name) = ? OR lower(l_name) = ?", params[:search].downcase, params[:search].downcase, params[:search].downcase)
  end
  
  #preliminary round pictures api
  def return_links
    output_json = []
    Match.all.each do |current_match|
      # binding.pry
      if VoteCheck.exists?(user_id: current_user.id, match_id: current_match.id)  == false
        output_json.push({link: current_match.find_link, entry_id: current_match.contestant_1.id})
      end
    end
    render json:output_json
  end

  
  def prelim
    # p params
    output_json = []
    @tournament.rounds.first.matches.each do |match|
      if current_user
        if VoteCheck.exists?(user_id: current_user.id, match_id: match.id) == false
          # binding.pry
          output_json.push({link: match.find_link, entry_id: match.contestant_1.id})
        end
      end
    end
    # p output_json
    if output_json.length == 0
      redirect_to no_entries_path
    else
      @media = output_json
    end
  end

  def vote_reg
    entry = Entry.find_or_create_by(id: params[:entry])
    # binding.pry
    if VoteCheck.exists?(user_id: current_user.id, match_id: entry.match.id)
      return render json: {error: "you can only vote once in each match"}
    end
    vote = VoteCheck.create(user_id: current_user.id, match_id: entry.match.id)
    entry.vote_count += params[:vote]
    entry.save
    render body: nil
  end

  def bracket
    rounds = 4
    init_seeding = [0,3,1,2]
    
    current_tournament = CreateBracket.new(@tournament, rounds, init_seeding)
    current_tournament.seed
    @seeded_rounds = current_tournament.seeded_rounds
    @game = current_tournament.game
    if @tournament.winner
      winner_props = Pet.find(@tournament.winner)
      @game["round_#{rounds}"] = [{contestant_1: winner_props.name, contestant_1_prof_pic: winner_props.profile_pic}]
      @winner = @tournament.winner
      p "winner"
    else
      @winner = nil
      current_tournament.fill_empty
    end
    @seeded_rounds
  end

  def dummyjson
    render json: [{link: "hahhaha", key: "1"}]
  end

  

  def no_entries
  end

  def current_scores
    output = []
    @tournament.rounds.first.matches.each do |match|
      p match
      output << {
      name: match.contestant_1.pet.name,
      points: match.contestant_1.vote_count
      }
    end
    #need to sort output by points 
    render json: output
  end

   
  private

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end
end