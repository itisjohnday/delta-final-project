class AboutController < ApplicationController
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
    @media = MediaLink.first(10)
  end

  def vote_reg
  end

  def pics
  end
end