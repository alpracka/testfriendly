class Project < ActiveRecord::Base

  # Friendly Id
  extend FriendlyId
  friendly_id :name, :use => :slugged

  # Validations
  validates_presence_of :name, :description

end
