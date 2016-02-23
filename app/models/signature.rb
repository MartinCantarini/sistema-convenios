class Signature < ActiveRecord::Base

before_save :upcase_fields

def upcase_fields
    self.firmante.upcase!
end

def self.getFirmantes(convenio_id)
	return Signature.where(["agreement_id = ?" , convenio_id])
end	

end
