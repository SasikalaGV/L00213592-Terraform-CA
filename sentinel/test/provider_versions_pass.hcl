policy "provider_versions" {

  source = "../provider_versions.sentinel"

  module {
    source = "../../tests/pass/provider_versions/tfplan.json"
  }
}