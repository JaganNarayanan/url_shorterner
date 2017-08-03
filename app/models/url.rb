class Url < ApplicationRecord
  validates :long_url, presence: true, uniqueness: true
  validates :long_url, format: { with: URI.regexp }, if: 'long_url.present?'
  before_create :shorten

  def shorten
    self.short_url = SecureRandom.hex(10)
  end

end
