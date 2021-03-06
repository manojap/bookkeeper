SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[payroll_att]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[payroll_att](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[indate] [datetime] NULL CONSTRAINT [DF_payroll_att_indate]  DEFAULT ((0)),
	[outdate] [datetime] NULL CONSTRAINT [DF_payroll_att_outdate]  DEFAULT ((0)),
	[eid] [varchar](50) NULL,
	[halday] [bit] NULL CONSTRAINT [DF_payroll_att_halday]  DEFAULT ((0)),
	[fullday] [bit] NULL CONSTRAINT [DF_payroll_att_fullday]  DEFAULT ((1))
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[payroll_posting]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[payroll_posting](
	[pp_no] [int] IDENTITY(1,1) NOT NULL,
	[post_date] [datetime] NOT NULL,
	[eid] [varchar](50) NOT NULL,
	[amount] [numeric](18, 4) NULL,
	[narration] [varchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[cash_ac] [int] NULL CONSTRAINT [DF_payroll_posting_cash_ac]  DEFAULT ((0)),
	[isrecurring] [bit] NULL CONSTRAINT [DF_payroll_posting_isrecurring]  DEFAULT ((0)),
	[taskid] [int] NULL CONSTRAINT [DF_payroll_posting_taksid]  DEFAULT ((0)),
 CONSTRAINT [PK_payroll_posting] PRIMARY KEY CLUSTERED 
(
	[pp_no] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[payroll_entry]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[payroll_entry](
	[pe_no] [int] IDENTITY(1,1) NOT NULL,
	[eid] [varchar](max) NULL CONSTRAINT [DF_payroll_entry_eid]  DEFAULT ((0)),
	[bp] [numeric](18, 4) NULL CONSTRAINT [DF_payroll_entry_bp]  DEFAULT ((0)),
	[whours] [numeric](18, 2) NULL CONSTRAINT [DF_payroll_entry_whours]  DEFAULT ((0)),
	[wdays] [numeric](18, 2) NULL CONSTRAINT [DF_payroll_entry_wdays]  DEFAULT ((0)),
	[narration] [varchar](max) NULL,
	[isrecurring] [bit] NULL,
	[taskid] [int] NULL CONSTRAINT [DF_payroll_entry_taskid]  DEFAULT ((0)),
	[pe_date] [datetime] NULL,
	[total] [numeric](18, 4) NULL CONSTRAINT [DF_payroll_entry_total]  DEFAULT ((0)),
	[crledger] [int] NULL,
 CONSTRAINT [PK_payroll_entry] PRIMARY KEY CLUSTERED 
(
	[pe_no] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[service_registration]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[service_registration](
	[service] [varchar](max) NULL,
	[catagory] [varchar](max) NULL,
	[unitprice1] [decimal](18, 3) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NULL,
	[brand] [varchar](max) NULL,
	[Type of Device] [varchar](50) NULL,
 CONSTRAINT [PK_service_registration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[department_registration]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[department_registration](
	[department] [varchar](50) NOT NULL,
	[narration] [varchar](50) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dhead] [varchar](50) NULL,
	[isdaily] [bit] NULL CONSTRAINT [DF_department_registration_isdaily]  DEFAULT ((0)),
 CONSTRAINT [PK_department_registration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[receipts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[receipts](
	[r_no] [int] IDENTITY(1,1) NOT NULL,
	[r_cashledger] [int] NOT NULL,
	[r_invoice] [varchar](max) NULL,
	[r_cr_ledger] [int] NULL,
	[r_cramount] [decimal](18, 4) NOT NULL CONSTRAINT [DF_receipts_r_cramount]  DEFAULT ((0)),
	[r_narration] [varchar](max) NULL,
	[r_date] [datetime] NULL,
	[r_disc] [numeric](18, 4) NOT NULL CONSTRAINT [DF_receipts_r_disc]  DEFAULT ((0)),
	[r_damount] [numeric](18, 4) NOT NULL CONSTRAINT [DF_receipts_r_damount]  DEFAULT ((0)),
	[r_isrecurring] [bit] NULL CONSTRAINT [DF_receipts_r_isrecurring]  DEFAULT ((0)),
	[r_taskid] [int] NULL CONSTRAINT [DF_receipts_r_taskid]  DEFAULT ((0)),
 CONSTRAINT [PK_receipts] PRIMARY KEY CLUSTERED 
(
	[r_no] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[payments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[payments](
	[p_no] [int] IDENTITY(1,1) NOT NULL,
	[p_crledger] [int] NOT NULL CONSTRAINT [DF_payments_p_crledger]  DEFAULT ((0)),
	[p_drledger] [int] NOT NULL CONSTRAINT [DF_payments_p_drledger]  DEFAULT ((0)),
	[p_invoice] [varchar](max) NULL,
	[p_cr_amount] [decimal](18, 4) NOT NULL CONSTRAINT [DF_payments_p_cr_amount]  DEFAULT ((0)),
	[p_narration] [varchar](max) NULL,
	[p_date] [datetime] NOT NULL,
	[p_disc] [decimal](18, 4) NOT NULL CONSTRAINT [DF_payments_p_disc]  DEFAULT ((0)),
	[p_damount] [numeric](18, 4) NOT NULL CONSTRAINT [DF_payments_p_damount]  DEFAULT ((0)),
	[p_isrecurring] [bit] NOT NULL CONSTRAINT [DF_payments_isrecurring]  DEFAULT ((0)),
	[p_taskid] [int] NULL CONSTRAINT [DF_payments_p_taskid]  DEFAULT ((0)),
 CONSTRAINT [PK_payments] PRIMARY KEY CLUSTERED 
(
	[p_no] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[bank_payments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[bank_payments](
	[bp_no] [int] IDENTITY(1,1) NOT NULL,
	[bp_crledger] [int] NULL,
	[bp_drledger] [int] NULL,
	[bp_amount] [numeric](18, 4) NOT NULL CONSTRAINT [DF_bank_payments_bp_amount]  DEFAULT ((0)),
	[bp_disc] [numeric](18, 4) NOT NULL CONSTRAINT [DF_bank_payments_bp_disc]  DEFAULT ((0)),
	[bp_damount] [numeric](18, 4) NOT NULL CONSTRAINT [DF_bank_payments_bp_damount]  DEFAULT ((0)),
	[bp_type] [varchar](50) NULL,
	[bp_status] [varchar](50) NULL,
	[bp_bcharge] [numeric](18, 4) NULL,
	[bp_cheqno] [varchar](50) NULL,
	[bp_date] [datetime] NULL,
	[bp_cheqdate] [datetime] NULL,
	[bp_narration] [varchar](50) NULL,
	[bp_invoice] [varchar](50) NULL,
 CONSTRAINT [PK_bank_payments] PRIMARY KEY CLUSTERED 
(
	[bp_no] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[bank_receipts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[bank_receipts](
	[br_no] [int] IDENTITY(1,1) NOT NULL,
	[br_crledger] [int] NULL,
	[br_drledger] [int] NULL,
	[br_amount] [numeric](18, 4) NOT NULL CONSTRAINT [DF_bank_receipts_br_amount]  DEFAULT ((0)),
	[br_disc] [numeric](18, 4) NOT NULL CONSTRAINT [DF_bank_receipts_br_disc]  DEFAULT ((0)),
	[br_damount] [numeric](18, 4) NOT NULL CONSTRAINT [DF_bank_receipts_br_damount]  DEFAULT ((0)),
	[br_type] [varchar](50) NULL,
	[br_status] [varchar](50) NULL,
	[br_bcharge] [numeric](18, 4) NULL,
	[br_cheqno] [varchar](50) NULL,
	[br_date] [datetime] NULL,
	[br_cheqdate] [datetime] NULL,
	[br_narration] [varchar](50) NULL,
	[br_invoice] [varchar](50) NULL,
 CONSTRAINT [PK_bank_receipts] PRIMARY KEY CLUSTERED 
(
	[br_no] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ledgers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ledgers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[l_name] [varchar](max) NOT NULL,
	[l_short_name] [varchar](max) NOT NULL,
	[l_parent] [int] NOT NULL CONSTRAINT [DF_ledgers_l_parent]  DEFAULT ((0)),
	[l_cr_lock] [decimal](18, 2) NULL CONSTRAINT [DF_ledgers_l_cr_lock]  DEFAULT ((0)),
	[l_maxdisc] [decimal](18, 2) NULL CONSTRAINT [DF_ledgers_l_maxdisc]  DEFAULT ((0)),
	[l_duedays] [decimal](18, 2) NULL CONSTRAINT [DF_ledgers_l_duedays]  DEFAULT ((0)),
	[l_dr_lock] [decimal](18, 2) NULL CONSTRAINT [DF_ledgers_l_dr_lock]  DEFAULT ((0)),
	[l_cr] [decimal](18, 2) NULL CONSTRAINT [DF_ledgers_l_cr]  DEFAULT ((0)),
	[l_dr] [decimal](18, 2) NULL CONSTRAINT [DF_ledgers_l_dr]  DEFAULT ((0)),
	[l_catagory] [varchar](max) NULL,
	[l_address] [varchar](max) NULL,
	[l_city] [varchar](max) NULL,
	[l_mob] [varchar](max) NULL,
	[l_resi] [varchar](max) NULL,
 CONSTRAINT [PK_ledgers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[groups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[g_name] [varchar](max) NOT NULL,
	[g_parent] [int] NOT NULL,
	[g_maxdisc] [numeric](18, 3) NULL CONSTRAINT [DF_groups_g_maxdisc]  DEFAULT ((0)),
	[g_color] [varchar](max) NULL,
	[g_dr_lock] [numeric](18, 2) NULL CONSTRAINT [DF_groups_g_dr_lock_1]  DEFAULT ((0)),
	[g_cr_lock] [numeric](18, 3) NULL CONSTRAINT [DF_groups_g_cr_lock]  DEFAULT ((0)),
	[g_narration] [varchar](max) NULL,
 CONSTRAINT [PK_groups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[recurrings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[recurrings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[eno] [int] NOT NULL CONSTRAINT [DF_recurrings_eno]  DEFAULT ((0)),
	[entry] [varchar](max) NULL,
	[active] [bit] NULL CONSTRAINT [DF_recurrings_active]  DEFAULT ((0)),
	[mode] [int] NULL,
	[holidays] [varchar](max) NULL CONSTRAINT [DF_recurrings_holidays]  DEFAULT ('Sunday,Saturday'),
	[mode_configuration] [varchar](max) NULL,
	[lt_date] [datetime] NULL,
	[tag] [varchar](max) NULL,
 CONSTRAINT [PK_recurrings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[journal_entry]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[journal_entry](
	[j_no] [int] IDENTITY(1,1) NOT NULL,
	[j_cinvno] [varchar](max) NULL,
	[j_centryname] [varchar](max) NULL,
	[j_date] [datetime] NULL,
	[j_crledger] [int] NOT NULL CONSTRAINT [DF_journal_entry_j_crledger]  DEFAULT ((0)),
	[j_cramount] [decimal](18, 2) NOT NULL CONSTRAINT [DF_journal_entry_j_cramount]  DEFAULT ((0)),
	[j_drledger] [int] NOT NULL CONSTRAINT [DF_journal_entry_j_drledger]  DEFAULT ((0)),
	[j_dramount] [decimal](18, 2) NOT NULL CONSTRAINT [DF_journal_entry_j_dramount]  DEFAULT ((0)),
	[j_narration] [varchar](max) NULL,
	[j_isrecurring] [bit] NULL CONSTRAINT [DF_journal_entry_j_isrecurring]  DEFAULT ((0)),
	[j_taskid] [int] NULL CONSTRAINT [DF_journal_entry_j_taskid]  DEFAULT ((0)),
 CONSTRAINT [PK_journal_entry] PRIMARY KEY CLUSTERED 
(
	[j_no] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[payroll_entry_vouchers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[payroll_entry_vouchers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[voucher] [varchar](max) NULL,
	[isgen] [bit] NOT NULL CONSTRAINT [DF_payroll_entry_vouchers_isvoucher_gen]  DEFAULT ((0)),
	[pe_no] [int] NOT NULL CONSTRAINT [DF_Table_1_entryno]  DEFAULT ((0)),
	[amount] [decimal](18, 4) NOT NULL CONSTRAINT [DF_payroll_entry_vouchers_amount]  DEFAULT ((0)),
 CONSTRAINT [PK_payroll_entry_vouchers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[company]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[company](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[company] [varchar](max) NULL,
	[lmark] [varchar](max) NOT NULL,
	[place] [varchar](max) NOT NULL,
	[street] [varchar](max) NOT NULL,
	[post] [varchar](max) NOT NULL,
	[zipcode] [varchar](max) NOT NULL,
	[TAXID] [varchar](max) NOT NULL,
	[DLNO] [varchar](max) NOT NULL,
	[expno] [varchar](max) NOT NULL,
	[email] [varchar](max) NOT NULL,
	[officeno] [varchar](max) NOT NULL,
	[Mobile] [varchar](max) NOT NULL,
	[f_date1] [datetime] NOT NULL CONSTRAINT [DF_company_f_date1]  DEFAULT ((1)),
	[f_date2] [datetime] NOT NULL,
 CONSTRAINT [PK_company] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[transactions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[transactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[led_id] [int] NOT NULL,
	[op_led_id] [int] NOT NULL,
	[dr] [decimal](18, 4) NOT NULL,
	[cr] [decimal](18, 4) NOT NULL,
	[eno] [int] NOT NULL,
	[entry] [varchar](max) NOT NULL,
	[cinvno] [varchar](max) NOT NULL,
	[t_date] [datetime] NULL,
 CONSTRAINT [PK_transactions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ledger_part]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ledger_part](
	[l_id] [int] NOT NULL,
	[address] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[dist] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ledger_part] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[emp_registration]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[emp_registration](
	[eid] [varchar](max) NOT NULL,
	[lid] [int] NOT NULL,
	[dep_id] [int] NOT NULL,
	[designation] [varchar](max) NOT NULL,
	[basicpay] [numeric](18, 0) NULL,
	[comm] [numeric](18, 0) NULL,
	[doj] [datetime] NOT NULL,
	[isdailywager] [bit] NULL CONSTRAINT [DF_emp_registration_isdailywager]  DEFAULT ((0)),
 CONSTRAINT [PK_emp_egistration] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_emp_egistration_emp_egistration]') AND parent_object_id = OBJECT_ID(N'[dbo].[emp_registration]'))
ALTER TABLE [dbo].[emp_registration]  WITH CHECK ADD  CONSTRAINT [FK_emp_egistration_emp_egistration] FOREIGN KEY([lid])
REFERENCES [dbo].[ledgers] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[emp_registration] CHECK CONSTRAINT [FK_emp_egistration_emp_egistration]
