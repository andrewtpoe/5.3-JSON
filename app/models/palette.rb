class Palette < ActiveRecord::Base
  validates :name, :dom_one, :dom_two, :pop, :sec_one, :sec_two, presence: true

end
