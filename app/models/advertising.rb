class Advertising < ActiveRecord::Base
  attr_accessible :description, :status, :title, :user

  belongs_to :user

  validates :description, :status, :title, presence: true

  def to_s
    "#{title} - #{I18n.localize(created_at.to_date)}".to_s
  end
end
