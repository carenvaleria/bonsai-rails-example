# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'elasticsearch/rails/tasks/import'

Rails.application.load_tasks

# Custom reindexing task for Elasticsearch,
# so I can avoid dumping all the mappings in the model.
# - TODO: versioned+aliased hot reindexing
task :reindex => :environment do

  es = Elasticsearch::Model.client
  configs = Rails.application.config_for('elasticsearch')

  configs['indices'].each do |index_name, index_settings|
    if es.indices.exists?(index: index_name)
      es.indices.delete(index: index_name)
    end
    es.indices.create(index: index_name, body: index_settings)
  end

  Book.import(scope: 'indexable')
end
