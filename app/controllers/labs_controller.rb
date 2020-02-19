class LabsController < ApplicationController
  before_action :get_lab_and_check_permission, only: [:show, :edit, :update, :destroy]

  def index
    @labs = Lab.all
    authorize @labs
  end

  def show
  end

  def new
    @lab = Lab.new
    authorize @lab
  end

  def create
    @lab = Lab.new(lab_params)
    authorize @lab
    if @lab.save
      redirect_to labs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @lab.update(lab_params)
      redirect_to labs_path
    else
      render :edit
    end
  end

  private

  def get_lab_and_check_permission
    @lab = Lab.find(params[:id])
    authorize @lab
  end

  def lab_params
    params[:lab].permit(:code, :name)
  end
end
