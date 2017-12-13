class CreateVoteChecks < ActiveRecord::Migration[5.1]
  def change
    create_table :vote_checks do |t|
      belongs_to :user
      belongs_to :match
      t.timestamps
    end
  end
end
