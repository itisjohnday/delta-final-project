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
      if VoteCheck.exists?(user_id: current_user.id, match_id: current_match.id)  == false
        output_json.push({link: current_match.find_link, entry_id: current_match.contestant_1.id})
      end
    end
    render json:output_json
  end

  def prelim
    output_json = []
    Match.all.each do |current_match|
      if current_user
        if VoteCheck.exists?(user_id: current_user.id, match_id: current_match.id)  == false
          output_json.push({link: current_match.find_link, entry_id: current_match.contestant_1.id})
        else
          #redirect_to no_entries_path
        end
      end
    end
    @media = output_json
  end

  def dummyjson
    render json: [{link: "hahhaha", key: "1"}]
  end

  def vote_reg
    entry = Entry.where(params[id: :entry])[0]
    entry.vote_count += params[:vote]
    entry.save
    VoteCheck.create(user_id: current_user.id, match_id: entry.match.id)
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