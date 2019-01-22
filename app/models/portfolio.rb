class Portfolio < ApplicationRecord
	extend FriendlyId
  	friendly_id :title, use: :slugged

  	has_many :techniques

  	accepts_nested_attributes_for :techniques, 
  								  reject_if: lambda {|attrs| attrs['name'].blank? }
	
	includes Placeholder
	
	validates_presence_of :title, :subtitle, :body, :large_img, :thumb_img

	after_initialize :set_defaults

	def set_defaults
		self.large_img ||= Placeholder.image_generator(height: '600', width: '400')
		self.thumb_img ||= Placeholder.image_generator(height: '350', width: '200')
	end	

end
