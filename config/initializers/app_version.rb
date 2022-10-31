if defined?(Rails.root.to_s) && File.exist?(Rails.root.join('config','version.yml'))
  APP_VERSION = App::Version.load Rails.root.join('config','version.yml').to_s
end
