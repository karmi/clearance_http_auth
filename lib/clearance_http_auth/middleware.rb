module Clearance
  module HttpAuth

    # A Rack middleware which intercepts requests to your application API
    # (as defined in <tt>Configuration.api_formats</tt>) and performs
    # a HTTP Basic Authentication via <tt>Rack::Auth::Basic</tt>.
    #
    class Middleware

      def initialize(app)
        @app = app
      end

      # Wrap the application with a <tt>Rack::Auth::Basic</tt> block
      # and set the <tt>env['clearance.current_user']</tt> variable
      # if the incoming request is targeting the API.
      #
      def call(env)
        if targeting_api?(env)
          @app = Rack::Auth::Basic.new(@app) do |username, password|
            env['clearance.current_user'] = ::User.authenticate(username, password)
          end
        end
        @app.call(env)
      end

      private

      def targeting_api?(env)
        return false unless env['action_dispatch.request.path_parameters']
        format = env['action_dispatch.request.path_parameters'][:format]
        format && Configuration.api_formats.include?(format)
      end

    end

  end

end
