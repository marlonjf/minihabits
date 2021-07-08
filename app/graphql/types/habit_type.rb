module Types
  class HabitType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :habit_name, String, null: false

    def habit_name
      object.goal.name
    end
  end
end
