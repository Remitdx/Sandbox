class Contact < ApplicationRecord
  validates :name, presence: true
  validates :surname, presence: true
  validates :email, presence: true
  validates :message, presence: true
end
