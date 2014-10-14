class AddVotesToEvents < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string   "vote"
      t.timestamps
    end

    add_reference :votes, :event, index: true
  end
end
