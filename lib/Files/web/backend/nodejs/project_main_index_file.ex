defmodule Files.Web.Backend.Nodejs.ProjectMainIndexFile do
  @index_ts_content ~c"""
  import express from 'express'
  import dotEnv from 'dotenv'
  import cookieParser from 'cookie-parser'
  import cors from 'cors'
  import bodyParser from 'body-parser'

  import { auth_router } from './routes'
  import { prismaSession } from './utils'
  import { csrf_token } from './middlewares'
  import { corsOptions } from './constants';

  export const app = express()
  dotEnv.config()

  //NOTE: some configs for the routes
  app.use(cors(corsOptions))
  app.use(bodyParser.json())
  app.use(cookieParser())
  app.use(prismaSession)
  app.use(csrf_token)

  app.use(auth_router)

  app.listen(3000, () => {
    console.log('duck_gen server is running and listening to the port : 3000')
  })
  """
  def index_ts_content, do: @index_ts_content
end
