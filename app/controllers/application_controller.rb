class ApplicationController < ActionController::API
    include ActionController::HTTPAuthentication::Token::ControllerMethods

    def authenticate
        authenticate_token || render unauthorized
    end

    def authenticate_token
        authenticate_with_http_token do |token,options|
         @current_user = User.find_by( token: token )
         @current_user
        end
    end

    def render_unauthorized
       logger.debug "***UNAUTHORIZED REQUEST: #{request.env('HTTP_AUTHORIZATION')} ***"
    end
end
