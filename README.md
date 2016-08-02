# Bonsai-Rails-Example App

Getting started with Bonsai Elasticsearch and Ruby on Rails app is incredibly quick and simple to do. [Sign Up](https://bonsai.io/signup) for your free account we'll take it from there!  


* Creating Your First Bonsai Cluster

Once you've signed up for your free account on Bonsai, you'll be prompted to create your first Trial cluster.
Give your cluster a name and pick a region. The name helps you to distinguish between different applications
and the region is how we manage our infrastructure on Amazon Web Services. Click on the "Create Cluster" button
and voila, you've created your very first Bonsai cluster!

img placeholder

* Connecting Your Rails App to Your Bonsai Cluster

Bonsai clusters are created with unique URLs, designed for secure, authenticated access to the Elasticsearch API.
To avoid security concerns we strongly recommend adding your Bonsai Elasticsearch URL to your environment as a
variable, you can do so by running:

```
export BONSAI_URL="<YOUR BONSAI URL>"
```

Add the this gem to your Gemfile

Run Bundle install

* Have Your App Ready to Index Models You'd Like to be Searchable


* Test Your App and get Ready to Deploy
