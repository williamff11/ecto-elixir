import Config

config :friends, Friends.Repo,
  database: "friends_repo",
  username: "root",
  password: "root",
  hostname: "localhost",
  port: 33006

config :friends, ecto_repos: [Friends.Repo]
