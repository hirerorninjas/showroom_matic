class CreateInvestors < ActiveRecord::Migration
  def change
    create_table :investors do |t|
      t.string :Company
      t.integer :Equity_Investment
      t.integer :Revenue
      t.integer :EBITDA

      t.timestamps
    end
  end
end
