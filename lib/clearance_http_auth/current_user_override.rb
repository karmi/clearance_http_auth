module Clearance
  module HttpAuth

    # This module redefines default Clearance's +current_user+
    # helper method functionality to look first in +env+
    # passed from the middleware stack.
    #
    module CurrentUserOverride

      # User in the current cookie
      #
      # @return [User, nil]
      def current_user
        (env['clearance.current_user'] rescue nil) || @_current_user || user_from_cookie
      end
    end

  end

end
