class Incident < ActiveRecord::Base
  max_paginates_per 100
  belongs_to :district
  belongs_to :approved_by, class_name: 'AdminUser', :foreign_key => :approved_by_id
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags

  scope :approved, -> { where.not(:approved_at => nil)}

  validates_presence_of :title, :incident_type, :references, :district_id

  def self.incident_types
    [
        'Accidents',
        'Homicide',
        'Political Violence',
        'Suicide',
        'Misadventure',
        'Terrorism',
        'War',
        'Abortion',
        'Execution',
    ]
  end

  def approved?
    !!self.approved_at.present?
  end
end
