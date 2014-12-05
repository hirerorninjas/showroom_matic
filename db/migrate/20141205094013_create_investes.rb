class CreateInvestes < ActiveRecord::Migration
  def change
    create_table :investes do |t|
      t.string :Company
      t.string :Opportunity_Headline
      t.text :Description

      t.timestamps
    end
  end
end
