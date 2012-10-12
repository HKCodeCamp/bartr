class Settings < Settingslogic
  if File.exists?("#{Rails.root}/config/application.yml")
    source "#{Rails.root}/config/application.yml"
  else
    source "#{Rails.root}/config/application.default.yml"
  end

  namespace Rails.env
end