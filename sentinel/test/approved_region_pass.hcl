policy "approved_region" {

  source = "../approved_region.sentinel"

  module {
    source = "../../tests/pass/approved_region/tfplan.json"
  }
}