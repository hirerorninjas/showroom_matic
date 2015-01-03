class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :resume
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  has_many :products, through: :likes
  has_many :likes, dependent: :destroy
  has_many :salesmen
  belongs_to :country_list
  # specify that the resume is a paperclip file attachment
  validates_presence_of :first_name, :message => "is required" 
  validates :last_name, :presence => { :message => "is required" }
  has_attached_file :resume, :message => "is required"
  validates_attachment_presence :resume
  #validates_acceptance_of :terms_accepted, :message => "is required"
  validates_attachment_content_type :resume, :content_type =>['application/pdf'],
  :path => ":rails_root/public/assets/resumes/:id/:style/:basename.:extension",
  :url => ":rails_root/public/assets/resumes/:id/:style/:basename.:extension"

  before_create do
    self.last_name = first_name.capitalize if last_name.blank?
  end
  # def timeout_in
  #   2.minute 
  # end
end
