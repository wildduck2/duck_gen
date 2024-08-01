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
      address             Json?
      age                 Int?
      bio                 String?
      picture             String?
      pronounce           String?
      years_of_experience Int?
      profession          String?
      lastLogin_ip        String?
      password            String
      verified_email      Boolean?
      created_at          DateTime        @default(now())
      updated_at          DateTime        @updatedAt
      sessions            Session?
      Otp                 Otp?
      recoveryData        RecoveryData?

      @@index([user_name, email], map: "_IDX_UESR")
    }

    model RecoveryData {
      id      String @id @default(uuid()) @db.Char(36)
      user_id String @unique @db.Char(36)
      email   String
      number  String
      User    User   @relation(fields: [user_id], references: [id])
    }

    model Session {
      id         String   @id @default(uuid()) @db.Char(36)
      sid        String   @unique
      user_id    String?  @unique
      user       User?    @relation(fields: [user_id], references: [id])
      created_at DateTime @default(now())
      expiresAt  DateTime @db.Timestamp(6)
      data       Json     @db.Json

      @@index([expiresAt], map: "IDX_session_expire")
    }

    model Otp {
      id         String   @id @default(uuid()) @db.Char(36)
      user_id    String   @unique
      otp        String
      created_at DateTime @default(now())
      expires_at DateTime
      user       User?    @relation(fields: [user_id], references: [id])

      @@index([expires_at], map: "IDX_otp_expires_at")
    }
    """
  end
end
