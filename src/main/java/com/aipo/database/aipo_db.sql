-- ============================================================================
-- DATABASE INITIALIZATION SCRIPT
-- ============================================================================
-- Database: aipo_db
-- Created: March 10, 2026
-- Purpose: Initialize database schema and sample data for Aipo User Management System
- Create database
CREATE DATABASE IF NOT EXISTS aipo_db;
USE aipo_db;

CREATE TABLE IF NOT EXISTS eip_m_company (
  company_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  company_name VARCHAR(64) NOT NULL,
  company_name_kana VARCHAR(64),
  zipcode VARCHAR(8),
  address VARCHAR(64),
  telephone VARCHAR(15),
  fax_number VARCHAR(15),
  url VARCHAR(99),
  ipaddress VARCHAR(99),
  port INT(11),
  ipaddress_internal VARCHAR(99),
  port_internal INT(11),
  create_date DATE,
  update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CHARSET=utf8mb4,
  COLLATE=utf8mb4_general_ci
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS eip_m_position (
  position_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  position_name VARCHAR(64) NOT NULL,
  sort INT(11),
  create_date DATE,
  update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CHARSET=utf8mb4,
  COLLATE=utf8mb4_general_ci
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS eip_m_post (
  post_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  company_id INT(11) NOT NULL,
  post_name VARCHAR(64) NOT NULL,
  zipcode VARCHAR(8),
  address VARCHAR(64),
  in_telephone VARCHAR(15),
  out_telephone VARCHAR(15),
  fax_number VARCHAR(15),
  group_name VARCHAR(99),
  sort INT(11),
  create_date DATE,
  update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY group_name_unique (group_name),
  CHARSET=utf8mb4,
  COLLATE=utf8mb4_general_ci
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS turbine_group (
  group_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  group_name VARCHAR(99) NOT NULL UNIQUE,
  objectdata BLOB,
  owner_id INT(11),
  group_alias_name VARCHAR(99),
  public_flag CHAR(1),
  UNIQUE KEY group_name_unique (group_name),
  CHARSET=utf8mb4,
  COLLATE=utf8mb4_general_ci
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS turbine_user (
  user_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  login_name VARCHAR(32) NOT NULL UNIQUE,
  password_value VARCHAR(200) NOT NULL,
  first_name VARCHAR(99) NOT NULL,
  last_name VARCHAR(99) NOT NULL,
  email VARCHAR(99),
  confirm_value VARCHAR(99),
  modified TIMESTAMP NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_login TIMESTAMP NULL,
  disabled VARCHAR(1) DEFAULT 'F',
  objectdata BLOB,
  password_changed TIMESTAMP NULL,
  company_id INT(11),
  position_id INT(11),
  in_telephone VARCHAR(15),
  out_telephone VARCHAR(15),
  cellular_phone VARCHAR(15),
  cellular_mail VARCHAR(99),
  cellular_uid VARCHAR(99),
  first_name_kana VARCHAR(99),
  last_name_kana VARCHAR(99),
  photo BLOB,
  has_photo VARCHAR(1) DEFAULT 'F',
  photo_modified TIMESTAMP NULL,
  photo_smartphone BLOB,
  has_photo_smartphone VARCHAR(1) DEFAULT 'F',
  photo_modified_smartphone TIMESTAMP NULL,
  tutorial_forbid VARCHAR(1) DEFAULT 'F',
  migrate_version INT(11) DEFAULT 0,
  created_user_id INT(11),
  updated_user_id INT(11),
  UNIQUE KEY login_name_unique (login_name),
  CHARSET=utf8mb4,
  COLLATE=utf8mb4_general_ci
) ENGINE=InnoDB;

INSERT INTO turbine_user (
  user_id, login_name, password_value, first_name, last_name, email,
  confirm_value, modified, created, last_login, disabled, objectdata,
  password_changed, company_id, position_id, in_telephone, out_telephone,
  cellular_phone, cellular_mail, cellular_uid, first_name_kana, last_name_kana,
  photo, has_photo, photo_modified, photo_smartphone, has_photo_smartphone,
  photo_modified_smartphone, tutorial_forbid, migrate_version, created_user_id, updated_user_id
) VALUES
(
  2, 'chuyenvx', '123', 'Chuyen', 'Vu', 'chuyen@gmail.com',
  NULL, NULL, '2026-03-09 20:33:04', NULL, 'F', NULL,
  NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
  NULL, 'F', NULL, NULL, 'F', NULL, 'F', 0, NULL, NULL
),
(
  3, 'tinhnd', '123', 'Tinh', 'Dinh', 'tinh@gmail.com',
  NULL, NULL, '2026-03-09 20:33:04', NULL, NULL, NULL,
  NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
  NULL, 'F', NULL, NULL, 'F', NULL, 'F', 0, NULL, NULL
),
(
  5, 'nguyendt', 'dang.2006', 'Dang', 'Nguyen', 'dang.2006.qt@gmail.com',
  NULL, NULL, '2026-03-10 06:25:00', NULL, 'F', NULL,
  NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
  NULL, 'F', NULL, NULL, 'F', NULL, 'F', 0, NULL, NULL
);


