module Mutations
  class RegisterUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true

    field :user, Types::UserType, null: true
    field :token, String, null: true

    def resolve(**params)
      result = register_user(params)

      result.success? ? generate_response(result.user) : execution_error(message: result.error)
    end

    private

    def execution_error(message:)
      GraphQL::ExecutionError.new(message)
    end

    def register_user(params)
      Users::Register.call(user_params: params)
    end

    def generate_response(user)
      # generate_auth_headers(user)

      {
        user: user, token: '15315s156a1s561sd56' #SharedDomain::JsonWebToken.encode({ uid: user.id })
      }
    end
  end
end
