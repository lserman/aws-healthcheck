Rails.application.routes.draw do
  mount -> (env) { ['200', {}, []] }, at: '/healthcheck'
end
