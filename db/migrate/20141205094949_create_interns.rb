class CreateInterns < ActiveRecord::Migration
  def change
    create_table :interns do |t|
      t.string :Headline
      t.text :Details

      t.timestamps
    end
  end
end
