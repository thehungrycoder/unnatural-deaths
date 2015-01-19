class Incident < ActiveRecord::Base
  max_paginates_per 100
  belongs_to :district
  belongs_to :approved_by, class_name: 'AdminUser', :foreign_key => :approved_by_id

  scope :approved, -> { where.not(:approved_at => nil)}

  validates_presence_of :title, :incident_type, :links, :district_id

  def self.incident_types
    [
        'Political Violence',
        'Road Accidents',
        'Other Accidents',
        'Domestic Violence'
    ]
  end

  def approved?
    !!self.approved_at.present?
  end
end
