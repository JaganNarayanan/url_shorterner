class Url < ApplicationRecord
  alidates :long, presence: true, uniqueness: true
  validates :long, format: { with: URI.regexp }, if: 'long.present?'
  before_create :shorten

  def shorten
    self.short = SecureRandom.hex(10)
  end
  
end
