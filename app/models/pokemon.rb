class Pokemon < ApplicationRecord
  serialize :abilities
  serialize :evolutions
  serialize :descriptions
end
