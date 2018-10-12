class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  # rest of controller here

end
