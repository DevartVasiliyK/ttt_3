﻿SET QUOTED_IDENTIFIER OFF

SET ANSI_NULLS ON
GO
CREATE VIEW [sys].[database_firewall_rules] AS SELECT id, name, start_ip_address, end_ip_address, create_date, modify_date FROM sys.database_firewall_rules_table
GO