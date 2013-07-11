class Advertising < ActiveRecord::Base
  attr_accessible :description, :status, :title, :user

  has_enumeration_for :status, with: Status, create_helpers: true

  belongs_to :user

  validates :description, :status, :title, presence: true

  def to_s
    "#{title} - #{I18n.localize(created_at.to_date)}".to_s
  end
end
