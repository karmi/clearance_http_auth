module ClearanceHttpAuth

  class Middleware

    API_FORMATS = %w[   json xml csv   ]

    def initialize(app)
      @app = app
    end

    def call(env)
      if api_method?(env)
        @app = Rack::Auth::Basic.new(@app) do |username, password|
          user = User.authenticate(username, password)
          env['current_user'] = user
        end
      end
      @app.call(env)
    end

    private

    def api_method?(env)
      return false unless env['action_dispatch.request.path_parameters']
      format = env['action_dispatch.request.path_parameters'][:format]
      format && API_FORMATS.include?(format)
    end

  end

end
