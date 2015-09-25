class Unit < ActiveRecord::Base
	has_many :product_units
	has_many :products, through: :product_units
end
