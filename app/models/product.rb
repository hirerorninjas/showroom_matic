class Product < ActiveRecord::Base
	has_attached_file :photo, :styles => { :original => "300x300>", :thumb => "100x100>" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  #validates_numericality_of :price, presence: true
  validates :price, presence: true, numericality: true
  validates :quantity, presence: true, numericality: true
  validates_format_of :name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates :name, presence: true
  validates_uniqueness_of :name
  belongs_to :category
  belongs_to :user
  has_many :likes
  has_many :users, through: :likes
  has_many :line_items
  has_many :orders, :through => :line_items
  
  def self.search(search)  
    if search  
      where('name LIKE ?', "%#{search}%")  
    else  
      scoped  
    end  
  end  

  def to_param
    "#{id} #{name}".parameterize
  end

end
