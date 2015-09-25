class Category < ActiveRecord::Base
 include ActsAsTree
  
	#has_one :category, foreign_key: 'parent_id'
	has_and_belongs_to_many :products#, join_table: :categories_products
	belongs_to :provider
	
	acts_as_tree order: "title"
end
