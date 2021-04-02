module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :habits,
          [Types::HabitType],
          null: false,
          description: "Returns a list of habits in the martian library"

    def habits
      Habit.all
    end
  end
end
