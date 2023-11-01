class Education
  include ActiveModel::Model

  def initialize
  end

  def my_education
    {
      2009 => I18n.t('education.bac'),
      2014 => I18n.t('education.hei'),
      2021 => I18n.t('education.wagon')
    }
  end
end
