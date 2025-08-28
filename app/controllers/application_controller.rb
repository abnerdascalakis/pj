class ApplicationController < ActionController::Base
  before_action :authenticate_user!
 include Pagy::Backend
  
  # Redireciona depois do logout
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  layout :set_layout

  private

  def set_layout
    devise_controller? ? "devise_application" : "application"
  end
end
