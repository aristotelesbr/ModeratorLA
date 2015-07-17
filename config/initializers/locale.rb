Rails.configuration.i18n.default_locale = 'pt-BR'
Rails.configuration.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.yml').to_s]

# Exibir mensagens de erro, caso falte tradução
Rails.configuration.action_view.raise_on_missing_translations = true
