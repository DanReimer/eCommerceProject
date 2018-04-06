# frozen_string_literal: true

OrderState.delete_all
OrderState.create! id: 1, name: 'In Progress'
OrderState.create! id: 2, name: 'Placed'
