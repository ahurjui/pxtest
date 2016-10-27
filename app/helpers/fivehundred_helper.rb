require 'rubygems'
require 'oauth'
require 'multi_json'

module FivehundredHelper

    @@access_token = nil

    # The method check if we already have an access_token object and returns that object.
    # If the methods gets the username and password in method's arguments it will try to authenticate to 500px api
    #
    # @param [string] username - for 500 px auth
    # @param [string] password - for 500 px auth
    # @return [boolean/object] - false if the auth did not succeed
    def get_access_token username = nil, password = nil

        if @@access_token != nil
            return @@access_token
        elseif @@access_token == nil && username == nill && password == nil
            return nil
        end

        consumer = OAuth::Consumer.new(Rails.application.config.x.fivehundred.consumer_key, Rails.application.config.x.fivehundred.consumer_secret, {
            :site               => Rails.application.config.x.fivehundred.base_url,
            :request_token_path => "/v1/oauth/request_token",
            :access_token_path  => "/v1/oauth/access_token",
            :authorize_path     => "/v1/oauth/authorize"})

        begin
            request_token = consumer.get_request_token()
            access_token = consumer.get_access_token(request_token, {}, { :x_auth_mode => 'client_auth', :x_auth_username => username, :x_auth_password => password })

            @@access_token = access_token
        rescue
            return false
        end

        access_token
    end
end