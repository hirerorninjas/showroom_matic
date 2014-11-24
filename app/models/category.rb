class Category < ActiveRecord::Base
  validates :name, presence: true
  validates_uniqueness_of :name
  validates_format_of :name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  has_many :products
end
