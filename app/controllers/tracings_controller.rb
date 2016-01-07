class TracingsController < ApplicationController
  def new
    @movimiento=Tracing.new;
  end

  def create
    @movimiento=Tracing.new(params_tracing)
    id_convenio=@movimiento.agreement_id
    if @movimiento.save
      redirect_to agreement_path(id_convenio)
      flash[:notice]="Moviento dado de alta con éxito"
    else
      redirect_to agreements_path
      flash[:alert]="No se puede completar la acción en este momento, por favor intente nuevamente en unos segundos"
    end
  end

  def edit
    @movimiento=Tracing.find(params[:id])
  end

  def update
    @movimiento=Tracing.find(params[:id])
    id_convenio=@movimiento.agreement_id
    @movimiento.update(params_tracing)
    if @movimiento.save
      redirect_to agreement_path(id_convenio)  
      flash[:notice]="Moviento actualizado con éxito"
    else
      redirect_to agreement_path(id_convenio)
      flash[:alert]="No se puede completar la acción en este momento, por favor intente nuevamente en unos segundos"
    end
  end

  def show
    @movimiento=Tracing.find(params[:id])
  end

  def index
    @movimiento=Tracing.all
  end

  def destroy
    @movimiento=Tracing.find(params[:id])
    id_convenio=@movimiento.agreement_id
    @movimiento.destroy
    if @movimiento.save
      redirect_to agreement_path(id_convenio)  
      flash[:notice]="Moviento eliminado con éxito"
    else
      redirect_to agreement_path(id_convenio)
      flash[:alert]="No se puede completar la acción en este momento, por favor intente nuevamente en unos segundos"
    end
  end

  def params_tracing
     params.require(:tracing).permit(:estado, :fecha, :agreement_id)
  end  

end
