class Investe < ActiveRecord::Base
validates :Company, presence: true
validates :Opportunity_Headline, presence: true
validates :Description, presence: true
end
