class Author < ApplicationRecord
  has_many :books
  has_many :publishers, through: :books
  has_many :genres, through: :books

  validates :name, presence: true

  def to_s
    name
  end

end
