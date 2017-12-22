class CreateBracket
  attr_reader :game, :seeded_rounds
  
  def initialize(tournament, rounds, init_seeding)
    @game = {}
    @rounds = rounds
    @seeding = init_seeding
    @tournament = tournament
    @seeded_rounds = 0
  end

  def seed
    @tournament.rounds.each_with_index do |round, index|
      if index == 1
        matches = []
        round_one = @tournament.rounds.where(name: round.name)[0].matches
        @seeding.each do |index2|
          matches << ({contestant_1: round_one[index2].contestant_1.pet.name, contestant_1_prof_pic: round_one[index2].contestant_1.pet.profile_pic, contestant_1_entry_id: round_one[index2].contestant_1.id, contestant_1_entry_pic: round_one[index2].contestant_1.media_link.link,
            contestant_2: round_one[index2].contestant_2.pet.name, contestant_2_prof_pic: round_one[index2].contestant_2.pet.profile_pic, contestant_2_entry_id: round_one[index2].contestant_2.id, contestant_2_entry_pic: round_one[index2].contestant_2.media_link.link,})
        end
        @game["round_#{index}"] = matches
      elsif index > 1 && index < @rounds 
        matches = @tournament.rounds.where(name: round.name)[0].matches.map.with_index{|match, index2|
          {contestant_1: match.contestant_1.pet.name, contestant_1_prof_pic: match.contestant_1.pet.profile_pic, contestant_1_entry_id: match.contestant_1.id, contestant_1_entry_pic: match.contestant_1.media_link.link, contestant_2: match.contestant_2.pet.name, contestant_2_prof_pic: match.contestant_2.pet.profile_pic, contestant_2_entry_id: match.contestant_2.id, contestant_2_entry_pic: match.contestant_2.media_link.link}
          }
        @game["round_#{index}"] = matches
      end
      #remove in real game
      # if index == @rounds - 1
      #   @game["round_#{index+1}"] = [{contestant_1: @tournament.winner.pet.name, contestant_1_prof_pic: @tournament.winner.pet.profile_pic}]
      # end
      @seeded_rounds += 1
    end
   
  end

  def fill_empty
    (@seeded_rounds + 1 .. @rounds).each do |fill|
        matches = []
      (2**(@rounds-fill)).times do
        p "seeded rounds done"
        matches << ({contestant_1: nil, contestant_1_prof_pic: nil, contestant_1_entry_id: nil, contestant_1_entry_pic: nil,contestant_2: nil, contestant_2_prof_pic: nil, contestant_2_entry_id: nil, contestant_2_entry_pic: nil
          })
          end
        @game["round_#{fill}"] = matches
      end
      @game["winner"] = [{contestant_1: nil, contestant_1_prof_pic: nil, contestant_1_entry_id: nil, contestant_1_entry_pic: nil}]
  end


end