# == Schema Information
#
# Table name: reservations
#
#  id               :integer          not null, primary key
#  duration         :integer
#  license_plate    :string
#  reservation_date :date
#  reservation_time :time
#  status           :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  parking_spot_id  :integer          not null
#  user_id          :integer          not null
#
# Indexes
#
#  index_reservations_on_parking_spot_id  (parking_spot_id)
#  index_reservations_on_user_id          (user_id)
#
# Foreign Keys
#
#  parking_spot_id  (parking_spot_id => parking_spots.id)
#  user_id          (user_id => users.id)
#
require "test_helper"

class ReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
