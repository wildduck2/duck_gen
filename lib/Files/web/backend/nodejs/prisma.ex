defmodule Files.Web.Backend.Nodejs.Prisma do
  def prisma_schema_content(db_type) do
    """
    // This is your Prisma schema file,
    // learn more about it in the docs: https://pris.ly/d/prisma-schema

    // Looking for ways to speed up your queries, or scale easily with your serverless or edge functions?
    // Try Prisma Accelerate: https://pris.ly/cli/accelerate-init

    generator client {
      provider = "prisma-client-js"
    }

    datasource db {
      provider = "#{db_type}"
      url      = env("DATABASE_URL")
    }

    model User {
      id                  String          @id @default(uuid()) @db.Char(36)
      first_name          String?
      last_name           String?
      user_name           String          @unique
      email               String          @unique
      password            String


      @@index([user_name, email], map: "_IDX_UESR")
    }
    """
  end
end
