BONSAI_URL = ENV['https://3lfrff7wo8:8d8u7kpnga@my-first-cluster-137796205.us-east-1.bonsai.io']

if BONSAI_URL
  Elasticsearch::Model.client = Elasticsearch::Client.new(
    url: BONSAI_URL,
    log: true
  )
end
