class TextBlock < ApplicationRecord
  belongs_to :ddpage

    #enum language: [:en, :es, :pt, :cr]
    #enum language: { "en": 0, "es": 1, "pt": 2, "cr": 3 }
end
