class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :rescue404 #エラーハンドリング処理（始まり）

  private
    def rescue404(e)
      @exception = e
      render template: 'errors/not_exhibition', status: 404
    end #エラーハンドリング処理（終わり）


  def after_sign_in_path_for(resource)
    root_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:family_name,:last_name,:j_family_name,:j_last_name,:birth_year,:birth_month,:birth_day,address_attributes:[:ship_family_name,:ship_last_name,:ship_j_family_name,:ship_j_last_name,:postal_code,:prefectures,:municipalities,:house_number,:building,:phone_number]])
  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
    
  end
end
