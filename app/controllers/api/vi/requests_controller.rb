class Api::Vi::RequestsController < ApplicationController

    def index
        requests = Request.all
        render json: requests, status: :ok
    end

    def show
        request = Request.find(params[:id])
        render json: request
    rescue StandardError => e
        render json: { error: e }, status: :not_found
    end

    def create
        request = Request.new(request_params, status: 'RECEIVED')
        request.save!
        render json: request, status: :created
    rescue StandardError => e
        render json: { error: e }, status: :unprocessable_entity
    end

    def update
        request = Request.find(params[:id])
        request.update!(request_params)
        render json: request, status: :ok
    rescue StandardError => e
        render json: { error: e }, status: :unprocessable_entity
    end

    def delete
        request = Request.find(params[:id])
        request.destroy!
        render json: request, status: :ok
    rescue StandardError => e
        render json: { error: e }, status: :bad_request
    end

    def update_status
        request = Request.find(params[:id])
        if request == 'RECEIVED' && params[:status] == 'CONFIRMED'
            request.update!(status: 'CONFIRMED')
        elsif request == 'CONFIRMED' && params[:status] == 'DISPATCHED'
            request.update!(status: 'DISPATCHED')
        elsif params[:status] == 'CANCELED' && request != 'CANCELED' && request != 'DELIVERED'
            request.update!(status: 'CANCELED')
        elsif params[:status] == 'DELIVERED' && request != 'CANCELED' && request != 'DELIVERED'
            request.update!(status: 'DELIVERED')
        else
            render json { error: 'O status não pode ser alterado' }, status: :bad_request
        end
        render json: request, status: :ok
    rescue StandardError => e
        render json: { error: e }, status: :unprocessable_entity
    end

    private

    def request_params
        params.require(:request).permit(
            :client_name,
            :product_name,
            :value,
            :create_time
        )
    end

end


