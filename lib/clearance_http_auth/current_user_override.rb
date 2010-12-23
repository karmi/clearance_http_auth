module Clearance
  module HttpAuth

    module CurrentUserOverride
      def current_user
        env['clearance.current_user'] || @_current_user || user_from_cookie
      end
    end

  end

end
