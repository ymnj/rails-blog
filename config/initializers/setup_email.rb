ActionMailer::Base.smtp_settings = {
  address:              "smtp.gmail.com",
  port:                 "587",
  enable_starttls_auto: true,
  domain: "tomhung.ca",
  authentication:       :plain,
  user_name:            ENV["GMAIL_USERNAME"],
  password:             ENV["GMAIL_PASSWORD"]
}
