class Blog < ApplicationRecord
	includes Placeholder
	enum status: { draft: 0, published: 1 }
	extend FriendlyId
  	friendly_id :title, use: :slugged

  	validates_presence_of :title, :subtitle, :body, :main_img

  	after_initialize :set_defaults

  	def set_defaults
		self.main_img ||= Placeholder.image_generator(height: '600', width: '400')
	end	

  	belongs_to :topic

end

