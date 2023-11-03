
resource "newrelic_synthetics_script_monitor" "monitor2" {
  count = length(var.scripted_browser)

  status = "ENABLED"
  name   = var.scripted_browser[count.index].name
  # type             = "SCRIPT_API"
  type             = "SCRIPT_BROWSER"
  locations_public = ["AP_SOUTH_1", "AP_EAST_1"]
  period           = "EVERY_12_HOURS"

  enable_screenshot_on_failure_and_script = false

  script = file("${path.root}/${var.scripted_browser[count.index].script_file}")


  runtime_type_version = "100"
  runtime_type         = "CHROME_BROWSER"
  script_language      = "JAVASCRIPT"
}
