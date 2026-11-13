policy "trusted_modules" {

  source = "../trusted_modules.sentinel"

  module {
    source = "../../tests/pass/trusted_modules/tfplan.json"
  }
}