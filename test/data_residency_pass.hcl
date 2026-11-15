policy "data_residency" {

  source = "../data_residency.sentinel"

  module {
    source = "../../tests/pass/data_residency/tfplan.json"
  }
}