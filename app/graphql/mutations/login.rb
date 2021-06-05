module Mutations
  class Login < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true
    field :token, String, null: true

    def resolve(email:, password:)
      user = User.find_by(email: email)
      execution_error(message: 'bad_credentials') if user.blank? || !valid_password?(user, password)

      result = Users::Login.call(user: user)
      generate_response(result.user)
    end

    private

    def execution_error(message:)
      raise GraphQL::ExecutionError, message
    end

    def valid_password?(user, password)
      Devise::Encryptor.compare(User, user.encrypted_password, password)
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
