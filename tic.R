
do_package_checks()

os <- R.version$os

tilde <- if (grepl("mingw", os)) "C:/Users/appveyor/Documents" else "~"

if (Sys.getenv("id_rsa") != "" && ci()$get_branch() == "master") {
  # pkgdown documentation can be built optionally. Other example criteria:
  # - `inherits(ci(), "TravisCI")`: Only for Travis CI
  # - `ci()$is_tag()`: Only for tags, not for branches
  # - `Sys.getenv("BUILD_PKGDOWN") != ""`: If the env var "BUILD_PKGDOWN" is set
  # - `Sys.getenv("TRAVIS_EVENT_TYPE") == "cron"`: Only for Travis cron jobs
  get_stage("before_deploy") %>%
    add_step(step_setup_ssh())

  get_stage("deploy") %>%
    add_step(step_setup_push_deploy(
      path = file.path(tilde, "git/drat"),
      branch = "master",
      remote = paste0("git@github.com:", gsub("/.*$", "/tic.drat.repo", ci()$get_slug()), ".git")
    )) %>%
    add_step(step_add_to_drat()) %>%
    add_step(step_do_push_deploy(path = file.path(tilde, "git/drat")))
}
