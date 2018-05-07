module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message })
    end
  end
end
