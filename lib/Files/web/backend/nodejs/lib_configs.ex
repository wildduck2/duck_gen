defmodule Files.Web.Backend.Nodejs.LibConfigs do
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
end
