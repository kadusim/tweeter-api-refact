module ExceptionHandler
  extend ActiveSupport::Concern

  class ClassNotImplementedError < StandardError; end
  class MethodNotImplementedError < StandardError; end

  included do
    rescue_from ExceptionHandler::ClassNotImplementedError do |e|
      json_response({ message: e.message }, :not_implemented)
    end

    rescue_from ExceptionHandler::MethodNotImplementedError do |e|
      json_response({ message: e.message }, :not_implemented)
    end
  end
end
