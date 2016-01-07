class AgreementsController < ApplicationController

  def new
    @convenio=Agreement.new
  end

  def create
    @convenio=Agreement.new(params_create)
    if @convenio.save
      redirect_to agreement_url(@convenio.id)
      flash[:notice]="Convenio dado de alta con éxito"
    else
      redirect_to agreements_url
      flash[:alert]="No se puede completar la acción en este momento, por favor intente nuevamente en unos segundos"
    end   
  end

  def destroy
    @convenio=Agreement.find(params[:id])
    @convenio.destroy
    if @convenio.save
      redirect_to agreements_url
      flash[:notice]="Convenio dado de baja con éxito"
    else  
      redirect_to agreements_url
      flash[:alert]="No se puede completar la acción en este momento, por favor intente nuevamente en unos segundos"
    end
  end

  def edit
    @convenio=Agreement.find(params[:id])
  end

  def update
    @convenio=Agreement.find(params[:id])
    @convenio.update(params_create)
    if @convenio.save
      redirect_to agreements_url
      flash[:notice]="Convenio actualizado con éxito"
    else
      redirect_to agreements_url
      flash[:alert]="No se puede completar la acción en este momento, por favor intente nuevamente en unos segundos"
    end
  end

  def show 
    @convenio=Agreement.find(params[:id])
  end

  def index
    @convenios=Agreement.all
  end

  def home
  end 

  def admin
  end  

  def params_create
    params.require(:agreement).permit(:expediente, :contacto, :fechadefirma, :compromisoeconomico, :duracion, :estado,:decreto,:objeto,:observaciones, :denominacion)
  end 

  def params_update
  end  

end
