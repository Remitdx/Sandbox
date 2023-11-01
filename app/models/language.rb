class Language
  include ActiveModel::Model

  def initialize
  end

  def my_languages
    {
      I18n.t('language.french') => 10,
      I18n.t('language.english') => 9,
      I18n.t('language.spanish') => 3,
      I18n.t('language.italian') => 3,
      I18n.t('language.german') => 3,
    }
  end
end
