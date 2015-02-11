class PagesController < ApplicationController

  respond_to :html

  before_action :authenticate_user!

  def me
  end

end
