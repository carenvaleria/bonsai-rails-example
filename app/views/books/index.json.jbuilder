json.array!(@books) do |book|
  json.extract! book, :id, :title, :excerpt, :author_id, :publisher_id, :genre_id
  json.url book_url(book, format: :json)
end
