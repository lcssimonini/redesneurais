
Redesneurais::Application.routes.draw do
  resources :pessoas
  root :to => 'inicio#index'

  match "/salva_tabela" => "inicio#salva_tabela"
  match "/show_tabela" => "inicio#show_tabela"
  match "/destroi_tabela" => "inicio#destroi_tabela"
  match "/salva_targets" => "inicio#salva_targets"
  match "/treino" => "treino#treino_tabela"
  match "/treinar_tabela" => "treino#treinar"


end
