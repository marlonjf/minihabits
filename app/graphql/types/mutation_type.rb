module Types
  class MutationType < Types::BaseObject
    field :register_user, mutation: Mutations::RegisterUser
    field :login, mutation: Mutations::Login
  end
end
