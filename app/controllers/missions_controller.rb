class MissionsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid

    def create
        mission =
            Mission.create!(
                name: params[:name],
                scientist_id: params[:scientist_id],
                planet_id: params[:planet_id],
            )
        render json: mission.planet, status: :created
    end

    private

    def invalid(invalid)
        render json: {
                          errors: invalid.record.errors.full_messages,
                      },
                      status: :unprocessable_entity
    end
end
