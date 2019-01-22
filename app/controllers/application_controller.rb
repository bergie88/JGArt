class ApplicationController < ActionController::Base
include DeviseWhitelist
include SetSource
include CurrentUserConcern

before_action :set_page_title

	def set_page_title
		@page_title = "The Works of John Gates"
		@seo_keywords = "John Gates Portfolio Art"
	end

end
