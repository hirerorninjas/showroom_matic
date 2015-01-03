class Investor < ActiveRecord::Base
validates :Company, :Equity_Investment, :Revenue, :EBITDA, :presence => { :message => "is required" }
validates_uniqueness_of :Company
end
