class AgreementsController < ApplicationController
  load_and_authorize_resource :only => [:new, :edit, :destroy]
  def new
    @convenio=Agreement.new
  end

  def create
    @convenio=Agreement.new(params_create)
    if @convenio.save
      redirect_to agreement_url(@convenio.id)
      flash[:notice]="Convenio dado de alta con éxito"
    elsif @convenio.errors.messages.any?
      redirect_to agreements_url
      @convenio.errors.messages.each do |clave,registro|
        flash[:alert]="#{registro}".tr('[]"','')  
      end  
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
    @convenio = Agreement.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReportPdf.new(@convenio, view_context)
        send_data pdf.render, filename: 
        "convenio_#{@convenio.expediente}.pdf",
        type: "application/pdf"
      end
    end
  end

  def index
    @convenios=Agreement.all.page(params[:page]).per(20)
    if (params[:search1] or params[:search2] or params[:search3] or params[:search4] or params[:search5])
      @convenios = Agreement.search(params[:search1],params[:search2],params[:search3],params[:search4],params[:search5]).order("created_at DESC").page(params[:page]).per(20)
    end
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
