# == Schema Information
#
# Table name: parking_spots
#
#  id         :integer          not null, primary key
#  available  :boolean          default(TRUE)
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  region_id  :integer          not null
#
# Indexes
#
#  index_parking_spots_on_region_id  (region_id)
#
# Foreign Keys
#
#  region_id  (region_id => regions.id)
#
class ParkingSpot < ApplicationRecord
    belongs_to :region

    validates :name, presence: true
    validates :region, presence: true
end
