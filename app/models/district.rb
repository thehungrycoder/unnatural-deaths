class District < ActiveRecord::Base
  def self.division_enum
    ['Dhaka', 'Chittagong', 'Sylhet']
  end

  def self.country_enum
    ['Bangladesh']
  end

  def division_name
    division.humanize
  end

end

