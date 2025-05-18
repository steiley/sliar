class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  private

  def render_404
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false, content_type: 'text/html'
  end
end
