resource "newrelic_synthetics_script_monitor" "monitor" {
  count = length(var.scripted_api)

  status           = "ENABLED"
  name             = var.scripted_api[count.index].name
  type             = "SCRIPT_API"
  locations_public = ["AP_SOUTH_1", "AP_EAST_1"]
  period           = "EVERY_12_HOURS"

  # script = file("${path.root}" + "/" + "${var.scripted_api[count.index].script_file}")
  script = file("${path.root}/${var.scripted_api[count.index].script_file}")


  # script = file("${path.root}/${each.value.script}")


  script_language      = "JAVASCRIPT"
  runtime_type         = "NODE_API"
  runtime_type_version = "16.10"
}

