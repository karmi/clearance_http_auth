module ClearanceHttpAuth

  module CurrentUserOverride

    def current_user
      env['current_user'] || @_current_user || user_from_cookie
    end

  end

end
