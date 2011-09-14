class ApplicationController < ActionController::Base
  protect_from_forgery

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

end

