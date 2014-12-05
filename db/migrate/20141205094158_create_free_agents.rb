class CreateFreeAgents < ActiveRecord::Migration
  def change
    create_table :free_agents do |t|
      t.string :Headline
      t.text :Details

      t.timestamps
    end
  end
end
