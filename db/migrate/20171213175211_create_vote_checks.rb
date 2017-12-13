class CreateVoteChecks < ActiveRecord::Migration[5.1]
  def change
    create_table :vote_checks do |t|

      t.timestamps
    end
  end
end
