class SignaturesController < ApplicationController
  def new
    @firmante=Signature.new;
  end

  def create
    @firmante=Signature.new(params_signature)
    if @firmante.save
      redirect_to agreement_path(@firmante.agreement_id)
      flash[:notice]="Firmante dado de alta con éxito"
    else
      redirect_to agreements_path
      flash[:alert]="No se puede completar la acción en este momento, por favor intente nuevamente en unos segundos"
    end  
  end

  def show
  end

  def index
  end

  def edit
    @firmante=Signature.find(params[:id])
  end

  def update
    @firmante=Signature.find(params[:id])
    @firmante.update(params_signature)
    if @firmante.save
      redirect_to agreement_path(@firmante.agreement_id)
      flash[:notice]="Firmante modificado con éxito"
    else
      redirect_to agreements_path
      flash[:alert]="No se puede completar la acción en este momento, por favor intente nuevamente en unos segundos"
    end   
  end

  def destroy
    @firmante=Signature.find(params[:id])
    id_convenio=@firmante.agreement_id
    @firmante.destroy
    if @firmante.save
      redirect_to agreement_path(id_convenio)
      flash[:notice]="Firmante eliminado con éxito"
    else
      redirect_to agreement_path(id_convenio)      
      flash[:alert]="No se puede completar la acción en este momento, por favor intente nuevamente en unos segundos"
    end  
  end

  def params_signature
    params.require(:signature).permit(:firmante, :fecha, :agreement_id)
  end
  def params_signature_edit
    params.require(:signature).permit(:firmante, :fecha)
  end 


end
