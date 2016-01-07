class Signature < ActiveRecord::Base

def self.getFirmantes(convenio_id)
	return Signature.where(["agreement_id = ?" , convenio_id])
end	

end
