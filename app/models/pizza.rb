# frozen_string_literal: true

class Pizza < ApplicationRecord
  enum sauce: { tomate: 'tomate', creme_fraiche: 'creme_fraiche', originale: 'originale' }
end
