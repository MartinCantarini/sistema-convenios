class TypeagreementsController < ApplicationController
  def new
    @denominacion=Typeagreement.new
  end

  def create
    @denominacion=Typeagreement.new(params_create)
    if @denominacion.save
      redirect_to typeagreements_url
      flash[:notice]="Denominación dada de alta con éxito"
    else
      redirect_to typeagreements_url
      flash[:alert]="No se puede completar la acción en este momento, por favor intente nuevamente en unos segundos"
    end  
  end

  def index
  end

  def show
  end

  def edit
    @denominacion=Typeagreement.find(params[:id])
  end

  def update
    @denominacion=Typeagreement.find(params[:id])
    @denominacion.update(params_create)
    if @denominacion.save
      redirect_to typeagreements_url
      flash[:notice]="Denominación actualizada con éxito"
    else
      redirect_to typeagreements_url
      flash[:alert]="No se puede completar la acción en este momento, por favor intente nuevamente en unos segundos"
    end 
  end

  def destroy
  end
  
  def params_create
    params.require(:typeagreement).permit(:denominacion)
  end 
end
