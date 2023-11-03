terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

provider "newrelic" {
  account_id = "4055886"
  api_key    = "NRAK-K5ZXGQRY90YRJ5CI1ER2JCL9LK8"
  region     = "US"
}
