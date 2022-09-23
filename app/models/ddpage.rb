class Ddpage < ApplicationRecord
    has_many :text_blocks, dependent: :destroy

    validates :title, :en, :es, :pt, presence: true
end
