class Request < ApplicationRecord
    validates :client_name, :product_name, :value, :state, :create_time, presence: true
    validates :state, inclusion: ['RECEIVED', 'CONFIRMED', 'DISPATCHED', 'DELIVERED', 'CANCELED']
    validates :value, numericality: { greater_than_or_equal_to: 0 }
end
