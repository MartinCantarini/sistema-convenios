class ReportPdf < Prawn::Document
  def initialize(convenio, view)
    super()
    logo
    move_down 30
    text "Convenio #{convenio.expediente}", :size => 25 , :style => :bold
    move_down 20
    text "Denominación:",:size=>15, :style => :bold 
    move_down 5
    text "#{convenio.denominacion}"
    move_down 20
    text "Fecha de firma:",:size=>15, :style => :bold
    move_down 5
    text "#{convenio.fechadefirma}"
    move_down 20
    text "Compromiso económico:",:size=>15, :style => :bold
    move_down 5
    text "#{convenio.compromisoeconomico}"
    move_down 20
    text "Decreto/Resolución:",:size=>15, :style => :bold
    move_down 5
    text "#{convenio.decreto}"
    move_down 20
    text "Duración:",:size=>15, :style => :bold
    move_down 5
    text "#{convenio.duracion}"
    move_down 20
    text "Contacto:",:size=>15, :style => :bold
    move_down 5
    text "#{convenio.contacto}"
    move_down 20
    text "Objeto:",:size=>15, :style => :bold
    move_down 5
    text"#{convenio.objeto}"
    move_down 30
    text "Firmantes", :size => 20 , :style => :bold
    move_down 15
    tabla_firmantes(convenio)
    move_down 30
    text "Movimientos", :size => 20 , :style => :bold
    move_down 15
    tabla_movimientos(convenio)
  end

  def logo
    logopath="#{Rails.root}/app/assets/images/headerpdf2.png"
    image logopath
  end

  def tabla_firmantes(convenio)
    firmantes=Signature.getFirmantes(convenio.id)
    firmantes.all.each do |f|
      text "-#{f.firmante}(#{f.fecha})", :size=>15
      move_down 15
    end 
  end
  
  def tabla_movimientos(convenio)
    movimientos=Tracing.getSeguimientos(convenio.id)
    movimientos.all.each do |m|
      text "-#{m.estado}(#{m.fecha})", :size=>15
      move_down 15
    end 
  end

end

 