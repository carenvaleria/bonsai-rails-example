class Book < ApplicationRecord
  include Elasticsearch::Model

  belongs_to :author
  belongs_to :publisher
  belongs_to :genre

  validates :title,   presence: true
  validates :excerpt, presence: true

  def self.search(q)
    __elasticsearch__.search(
      query: {
        match: {
          _all: q
        }
      }
    )
  end

  def self.indexable
    includes(:author, :publisher, :genre)
  end

  def as_indexed_json(*_)
    as_json(
      only: [ :title, :excerpt ],
      include: {
        author:     { only: [ :name ] },
        publisher:  { only: [ :name ] },
        genre:      { only: [ :name ] }
      }
    )
  end

end
