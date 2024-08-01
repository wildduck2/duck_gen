defmodule Constants.LibsInstall do
  @dependencies [
    "--save",
    "express",
    "body-parser",
    "cors",
    "dotenv",
    "express-session",
    "cookie-parser",
    "typescript"
  ]
  def dependencies, do: @dependencies

  @save_exact [
    "--save-dev",
    "--save-exact",
    "@biomejs/biome"
  ]
  def save_exact, do: @save_exact

  @dev_dependencies [
    "--save-dev",
    "@types/express",
    "@types/supertest",
    "@types/express-session",
    "@types/cookie-parser",
    "@types/supertest",
    "@types/node",
    "supertest",
    "ts-node",
    "nodemon",
    "vitest",
    "tsx",
    "zod"
  ]
  def dev_dependencies, do: @dev_dependencies
end
