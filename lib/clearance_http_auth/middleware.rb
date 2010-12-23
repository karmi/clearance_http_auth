module ClearanceHttpAuth

  class Middleware

    def initialize(app)
      @app = app
    end

    def call(env)
      if api_method?(env)
        @app = Rack::Auth::Basic.new(@app) do |username, password|
          env['current_user'] = User.authenticate(username, password)
        end
      end
      @app.call(env)
    end

    private

    def api_method?(env)
      return false unless env['action_dispatch.request.path_parameters']
      format = env['action_dispatch.request.path_parameters'][:format]
      format && Configuration.api_formats.include?(format)
    end

  end

end
