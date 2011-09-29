class ApplicationController < ActionController::Base
  include UrlHelper
# include SubdomainUsers

  protect_from_forgery

 # before_filter :check_user_status
#  before_filter :limit_subdomain_access

  def temporary_name(email)
    email_split = email.split('@')
    email_local = email_split[0]
    local_spaced = email_local.split('.').join(' ')
    temporary_name = local_spaced.titleize
  end

  def temporary_subdomain(email)
    email_split   = email.split('@')
    email_local   = email_split[0]
    local_dashed  = email_local.split('.').join('-')
    temporary_subdomain = "#{local_dashed}-#{random_subdomain_number}"
  end

  def random_subdomain_number
    random_subdomain_number = SecureRandom.random_number(10)
  end

  protected

    def check_user_status
      unless user_subdomain == default_user_subdomain
        redirect_to default_user_url if current_user_with_subdomain.nil?
      end
    end

    def limit_subdomain_access
      if request.subdomain.present?
        redirect_to root_url(:subdomain => false)
      end
    end
end

