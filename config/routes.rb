Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Handle the frontend app
  if Rails.env.development?
    # In development, we can simply redirect to the Vite dev server URL, as this is
    # probably what the user wanted
    get "(*path)", to: redirect("http://localhost:5173/%{path}", status:302)
  else
    # In production, serve the public/index.html file for all URLs but assets, as we have
    # a Single-Page Application with history routing
    # See https://router.vuejs.org/guide/essentials/history-mode#HTML5-Mode
    # Snippet adapted from https://stackoverflow.com/a/77184296
    constraints(path: %r{^(?!/assets)}) do
      get "(*path)", to: ->(env) {
        [200, {}, [Rails.root.join("public/index.html").read]]
      }
    end
  end
end
