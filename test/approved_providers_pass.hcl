policy "approved_providers" {

  source = "../approved_providers.sentinel"

  module {
    source = "../../tests/pass/approved_providers/tfplan.json"
  }
}