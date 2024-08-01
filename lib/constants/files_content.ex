defmodule Constants.FilesContent do


  @controllers_index_ts_content ~c""
  def controllers_index_ts_content, do: @controllers_index_ts_content



  @config_index_ts_content ~c"""

  """
  def config_index_ts_content, do: @config_index_ts_content

  @services_index_ts_content ~c"""
    export class User {
      constructor() {}
    }
  """
  def services_index_ts_content, do: @services_index_ts_content

  @routes_index_ts_content ~c"""
    import * from './auth'
  """
  def routes_index_ts_content, do: @routes_index_ts_content

  @utils_index_ts_content ~c"""
    import * from '.'
  """
  def utils_index_ts_content, do: @utils_index_ts_content
end
