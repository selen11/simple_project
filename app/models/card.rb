class Card < ActiveRecord::Base
  before_validation :set_review_date

  validate :check_text
  validates :review_date, :original_text, :translated_text, presence: true
  validates :translated_text, :original_text,
            length: { minimum: 3, maximum: 250 }

  private

  def set_review_date
    self.review_date = Time.now + 3.day
  end

  def check_text
    return unless translated_text.strip.downcase == original_text.strip.downcase
    errors[:translated_text] << 'Перевод не должен совпадать с оригиналом'
  end
end
