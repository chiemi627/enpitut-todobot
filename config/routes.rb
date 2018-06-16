Rails.application.routes.draw do
  get 'todo/add_task'
  post 'add_task', to: 'todo#add_task'
end
