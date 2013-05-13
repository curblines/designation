class Exhibit < ActiveRecord::Base
  attr_accessible :attribution, :description, :inception, :medium, :uri

  # Schema
  ## 
  # :medium is a *text* representing the type of medium
  # photo
  # report

  # Associations
  has_and_belongs_to_many :landmarks
end
