Rails.application.routes.draw do
    root 'homepage#index'

    namespace :api, defaults: { format: 'json' } do
        scope :sponsees do
            get 'sponsees', to: 'sponsees#list'
        end
        scope :sponsors do
            get 'sponsors', to: 'sponsors#list'
        end
        scope :sponsorships do
            get 'sponsors', to: 'sponsorships#list_sponsors'
            get 'sponsees', to: 'sponsorships#list_sponsees'
            get 'sponsor/:id', to: 'sponsorships#sponsor', constraints: { id: /[0-9]+(%7C[0-9]+)*/ }
            get 'sponsee/:id', to: 'sponsorships#sponsee', constraints: { id: /[0-9]+(%7C[0-9]+)*/ }
        end
    end

    get '*path', to: 'homepage#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
