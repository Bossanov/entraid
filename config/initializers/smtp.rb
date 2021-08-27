ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: 'gmail.com',
  user_name: 'antoine.staumont@gmail.com',
  password: 'Boss62152',
  authentication: :login,
  enable_starttls_auto: true
}
