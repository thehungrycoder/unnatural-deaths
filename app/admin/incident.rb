ActiveAdmin.register Incident do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  permit_params :title, :details, :incident_type, :links, :men_dead, :minor_dead, :women_dead, :men_wonded,
                :minor_wonded, :women_wonded, :district, :location, :total_victims
  form do |f|
    inputs 'Incident Info' do
      input :title
      input :details
      input :incident_type, as: :select, collection: Incident.incident_types
      input :links
      input :total_victims
    end

    inputs 'Wound' do
      input :men_wonded
      input :women_wonded
      input :minor_wonded
    end
    inputs 'Dead' do
      input :men_dead
      input :women_dead
      input :minor_dead
    end

    inputs 'Location' do
      input :district, as: :select, collection: District.all
      input :location
    end
    actions
  end


  index do
    column :title do |obj|
      link_to obj.title, [:admin, obj]
    end
    column :incident_type
    column :district
    column :status do |obj|
      if obj.approved_at.present?
        '<spn class="status_tag yes">Approved</span>'.html_safe
      else
        '<spn class="status_tag no">Pending Review</span>'.html_safe
      end
    end

    actions
  end

  member_action :approve, :method => [:patch] do
    incident = Incident.find(params[:id])
    incident.update_attributes({:approved_at => Time.now, :approved_by => current_admin_user})
    redirect_to :back, :notice => 'Incident approved'
  end

  member_action :unapprove, :method => [:patch] do
    incident = Incident.find(params[:id])
    incident.update_attributes({:approved_at => nil, :approved_by => nil})
    redirect_to :back, :notice => 'Incident unapproved'
  end

  action_item :approve, :only => :show do
    if incident.approved_at.blank?
      link_to 'Approve', [:approve, :admin, incident], :method => :patch,
        data: {
            :confirm => 'Are you sure to approve this incident?'
        }
    end
  end

  action_item :unapprove, :only => :show do
    if incident.approved_at.present?
      link_to 'Un-Approve', [:unapprove, :admin, incident], :method => :patch,
              data: {
                  :confirm => 'Are you sure to unapprove this incident?'
              }
    end
  end

end
