# frozen_string_literal: true

class RepresentativesController < ApplicationController
  before_action :find_rep, only: [:show]
  def index
    @representatives = Representative.all
  end

  def show; end

  def find_rep
    @representative = Representative.find(params[:representative_id])
  end
end
