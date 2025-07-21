class ErrorsController < ApplicationController
  allow_unauthenticated_access
  before_action :contact_empty_shell, only: [ :internal_server_error ]

  def internal_server_error
    render status: 500
  end

  def unprocessable_entity
    render status: 422
  end

  def not_found
    render status: 404
  end

  private

  def contact_empty_shell
    @contact = Contact.new
  end
end
