resource "dbtcloud_repository" "urban_route_repository" {
  project_id             = dbtcloud_project.urban_route_project.id
  remote_url             = var.github_remote_url
  github_installation_id = var.github_installation_id
  git_clone_strategy     = "github_app"
}

resource "dbtcloud_project_repository" "urban_route_project_repository" {
  project_id    = dbtcloud_project.urban_route_project.id
  repository_id = dbtcloud_repository.urban_route_repository.repository_id
}
