module ExecutionErrorResponder
  extend ActiveSupport::Concern

  private

  def execution_error(message:, status:, code:)
    GraphQL::ExecutionError.new(message, options: { status: status, code: code })
  end
end
