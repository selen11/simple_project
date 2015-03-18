class Card < ActiveRecord::Base
  before_validation :set_review_date

  validates :review_date, :original_text, :translated_text, presence: true
  validates :translated_text, :original_text,
            length: { minimum: 3, maximum: 250 }
  validate :check_text

  private

  def set_review_date
    self.review_date = Time.now + 3.day
  end

  def check_text
    return if sanitize_text(:translated_text) != sanitize_text(:original_text)
    errors[:translated_text] << "Перевод не должен совпадать с оригиналом"
  end

  def sanitize_text(text_attribute)
    send(text_attribute).mb_chars.strip.downcase if self.respond_to?(text_attribute)
  end
end
