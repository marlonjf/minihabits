# frozen_string_literal: true

require 'jwt'

module Users
  class Auth
    include Interactor

    delegate :headers, to: :context

    def call
      return unless headers['Authorization'].present?

      decoded = JWT.decode(headers['Authorization'], Users::Login::SECRET, true, algorithm: 'HS256').first
      find_user(decoded['id'])
    rescue => e
      raise GraphQL::ExecutionError, e.message
    end

    private

    def find_user(id)
      context.user = User.find(id)
    end
  end
end
