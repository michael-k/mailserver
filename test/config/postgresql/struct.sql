-- MySQL dump 10.16  Distrib 10.1.19-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: 127.0.0.1
-- ------------------------------------------------------
-- Server version	10.1.16-MariaDB-1~jessie

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table admin
--

DROP TABLE IF EXISTS admin;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE admin (
  username varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  superadmin boolean DEFAULT false NOT NULL,
  created timestamp with time zone DEFAULT now(),
  modified timestamp with time zone DEFAULT now(),
  active boolean DEFAULT true NOT NULL,
  PRIMARY KEY (username)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table admin
--

COPY admin (username, password, superadmin, created, modified, active) FROM stdin;
admin@domain.tld	{SHA512-CRYPT}$6$Wt7uQEnB6HPP6mM0$lOP8IKtEUJKWSwczEC5/g6aYamkwh5rx3ztnRuqcRLJjGTXiLpUnxzUgy2rfNieH9C8x7M6Nr9q19SG6njUj//	t	2016-11-28 08:53:31+00	2016-11-28 08:53:31+00	t
\.

--
-- Table structure for table alias
--

DROP TABLE IF EXISTS alias;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE alias (
  address varchar(255) NOT NULL,
  goto text NOT NULL,
  domain varchar(255) NOT NULL,
  created timestamp with time zone DEFAULT now(),
  modified timestamp with time zone DEFAULT now(),
  active boolean DEFAULT true NOT NULL,
  PRIMARY KEY (address)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table alias
--

COPY alias (address, goto, domain, created, modified, active) FROM stdin;
postmaster@domain.tld	john.doe@domain.tld	domain.tld	2016-11-28 08:54:26.000000+00	2016-11-28 08:58:19.000000+00	t
hostmaster@domain.tld	john.doe@domain.tld	domain.tld	2016-11-28 08:54:26.000000+00	2016-11-28 08:58:19.000000+00	t
john.doe@domain.tld	john.doe@domain.tld	domain.tld	2016-11-28 08:56:47.000000+00	2016-11-28 08:56:47.000000+00	t
sarah.connor@domain.tld	sarah.connor@domain.tld	domain.tld	2016-11-28 08:57:51.000000+00	2016-11-28 08:57:51.000000+00	t
\.

--
-- Table structure for table alias_domain
--

DROP TABLE IF EXISTS alias_domain;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE alias_domain (
  alias_domain varchar(255) NOT NULL,
  target_domain varchar(255) NOT NULL,
  created timestamp with time zone DEFAULT now(),
  modified timestamp with time zone DEFAULT now(),
  active boolean DEFAULT true NOT NULL,
  PRIMARY KEY (alias_domain)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table alias_domain
--


--
-- Table structure for table config
--

DROP TABLE IF EXISTS config;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE config (
  id integer NOT NULL,
  name varchar(20) NOT NULL DEFAULT '',
  value varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (id)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table config
--

COPY config (id, name, value) FROM stdin;
1	version	1836
\.

--
-- Table structure for table domain
--

DROP TABLE IF EXISTS domain;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE domain (
  domain varchar(255) NOT NULL,
  description character varying(255) DEFAULT ''::character varying NOT NULL,
  aliases integer NOT NULL DEFAULT '0',
  mailboxes integer NOT NULL DEFAULT '0',
  maxquota bigint NOT NULL DEFAULT '0',
  quota bigint NOT NULL DEFAULT '0',
  transport varchar(255) NOT NULL,
  backupmx boolean DEFAULT false NOT NULL,
  created timestamp with time zone DEFAULT now(),
  modified timestamp with time zone DEFAULT now(),
  active boolean DEFAULT true NOT NULL,
  PRIMARY KEY (domain)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table domain
--

COPY domain (domain, description, aliases, mailboxes, maxquota, quota, transport, backupmx, created, modified, active) FROM stdin;
ALL		0	0	0	0		f	2016-11-28 08:53:31+00	2016-11-28 08:53:31+00	t
domain.tld		0	0	1	0	virtual	f	2016-11-28 08:54:26+00	2016-11-28 08:54:26+00	t
\.

--
-- Table structure for table domain_admins
--

DROP TABLE IF EXISTS domain_admins;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE domain_admins (
  username varchar(255) NOT NULL,
  domain varchar(255) NOT NULL,
  created timestamp with time zone DEFAULT now(),
  active boolean DEFAULT true NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table domain_admins
--

COPY domain_admins (username, domain, created, active) FROM stdin;
admin@domain.tld	ALL	2016-11-28 08:53:31+00	t
\.

--
-- Table structure for table fetchmail
--

DROP TABLE IF EXISTS fetchmail;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE fetchmail (
  id integer NOT NULL,
  domain varchar(255) DEFAULT '',
  mailbox varchar(255) NOT NULL,
  src_server varchar(255) NOT NULL,
  src_auth character varying(15) NOT NULL,
  src_user varchar(255) NOT NULL,
  src_password varchar(255) NOT NULL,
  src_folder varchar(255) NOT NULL,
  poll_time integer DEFAULT 10 NOT NULL,
  fetchall boolean DEFAULT false NOT NULL,
  keep boolean DEFAULT false NOT NULL,
  protocol character varying(15) NOT NULL,
  usessl boolean DEFAULT false NOT NULL,
  sslcertck boolean DEFAULT false NOT NULL,
  sslcertpath character varying(255) DEFAULT ''::character varying,
  sslfingerprint varchar(255) DEFAULT '',
  extra_options text,
  returned_text text,
  mda varchar(255) NOT NULL,
  date timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  created timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  modified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  active boolean DEFAULT false NOT NULL,
  CONSTRAINT fetchmail_protocol_check CHECK (((protocol)::text = ANY ((ARRAY['POP3'::character varying, 'IMAP'::character varying, 'POP2'::character varying, 'ETRN'::character varying, 'AUTO'::character varying])::text[]))),
  CONSTRAINT fetchmail_src_auth_check CHECK (((src_auth)::text = ANY ((ARRAY['password'::character varying, 'kerberos_v5'::character varying, 'kerberos'::character varying, 'kerberos_v4'::character varying, 'gssapi'::character varying, 'cram-md5'::character varying, 'otp'::character varying, 'ntlm'::character varying, 'msn'::character varying, 'ssh'::character varying, 'any'::character varying])::text[]))),
  PRIMARY KEY (id)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table fetchmail
--

COPY fetchmail (id, domain, mailbox, src_server, src_auth, src_user, src_password, src_folder, poll_time, fetchall, keep, protocol, usessl, sslcertck, sslcertpath, sslfingerprint, extra_options, returned_text, mda, date, created, modified, active) FROM stdin;
1	domain.tld	sarah.connor@domain.tld	127.0.0.1	password	john.doe@domain.tld	dGVzdHBhc3N3ZDEy		10	1	1	IMAP	1	0						2016-12-05 11:59:01	2016-12-05 11:58:53	2016-12-05 11:58:53	t
\.

--
-- Table structure for table log
--

DROP TABLE IF EXISTS log;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE log (
  "timestamp" timestamp with time zone DEFAULT now(),
  username varchar(255) DEFAULT ''::character varying NOT NULL,
  domain varchar(255) DEFAULT ''::character varying NOT NULL,
  action varchar(255) DEFAULT ''::character varying NOT NULL,
  data text DEFAULT ''::text NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table log
--

--
-- Table structure for table mailbox
--

DROP TABLE IF EXISTS mailbox;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE mailbox (
  username varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  name character varying(255) DEFAULT ''::character varying NOT NULL,
  maildir varchar(255) NOT NULL,
  quota bigint NOT NULL DEFAULT '0',
  local_part varchar(255) NOT NULL,
  domain varchar(255) NOT NULL,
  created timestamp with time zone DEFAULT now(),
  modified timestamp with time zone DEFAULT now(),
  active boolean DEFAULT true NOT NULL,
  PRIMARY KEY (username)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table mailbox
--

COPY mailbox (username, password, name, maildir, quota, local_part, domain, created, modified, active) FROM stdin;
john.doe@domain.tld	{SHA512-CRYPT}$6$v1LkarodHyGGmfoy$ZszVBzfEZ0CaVnYaBasgvaHJUCNfxwD/E0eNy3iuix56Vl1ZcuDvG9PVr9JRZx5k.7wp1nMb5M1V4aZXo2yfn0	John DOE	domain.tld/john.doe/	1024000	john.doe	domain.tld	2016-11-28 08:56:47	2016-11-28 08:56:47	1
sarah.connor@domain.tld	{SHA512-CRYPT}$6$ub.zCcyeaM7Mhs6S$rL4Yj2.Zsk8aFoF5l1mAddVrPo.UZ/1UrNwBC7UTBrX47cViSHo5eepEes6jMqC21P3cBm82adqJZvo91Ekme0	Sarah CONNOR	domain.tld/sarah.connor/	1024000	sarah.connor	domain.tld	2016-11-28 08:57:51	2016-11-28 08:57:51	1
\.

--
-- Table structure for table quota
--

DROP TABLE IF EXISTS quota;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE quota (
  username varchar(255) NOT NULL,
  path varchar(100) NOT NULL,
  current bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (username,path)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table quota
--

--
-- Table structure for table quota2
--

DROP TABLE IF EXISTS quota2;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE quota2 (
  username varchar(100) NOT NULL,
  bytes bigint NOT NULL DEFAULT '0',
  messages integer NOT NULL DEFAULT '0',
  PRIMARY KEY (username)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table quota2
--

COPY quota2 (username, bytes, messages) FROM stdin;
john.doe@domain.tld	0	0
sarah.connor@domain.tld	0	0
\.

--
-- Table structure for table vacation
--

DROP TABLE IF EXISTS vacation;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE vacation (
  email varchar(255) NOT NULL,
  subject character varying(255) NOT NULL,
  body text DEFAULT ''::text NOT NULL,
  activefrom timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  activeuntil timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  cache text NOT NULL,
  domain varchar(255) NOT NULL,
  interval_time integer NOT NULL DEFAULT '0',
  created timestamp with time zone DEFAULT now(),
  modified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  active boolean DEFAULT true NOT NULL,
  PRIMARY KEY (email)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table vacation
--

--
-- Table structure for table vacation_notification
--

DROP TABLE IF EXISTS vacation_notification;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE vacation_notification (
  on_vacation character varying(255) NOT NULL,
  notified character varying(255) NOT NULL,
  notified_at timestamp with time zone DEFAULT now() NOT NULL,
  PRIMARY KEY (on_vacation,notified)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table vacation_notification
--

--
-- Dumping routines for database 'postfix'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-28 10:02:24
