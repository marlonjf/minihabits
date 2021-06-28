# frozen_string_literal: true

require 'jwt'

module Users
  class Login
    include Interactor

    SECRET = ENV.fetch('SECRET_KEY', '6ec182ba53e7fd946e7730c41a9036e59b077041399faaebf8f64fd7ab28d7aacf4fa53289d8a65f')

    delegate :user_params, to: :context

    def call
      context.user.update(refresh_token: generate_refresh_token)
    end

    private

    def generate_refresh_token
      JWT.encode(jwt_payload, SECRET, 'HS256')
    end

    def jwt_payload
      { id: context.user.id, exp: Time.current.to_i + 7.days.to_i }
    end
  end
end
