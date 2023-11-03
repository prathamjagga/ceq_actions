module "scripted_api" {
  source       = "./childs/scripted_api"
  scripted_api = var.scripted_api
  # scripted_api_file = var.scripted_api[count.index].script_file
}

module "scripted_browser" {
  source           = "./childs/scripted_browser"
  scripted_browser = var.scripted_browser
}

