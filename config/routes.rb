require_dependency "embed_complete_constraint"

EmbedComplete::Engine.routes.draw do
  get "/" => "embed_complete#index", constraints: EmbedCompleteConstraint.new
  get "/actions" => "actions#index", constraints: EmbedCompleteConstraint.new
  get "/actions/:id" => "actions#show", constraints: EmbedCompleteConstraint.new
end
