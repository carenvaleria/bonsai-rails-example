default: &default
  indices:
    books:
      settings:
        index:
          number_of_shards:   1
        analysis:
          analyzer:
            fuzzy:
              type: custom
              tokenizer: lowercase
              filter:
                - fuzzy_ngram
            english:
              tokenizer: standard
              filter:
                - lowercase
                - english_possessive_stemmer
                - english_stemmer

          filter:
            fuzzy_ngram:
              type:     edgeNGram
              min_gram: 1
              max_gram: 30

            english_possessive_stemmer:
              type:     stemmer
              language: possessive_english

            english_stemmer:
              type:     stemmer
              langauge: english
      mappings:
        book:
          properties:

            # Index the title field with multiple kinds of analyzers
            title:
              type: string
              analyzer: fuzzy

            excerpt:
              type: string
            genre:
              properties:
                name:
                  type: string
            author:
              properties:
                name:
                  type: string
            publisher:
              properties:
                name:
                  type: string

development:
  <<: *default

production:
  <<: *default
