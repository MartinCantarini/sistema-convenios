class AddAgreementIdToSignature < ActiveRecord::Migration
  def change
    add_reference :signatures, :agreement, index: true
    add_foreign_key :signatures, :agreements
  end
end
