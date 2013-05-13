class Landmark < ActiveRecord::Base
  after_create :generate_slug # make sure each has a unique code
  attr_accessible :description, :designation, :founders, :inception, :lat, :lng, 
                  :lpc_type, :name, :tags, :exhibit_ids, :slug

  # Schema
  ## :lpc_type is a *text* representing the type of landmark designation
  # individual_landmark
  # interior_landmark
  # scenic_landmark
  # historic_district

  # Serialization
  serialize :founders
  serialize :tags

  # Associations
  has_and_belongs_to_many :exhibits

  # Functions
  def generate_slug
    self.slug = self.name.to_slug
  end

  # Geocoding
  geocoded_by :address, :latitude  => :lat, :longitude => :lng

end
