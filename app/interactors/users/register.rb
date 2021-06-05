# frozen_string_literal: true

module Users
  class Register
    include Interactor

    delegate :user_params, to: :context

    def call
      user = User.create(user_params)
      return context.fail!(error: user.errors.full_messages) unless user.persisted?

      context.user = user
    end

    def rollback
      context.user.destroy
    end
  end
end
