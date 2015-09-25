class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories#, join_table: :categories_products
  belongs_to :provider
  has_many :product_units #, inverse_of: :product
  has_many :units, through: :product_units
  has_many :line_items
    
  accepts_nested_attributes_for :product_units

  before_destroy :ensure_not_referenced_by_any_line_items

  #validates :title, :description, :provider_id, :active, presence: true
  
  has_attached_file :image,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  def s3_credentials
    {:bucket => "geekseed-gs01", :access_key_id => "AKIAIRYXHUSFCNZEZ7IQ", :secret_access_key => "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"}
  end

  private

  	def ensure_not_referenced_by_any_line_items
  		if line_items.empty?
  			return true
  		else
  			errors.add(:base, 'Line Items present')
  			return false
  		end
  	end
  	
  	def self.search_by_category(category_name)
        if category_name
            @category_id = Category.where("title = ?", category_name).take
            if @category_id
                where("category_id = ?", @category_id)
            end
        else
            find(:all)
        end
    end
end
