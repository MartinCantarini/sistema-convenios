class Agreement < ActiveRecord::Base
	validates :expediente, uniqueness: {message: "El convenio que quiere agregar ya existe, por favor ingrese otro número de expediente"}
	has_many :signatures, :dependent => :destroy
	has_many :tracings, :dependent => :destroy
	belongs_to :typeagreements
	def self.search(search1,search2,search3,search4,search5)
	#search1=fecha1;search2=fecha2;search3=expediente;search4=denominacion;search5=firmante;
		search5=search5.upcase
		if 	  !search1.blank? and !search2.blank? and !search3.blank? and !search4.blank? and !search5.blank?
			  fecha1=search1.to_date
			  fecha2=search2.to_date
			  @firmante=Array.new;
			  Signature.all.each do |fir|
			  	if(fir.firmante==search5)
			  		@firmante.push(fir.agreement_id)
			  	end	
			  end
		  	  where("fechadefirma BETWEEN ? AND ? AND expediente LIKE ? AND denominacion LIKE ? AND id IN (?)", fecha1, fecha2, search3, "%#{search4}%",@firmante)#falta firmante
		
		elsif !search1.blank? and !search2.blank? and search3.blank? and search4.blank? and search5.blank?  
			  fecha1=search1.to_date
			  fecha2=search2.to_date
			  where("fechadefirma BETWEEN ? AND ?",fecha1,fecha2)
		
		elsif search1.blank? and search2.blank? and !search3.blank? and search4.blank? and search5.blank?  
			  where("expediente LIKE ?",search3)
		elsif search1.blank? and search2.blank? and search3.blank? and !search4.blank? and search5.blank?  
			  where("denominacion LIKE ?","%#{search4}%")
		
		elsif search1.blank? and search2.blank? and !search3.blank? and !search4.blank? and search5.blank?#expediente y denominación
			  where("expediente LIKE ? AND denominacion LIKE ?",search3,"%#{search4}%")
		
		elsif !search1.blank? and !search2.blank? and search3.blank? and !search4.blank? and search5.blank?#fecha y denominación
			  fecha1=search1.to_date
			  fecha2=search2.to_date
			  where("fechadefirma BETWEEN ? AND ? AND denominacion LIKE ?",fecha1,fecha2,"%#{search4}%")
		
		elsif !search1.blank? and !search2.blank? and !search3.blank? and search4.blank? and search5.blank?#fecha y expediente
			  fecha1=search1.to_date
			  fecha2=search2.to_date
			  where("fechadefirma BETWEEN ? AND ? AND expediente LIKE ?",fecha1,fecha2,search3)
		
		elsif !search1.blank? and !search2.blank? and !search3.blank? and !search4.blank? and search5.blank?#fecha, expediente y denominación
			  fecha1=search1.to_date
			  fecha2=search2.to_date			 
			  where("fechadefirma BETWEEN ? AND ? AND expediente LIKE ? AND denominacion LIKE ?",fecha1,fecha2,search3,"%#{search4}%")
		
		elsif search1.blank? and search2.blank? and search3.blank? and search4.blank? and !search5.blank?#firmante
			  @firmante=Array.new;
			  Signature.all.each do |fir|
			  	if(fir.firmante==search5)
			  		@firmante.push(fir.agreement_id)
			  	end	
			  end
			  where(:id => @firmante)
		
		elsif search1.blank? and search2.blank? and !search3.blank? and search4.blank? and !search5.blank?#firmante y expediente
			  @firmante=Array.new;
			  Signature.all.each do |fir|
			  	if(fir.firmante==search5)
			  		@firmante.push(fir.agreement_id)
			  	end	
			  end
			  where('id IN (?) AND expediente LIKE ?',@firmante,search3)	
		
		elsif search1.blank? and search2.blank? and search3.blank? and !search4.blank? and !search5.blank?#firmante y denominación
			  @firmante=Array.new;
			  Signature.all.each do |fir|
			  	if(fir.firmante==search5)
			  		@firmante.push(fir.agreement_id)
			  	end	
			  end
			  where('id IN (?) AND denominacion LIKE ?',@firmante,"%#{search4}%")		     
		
		elsif search1.blank? and search2.blank? and !search3.blank? and !search4.blank? and !search5.blank?#expediente, denominacion y firmante
			  @firmante=Array.new;
			  Signature.all.each do |fir|
			  	if(fir.firmante==search5)
			  		@firmante.push(fir.agreement_id)
			  	end	
			  end
			  where('id IN (?) AND expediente LIKE ? AND denominacion LIKE ?',@firmante,search3,"%#{search4}%")	
		
		elsif !search1.blank? and !search2.blank? and search3.blank? and search4.blank? and !search5.blank?#firmante y fecha
			  fecha1=search1.to_date
			  fecha2=search2.to_date
			  @firmante=Array.new;
			  Signature.all.each do |fir|
			  	if(fir.firmante==search5)
			  		@firmante.push(fir.agreement_id)
			  	end	
			  end
			  where('fechadefirma BETWEEN ? AND ? AND id IN (?)',fecha1,fecha2,@firmante)
		
		elsif !search1.blank? and !search2.blank? and search3.blank? and !search4.blank? and !search5.blank?#fecha, denominación y firmante
			  fecha1=search1.to_date
			  fecha2=search2.to_date
			  @firmante=Array.new;
			  Signature.all.each do |fir|
			  	if(fir.firmante==search5)
			  		@firmante.push(fir.agreement_id)
			  	end	
			  end
			  where('fechadefirma BETWEEN ? AND ? AND denominacion LIKE ? AND id IN (?)',fecha1,fecha2,"%#{search4}%",@firmante)	
		
		elsif !search1.blank? and !search2.blank? and !search3.blank? and search4.blank? and !search5.blank?#fecha, expediente y firmante
			  fecha1=search1.to_date
			  fecha2=search2.to_date
			  @firmante=Array.new;
			  Signature.all.each do |fir|
			  	if(fir.firmante==search5)
			  		@firmante.push(fir.agreement_id)
			  	end	
			  end
			  where('fechadefirma BETWEEN ? AND ? AND expediente LIKE ? AND id IN (?)',fecha1,fecha2,search3,@firmante)
		
		else
			  all  	  
		end	
	end
	
end
