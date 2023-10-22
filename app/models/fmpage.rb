# frozen_string_literal: true

class Fmpage < ApplicationRecord
  has_many :text_blocks, dependent: :destroy

  validates :title, :en, :es, :pt, presence: true
end
