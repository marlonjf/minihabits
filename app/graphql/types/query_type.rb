module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :user,
          Types::UserType,
          null: true

    field :user_habits,
          [Types::HabitType],
          null: false

    field :user_goals,
          [Types::GoalType],
          null: false

    def user
      context[:current_user]
    end

    def user_habits
      user.habits
    end

    def user_goals
      user.goals
    end
  end
end
