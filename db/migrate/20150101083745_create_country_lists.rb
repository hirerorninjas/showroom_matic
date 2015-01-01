class CreateCountryLists < ActiveRecord::Migration
  def change
    create_table :country_lists do |t|
      t.string :name
      t.string :iso
      t.integer :phonecode

      t.timestamps
    end
  end
end
