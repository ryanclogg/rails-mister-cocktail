class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates_presence_of :ingredient
  validates_presence_of :cocktail
  validates_presence_of :description

  validates_uniqueness_of :cocktail, :scope => [:ingredient]

end
