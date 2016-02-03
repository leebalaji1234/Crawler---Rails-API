class User < ActiveRecord::Base
  belongs_to :company
  has_many :projects, dependent: :destroy, :through => :company 
  validates :company_id, presence: true
end
