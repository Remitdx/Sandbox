class Language
  include ActiveModel::Model

  def initialize
  end

  def my_languages
    {
      'language.french' => 10,
      'language.english'=> 9,
      'language.spanish'=> 3,
      'language.italian'=> 3,
      'language.german'=> 3,
    }
  end
end
