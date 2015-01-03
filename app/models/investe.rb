class Investe < ActiveRecord::Base
validates :Company, :Opportunity_Headline, :Description, :presence => { :message => "is required" }
validates_uniqueness_of :Company
end