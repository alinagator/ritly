class UrlsController < ApplicationController

	def show
		@url = Url.find(params[:id])
	end

	def new
		@url = Url.new #new instance or Url model, and by default will create a new view
	end

	def create
		@url = Url.new(safe_url_params)	#params is hash that contains the url, and inside the url is another hash which represents the model. 
										#Inside that is the link "http://..."
		@url.save
		redirect_to @url
	end

	private

		def safe_url_params
			params.require('url').permit(:link)
		end

		def generate_hash_code
			rand(10000)
		end
end