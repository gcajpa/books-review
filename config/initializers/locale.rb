Rails.env.on(:any) do |config|
  config.i18n.default_locale = 'pt-BR'
  config.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.{rb,yml}').to_s]
  config.i18n.available_locales = [:en, :'pt-BR']
end

Rails.env.on(:development, :test) do |config|
  config.action_view.raise_on_missing_translations = true
end
