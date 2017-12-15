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
    8.times do
      output_json = {:link_array => []}
      Match.all.each do |match|
        match.vote_checks.each do |vote_check|
          if current_user.id != vote_check.
            output_json[:link_array] << {:link => , :entry_id =>}
          end
        end
      end
    end
  end

  def prelim
    @media = MediaLink.first(10)
  end

  def vote_reg
  end

  def pics
  end
end