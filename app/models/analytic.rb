class Analytic < ApplicationRecord
  validates :pages_home, numericality: { only_integer: true }, allow_nil: true
  validates :pages_download_pdf, numericality: { only_integer: true }, allow_nil: true
  validates :pages_cv, numericality: { only_integer: true }, allow_nil: true
  validates :pages_philosophy, numericality: { only_integer: true }, allow_nil: true
  validates :pages_projects, numericality: { only_integer: true }, allow_nil: true
  validates :pages_uikit, numericality: { only_integer: true }, allow_nil: true
  validates :pages_legal, numericality: { only_integer: true }, allow_nil: true
  validates :contacts_index, numericality: { only_integer: true }, allow_nil: true
  validates :tournaments_index, numericality: { only_integer: true }, allow_nil: true
  validates :tournaments_create, numericality: { only_integer: true }, allow_nil: true
  validates :rolls_create, numericality: { only_integer: true }, allow_nil: true
  validates :puzzles_index, numericality: { only_integer: true }, allow_nil: true
  validates :puzzles_create, numericality: { only_integer: true }, allow_nil: true
  validates :morbacs_create, numericality: { only_integer: true }, allow_nil: true
  validates :puissance4s_create, numericality: { only_integer: true }, allow_nil: true
  validates :escapes_create, numericality: { only_integer: true }, allow_nil: true
  validates :dikkeneks_index, numericality: { only_integer: true }, allow_nil: true
  validates :dikkeneks_create, numericality: { only_integer: true }, allow_nil: true
  validates :errors_internal_server_error, numericality: { only_integer: true }, allow_nil: true
  validates :errors_not_found, numericality: { only_integer: true }, allow_nil: true
  validates :errors_unprocessable_entity, numericality: { only_integer: true }, allow_nil: true
end
