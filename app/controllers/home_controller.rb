class HomeController < ApplicationController
  def index
    @incidents = Incident.order("id DESC").page(params[:page])
  end

  def new

  end

  def report
  end
end
