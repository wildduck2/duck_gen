defmodule Files.Web.Backend.Nodejs.Config do
  @config_ts_content ~c"""
  export const env = {
    PORT: process.env.PORT || 3000,
    CORS_PATH: process.env.CORS_PATH || '',
    DATABASE_URL: process.env.DATABASE_URL || '',
  }
  """
  def config_ts_content, do: @config_ts_content
end
