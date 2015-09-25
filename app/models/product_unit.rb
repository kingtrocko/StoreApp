class ProductUnit < ActiveRecord::Base
  belongs_to :product
  belongs_to :unit
  
  #validates_presence_of :product, :unit
  validates :price, :description, presence: true
  
  #validates :product, presence: true
  #validates :unit_id, presence: true
  #validates :price, presence: true
  #validates :price_description, presence: true
  #validates_associated :product
end
