ActiveAdmin.register District do


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

  form do |f|
    inputs 'Default' do
      input :name
      input :division, as: :select, collection: District.select(:division).distinct(:division).pluck(:division)
      li "Country #{f.object.country}" unless f.object.new_record?
    end
    actions
  end


end
