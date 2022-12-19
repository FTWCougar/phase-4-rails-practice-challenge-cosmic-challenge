class PlanetsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        planets = Planet.all
        render json: planets, status: :ok
    end

    private

    def not_found
        render json: { error: "Scientist not found" }, status: :not_found
    end
end
