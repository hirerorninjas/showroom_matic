class Salesman < ActiveRecord::Base
belongs_to :user
validates :name, :address, :presence => { :message => "is required" }
validates_uniqueness_of :name
end
