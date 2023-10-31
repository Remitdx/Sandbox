class Education
  include ActiveModel::Model

  def initialize
  end

  def my_education
    {
      2009 => 'education.bac',
      2014 => 'education.hei',
      2021 => 'education.wagon'
    }
  end
end
