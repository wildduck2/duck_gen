defmodule Files.Web.Backend.Nodejs.Constants do
  @constants_config_ts_content ~c"""
  export const corsOptions = {
    origin: process.env.CORS_PATH, // Replace with your actual domain
    methods: ['GET', 'POST', 'PUT', 'DELETE'],
    credentials: true // if you need to support credentials
  }
  """
  def constants_config_ts_content, do: @constants_config_ts_content

  @constants_index_ts_content ~c"""
  export * from './config'
  """
  def constants_index_ts_content, do: @constants_index_ts_content
end
