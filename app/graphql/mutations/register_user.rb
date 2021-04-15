module Mutations
  class RegisterUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true

    field :token, String, null: false
    field :user, Types::UserType, null: false

    def resolve(**params)
      result = register_user(params)

      result.success? ? result : execution_error(message: result.error)
    end

    private

    def execution_error(message:)
      GraphQL::ExecutionError.new(message)
    end

    def register_user(params)
      Users::Register.call(user_params: params)
    end
  end
end
