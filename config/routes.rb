Rails.application.routes.draw do
  resources :mock_servers do
    resources :mocks do
      collection do
        post 'when', to: :when, controller: 'mocks'
        get '*other'  => 'mocks#mock_get'
        post '*other'  => 'mocks#mock_post'
        put '*other'  => 'mocks#mock_put'
        delete '*other'  => 'mocks#mock_delete'
      end
    end
  end

end
