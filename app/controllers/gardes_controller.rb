class GardesController < ApplicationController

  before_action :authenticate_user!

  def index
  	@gardes = current_user.api_client.gardes.to_a

		respond_to do |format|
			format.html
	    format.json
	  end
  end

end
