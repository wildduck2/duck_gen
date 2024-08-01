defmodule Constants.FilesContent do
  @package_json_content ~c"""
  {
    "name": "duck_gen_project",
    "version": "1.0.0",
    "main": "index.js",
    "scripts": {
      "start": "nodemon --exec tsx ./src/index.ts && npm run format && npm run lint",
      "lint": "npx @biomejs/biome lint --write ./src",
      "lint:fix": "npx @biomejs/biome lint --write --unsafe ./src",
      "format": "npx @biomejs/biome format --write ./",
      "test": "vitest",
      "coverage": "vitest run --coverage"
    },
    "repository": {
      "type": "git",
      "url": "git+https://github.com/your/repo.git"
    },
    "keywords": [],
    "author": "duck_gen_author",
    "license": "ISC",
    "description": "duck_gen_description",
    "dependencies": {},
    "devDependencies": {}
  }
  """
  def package_json_content, do: @package_json_content

  @tsconfig_json_content ~c"""
  {
    "compilerOptions": {
      "target": "ES2020",
      "module": "commonjs",
      "strict": true,
      "esModuleInterop": true,
      "skipLibCheck": true,
      "forceConsistentCasingInFileNames": true,
      "moduleResolution": "node",
      "baseUrl": "./src",
      "outDir": "./dist",
      "rootDir": "./src",
      "paths": {
        "@services/*": ["services/*"],
        "@middlewares/*": ["middlewares/*"]
      },
      "typeRoots": ["./types", "./node_modules/@types"],
      "types": ["node", "vitest", "express-session"]
    },
    "include": ["src", "tests", "types"],
    "exclude": ["node_modules", "dist"]
  }
  """
  def tsconfig_json_content, do: @tsconfig_json_content

  @biome_config_content ~c"""
  {
    "formatter": {
      "enabled": true,
      "formatWithErrors": false,
      "ignore": [],
      "attributePosition": "auto",
      "indentStyle": "space",
      "indentWidth": 2,
      "lineWidth": 80,
      "lineEnding": "lf"
    },
    "typescript": {
      "formatter": {
        "arrowParentheses": "always",
        "bracketSameLine": false,
        "bracketSpacing": true,
        "jsxQuoteStyle": "double",
        "quoteProperties": "asNeeded",
        "semicolons": "always",
        "trailingCommas": "all"
      }
    },
    "linting": {
      "enabled": true,
      "commands": {
        "lint": "npx eslint .",
        "lint:fix": "npx eslint . --fix"
      },
      "options": {
        "lintOnSave": true
      }
    },
    "json": {
      "formatter": {
        "trailingCommas": "none"
      }
    }
  }
  """
  def biome_config_content, do: @biome_config_content

  @index_ts_content ~c"""
    import express from 'express'
    import dotEnv from 'dotenv'
    import { auth_router } from './routes'
    import cors from 'cors'
    import bodyParser from 'body-parser'
    import { prismaSession } from './utils'
    import cookieParser from 'cookie-parser'
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

  @controllers_index_ts_content ~c""
  def controllers_index_ts_content, do: @controllers_index_ts_content

  @constants_index_ts_content ~c"""
    export const corsOptions = {
      origin: process.env.CORS_PATH, // Replace with your actual domain
      methods: ['GET', 'POST', 'PUT', 'DELETE'],
      credentials: true // if you need to support credentials
    }
  """
  def constants_index_ts_content, do: @constants_index_ts_content

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
