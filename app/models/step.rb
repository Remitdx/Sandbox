class Step
  include ActiveModel::Model

  def initialize
  end

  def conception_steps
    {
    1 => I18n.t('conception.step1'),
    2 => I18n.t('conception.step2'),
    3 => I18n.t('conception.step3'),
    4 => I18n.t('conception.step4')
    }
  end

  def development_steps
    {
    1 => I18n.t('development.step1'),
    2 => I18n.t('development.step2'),
    3 => I18n.t('development.step3'),
    4 => I18n.t('development.step4'),
    5 => I18n.t('development.step5')
    }
  end

  def maintenance_steps
    {
    1 => I18n.t('maintenance.step1'),
    2 => I18n.t('maintenance.step2'),
    3 => I18n.t('maintenance.step3')
    }
  end
end
