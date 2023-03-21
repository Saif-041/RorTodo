class ApplicationController < ActionController::Base

    def start
        render plain: 'Hello World!'
    end
end
