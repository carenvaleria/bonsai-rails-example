# Bonsai-Rails-Example App

Getting started with Bonsai Elasticsearch and Ruby on Rails is incredibly quick and simple to do. [Sign Up](https://bonsai.io/signup) for your free account we'll take it from there!  


## Creating Your First Bonsai Cluster

Once you've signed up for your free account on Bonsai, you'll be prompted to create your first Trial cluster.
Give your cluster a name and pick a region. The name helps you to distinguish between different applications
and the region is how we manage our infrastructure on Amazon Web Services. Click on the "Create Cluster" button
and voila, you've created your very first Bonsai cluster!


## Our Example Rails App

Our example Rails app will provide you a good outline to follow along.
You can access the [GitHub repo](https://github.com/carenvaleria/bonsai-rails-example) here.

In our example app, Bookfaces we'll have a list of books that are searchable via Book Title, Author, Publisher and Genre.
You can see the app in action [here](https://agile-anchorage-88938.herokuapp.com/).
So now that we have our example code (or a Rails project of your own) let's go ahead and get things ready for Bonsai.


## Connecting Your Rails App to Your Bonsai Cluster

Bonsai clusters are created with unique URLs, designed for secure, authenticated access to the Elasticsearch API.
To avoid security concerns we strongly recommend adding your Bonsai Elasticsearch URL to your environment as a
variable, you can do so by running:

```
export BONSAI_URL="<YOUR BONSAI URL>"
```

Now let's add the this gem to your Gemfile:

```
gem 'bonsai-elasticsearch-rails'
```

Run ```bundle install``` and we'll move on to the next step.


## Get Your App Ready to Index Models You'd Like to be Searchable

We'll want to prepare our models to be indexed and searchable by Bonsai.
Take a look at ```app/models/book.rb```, where we include our ```Elasticsearch::Model```

```Ruby
class Book < ApplicationRecord
  include Elasticsearch::Model

  belongs_to :author
  belongs_to :publisher
  belongs_to :genre

  ### View the entirety in the GitHub repo
end
```

We'll want to do this for all models that we want indexed. It's also advisable that we create rake tasks
to import documents. It will allow you to index searchable records via rake tasks. You can do so by creating a file ```lib/tasks/elasticsearch.rake``` and including:

```
require 'elasticsearch/rails/tasks/import'
```

Keep in mind you will need to explicitly create your index before you can put documents there, since Bonsai does not support "lazy" index creation. We've already (or at least should have) done the best way, which is to use the rake task we set up in the prior step. The first time you index your content, you'll want to set the FORCE parameter like so:

```
rake environment elasticsearch:import:all FORCE=y
```

The FORCE parameter will explicitly delete and recreate indices, so you probably don't want to use it frequently. Subsequent indexing tasks can drop this parameter.

The alternative way to do it would be to create your indices with curl. So in our Book model, use the following command to create the index:

```
curl -XPUT http://username:password@redwood-12345.us-east-1.bonsai.io/books
```

## Congratulations! You've Added Bonsai to Your Rails App

You have created your Bonsai cluster, added your cluster URL to your App, indexed the models and now can deploy to the service of your choice! For our example we used Heroku, where you can install the [Bonsai Addon](https://docs.bonsai.io/docs/getting-started-with-heroku).


Please feel free to give us feedback or ask questions at devcontent@omc.io or [@onemorecloud](https://twitter.com/onemorecloud).
