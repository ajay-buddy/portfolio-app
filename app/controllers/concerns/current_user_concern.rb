module CurrentUserConcern
    extend ActiveSupport::Concern
    included do
        before_action :current_user
    end
    def current_user
        super || guest_user
    end
    def guest_user
        OpenStruct.new(
            username: "Guest User",
            email: "guestuser@portfolioapp.com"
          )
    end
end