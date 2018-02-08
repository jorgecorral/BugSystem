RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :user
   end
   config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
config.main_app_name = ["BugSystem", "Jorge Corral"]


config.model Bug do
  create do
    field :descricao
    field :projeto
    field :imagem
  end
  edit do
    field :descricao do
      read_only true
    end
    field :solucionado
    field :solucao
    field :projeto do
      read_only true
    end
end
end
config.model Projeto do
  create do
  field :nome
  field :descricao
  field :link
end
edit do
    field :nome
  field :descricao
  field :link
end
end



  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
