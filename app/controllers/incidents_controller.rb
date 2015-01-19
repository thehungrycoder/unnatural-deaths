class IncidentsController < ApplicationController
  def index
    @incidents = Incident.approved.order("id DESC").page(params[:page])
  end

  def new
    @incident = Incident.new
  end

  def create
    @incident = Incident.new incident_params
    if @incident.save
      redirect_to :incidents, :notice => 'Incident submitted for review!'
    else
      render :new
    end
  end

  private
  def incident_params
    params[:incident].permit(:title, :details, :incident_type, :total_victims, :men_wonded, :women_wonded, :minor_wonded,
                             :men_dead, :women_dead, :minor_dead, :district_id, :location, :links
    )
  end
end
