class Pokemon < ApplicationRecord

  serialize :abilities
  serialize :evolutions
  serialize :descriptions

  include PgSearch::Model

  pg_search_scope :search_pokemons,
  against: [:abilities, :weight, :descriptions, :name],
  using: {
    tsearch: { prefix: true }
  }
end
