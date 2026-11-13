policy "approved_instance_types" {

  source = "../approved_instance_types.sentinel"

  module {
    source = "../../tests/pass/approved_instance_types/tfplan.json"
  }
}