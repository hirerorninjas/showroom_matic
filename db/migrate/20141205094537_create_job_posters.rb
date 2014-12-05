class CreateJobPosters < ActiveRecord::Migration
  def change
    create_table :job_posters do |t|
      t.string :Headline
      t.text :Details

      t.timestamps
    end
  end
end
