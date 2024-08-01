defmodule Files.Web.Backend.Nodejs.Env do
  @env_ts_content ~c"""
  PORT=3000
  DATABASE_URL='mysql://user:password@localhost:yourport/database'
  CORS_PATH='http://localhost:yourport'
  """
  def env_ts_content, do: @env_ts_content
end
