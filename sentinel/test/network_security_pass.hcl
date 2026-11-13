policy "network_security" {

  source = "../network_security.sentinel"

  module {
    source = "../../tests/pass/network_security/tfplan.json"
  }
}