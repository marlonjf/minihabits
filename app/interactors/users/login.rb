# frozen_string_literal: true

require 'jwt'

module Users
  class Login
    include Interactor

    SECRET = '1234567989'

    delegate :user_params, to: :context

    def call
      context.user.update(refresh_token: generate_refresh_token)
    end

    private

    def generate_refresh_token
      JWT.encode(jwt_payload, SECRET, 'HS256')
    end

    def jwt_payload
      { uid: context.user.id }
    end
  end
end
