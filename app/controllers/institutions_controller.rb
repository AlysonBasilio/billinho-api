class InstitutionsController < ApplicationController
  before_action :set_institution, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @institutions = Institution.all
    json_response(@institutions)
  end

  # POST /todos
  def create
    @institution = Institution.create!(institution_params)
    json_response(@institution, :created)
  end

  private

  def institution_params
    # whitelist params
    params.permit(:name, :cnpj, :institution_type)
  end

  def set_institution
    @institution = Institution.find(params[:id])
  end
end
