class IncidentsController < ApplicationController
  def index
    @incidents = Incident.approved.order("id DESC").page(params[:page])
  end

  def new
    @incident = Incident.new
  end

  def create
    @incident = Incident.new incident_params
    #include tags
    @incident.tags = Tag.where(id: params[:incident][:tags].select(&:present?))

    if @incident.save
      redirect_to :incidents, :notice => 'Incident submitted for review!'
    else
      render :new
    end
  end

  private
  def incident_params
    params[:incident].permit(:title, :details, :incident_type, :total_victims, :men_wounded, :women_wounded, :minor_wounded,
                             :men_dead, :women_dead, :minor_dead, :district_id, :location, :references, :happened_on,
                              :happened_at)
  end
end
