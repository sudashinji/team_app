class Admin::EndUserController < ApplicationController
	def index
		@user = EndUser.all
	end
end
