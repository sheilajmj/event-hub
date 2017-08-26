# == Schema Information
#
# Table name: events
#
#  id               :integer          not null, primary key
#  title            :string           not null
#  full_description :text             not null
#  image_url        :string           default("default_image.jpg"), not null
#  date             :date             not null
#  host_id          :integer          not null
#  total_quantity   :integer
#  quantity_left    :integer
#  price            :float            default("0.0"), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  venue            :string
#  street_address   :string
#  city_state_zip   :string
#

class Event < ApplicationRecord
  validates :title, :full_description,
    :date, :host_id, :price, :venue, presence: true

  belongs_to :host,
    foreign_key: :host_id, class_name: "User"

  def default_image
    if self.image_url == ""
      self.image_url = "http://rocciaevents.com/wp-content/uploads/2014/09/event1.gif"
    end
  end
end
