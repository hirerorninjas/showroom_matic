class JobPoster < ActiveRecord::Base
validates :Headline, :Details, :presence => { :message => "is required" }
validates_uniqueness_of :Headline
end