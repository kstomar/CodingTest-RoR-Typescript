# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#landing"
  resources :todos, only: :update do
    collection do
      post :reset_all
    end
  end
end
