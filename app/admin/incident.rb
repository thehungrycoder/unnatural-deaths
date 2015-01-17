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
      input :incident_type, as: :select, collection: [
          'Political Violence',
          'Road Accidents',
          'Other Accidents',
          'Domestic Violence',
      ]
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


end
