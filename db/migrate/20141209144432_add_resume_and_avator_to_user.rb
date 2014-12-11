class AddResumeAndAvatorToUser < ActiveRecord::Migration
  def self.up
    add_attachment :users, :avatar
    add_attachment :users, :resume
  end

  def self.down
    remove_attachment :users, :avatar
    remove_attachment :users, :resume
  end
end
