class Tracing < ActiveRecord::Base
	def self.getSeguimientos(convenio_id)
	return Tracing.where(["agreement_id = ?" , convenio_id])
end
end
