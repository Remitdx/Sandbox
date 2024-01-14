class Education
  include ActiveModel::Model

  def initialize
  end

  def my_education
    {
      2021 => I18n.t('education.wagon'),
      2014 => I18n.t('education.hei'),
      2009 => I18n.t('education.bac')
    }
  end
end
