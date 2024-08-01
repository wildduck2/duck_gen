defmodule Files.Web.Backend.Nodejs.Types do
  @express_types_index ~c"""
  import 'express-session'

  declare module 'express-session' {
    interface SessionData {
      // NOTE: some types here to be extended in the session type 
    }
  }
  """
  def express_types_index, do: @express_types_index
end
