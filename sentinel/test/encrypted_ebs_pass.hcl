policy "encrypted_ebs" {

  source = "../encrypted_ebs.sentinel"

  module {
    source = "../../tests/pass/encrypted_ebs/tfplan.json"
  }
}