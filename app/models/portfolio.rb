class Portfolio < ApplicationRecord
    has_many :technologies
    accepts_nested_attributes_for :technologies, reject_if: lambda { |attrs| attrs['name'].blank? }

    include Placeholder
    extend FriendlyId
    friendly_id :title, use: :slugged

    validates_presence_of :title, :body, :main_image, :thumb_image

    def self.angular
        where(subtitle: "Angular")
    end

    scope :angular_portfolio_items, -> { where(subtitle: "Angular") }

    after_initialize :set_deafults

    def set_deafults
        self.main_image ||= Placeholder.image_generator('600', '400')
        self.thumb_image ||= Placeholder.image_generator('350', '200')
    end
end
