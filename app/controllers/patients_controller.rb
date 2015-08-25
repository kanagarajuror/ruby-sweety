class PatientsController < ApplicationController

 before_filter :reading_count , :only => [:create]
  
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end
 
  def new
    @patient = Patient.new
  end

  def edit
    @patient = Patient.find(params[:id])
  end
 
  def create
    @patient = Patient.new(:reading_value => params[:patient][:reading_value].to_i, :user_id => current_user.id)
    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render json: @patient, status: :created, location: @patient }
      else
        format.html { render action: "new" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end
private
def reading_count
    if current_user.patients.check_count
      redirect_to new_patient_path,notice: "Per day count four times only.You have reached limit already."
    end
  end
end
