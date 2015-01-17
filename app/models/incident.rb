class Incident < ActiveRecord::Base
  max_paginates_per 100
  belongs_to :district
  belongs_to :approved_by, class_name: 'AdminUser', :foreign_key => :approved_by_id


end
