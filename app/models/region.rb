# == Schema Information
#
# Table name: regions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Region < ApplicationRecord
    has_many :parking_spots
    def available_parking_spots
        parking_spots.where(available: true)
      end
end
