class Portfolio < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    validates_presence_of :title, :body, :main_image, :thumb_image

    def self.angular
        where(subtitle: "Angular")
    end

    scope :angular_portfolio_items, -> { where(subtitle: "Angular") }
end
