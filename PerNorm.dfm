object FPerNorm: TFPerNorm
  Left = 0
  Top = 0
  Caption = #1055#1077#1088#1077#1076#1072#1095#1072' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 420
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 104
    Top = 16
    Width = 425
    Height = 54
    Caption = #1047#1072#1076#1072#1081#1090#1077' '#1076#1072#1090#1091' '#1085#1086#1088#1084':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 141
      Top = 22
      Width = 24
      Height = 13
      Margins.Bottom = 0
      Caption = #1052#1077#1089':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 272
      Top = 22
      Width = 21
      Height = 13
      Margins.Bottom = 0
      Caption = #1043#1086#1076':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SpinEdit1: TSpinEdit
      Left = 171
      Top = 20
      Width = 42
      Height = 22
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxValue = 12
      MinValue = 1
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Value = 1
      OnChange = SpinEdit1Change
    end
    object SpinEdit2: TSpinEdit
      Left = 299
      Top = 20
      Width = 50
      Height = 22
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxValue = 2050
      MinValue = 1998
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      Value = 1998
      OnChange = SpinEdit2Change
    end
  end
  object Norm_ST: TTable
    DatabaseName = 'c_mascomn'
    DefaultIndex = False
    TableName = 'Norm.DBF'
    Left = 348
    Top = 166
    object Norm_STKODP: TFloatField
      FieldName = 'KODP'
    end
    object Norm_STKSM_ID: TFloatField
      FieldName = 'KSM_ID'
    end
    object Norm_STSTRUK_ID: TSmallintField
      FieldName = 'STRUK_ID'
    end
    object Norm_STKEI_ID: TSmallintField
      FieldName = 'KEI_ID'
    end
    object Norm_STPLNORM: TFloatField
      FieldName = 'PLNORM'
    end
    object Norm_STDATAV: TDateField
      FieldName = 'DATAV'
    end
    object Norm_STKRAZ: TSmallintField
      FieldName = 'KRAZ'
    end
    object Norm_STMES: TSmallintField
      FieldName = 'MES'
    end
    object Norm_STGOD: TSmallintField
      FieldName = 'GOD'
    end
    object Norm_STPRPF: TBooleanField
      FieldName = 'PRPF'
    end
    object Norm_STNAZPRPF: TStringField
      FieldName = 'NAZPRPF'
      Size = 3
    end
    object Norm_STPRKOR: TStringField
      FieldName = 'PRKOR'
      Size = 1
    end
    object Norm_STTIMEV: TStringField
      FieldName = 'TIMEV'
      Size = 8
    end
    object Norm_STNORM_ID: TFloatField
      FieldName = 'NORM_ID'
    end
    object Norm_STPR_OV: TBooleanField
      FieldName = 'PR_OV'
    end
  end
  object Rashif_st: TTable
    DatabaseName = 'mascomn'
    DefaultIndex = False
    TableName = 'RASHIF.DBF'
    Left = 348
    Top = 134
    object Rashif_stKODP: TFloatField
      FieldName = 'KODP'
    end
    object Rashif_stKSM_ID: TFloatField
      FieldName = 'KSM_ID'
    end
    object Rashif_stSTRUK_ID: TSmallintField
      FieldName = 'STRUK_ID'
    end
    object Rashif_stKEI_ID: TSmallintField
      FieldName = 'KEI_ID'
    end
    object Rashif_stPLNORM: TFloatField
      FieldName = 'PLNORM'
    end
    object Rashif_stDATEI: TDateField
      FieldName = 'DATEI'
    end
    object Rashif_stKRAZ: TSmallintField
      FieldName = 'KRAZ'
    end
    object Rashif_stMES: TSmallintField
      FieldName = 'MES'
    end
    object Rashif_stGOD: TSmallintField
      FieldName = 'GOD'
    end
  end
  object ITOGI_ST: TTable
    DatabaseName = 'mascomn'
    DefaultIndex = False
    TableName = 'ITOGI.DBF'
    Left = 388
    Top = 134
    object ITOGI_STKODP: TFloatField
      FieldName = 'KODP'
    end
    object ITOGI_STKRAZ: TSmallintField
      FieldName = 'KRAZ'
    end
    object ITOGI_STSUM: TFloatField
      FieldName = 'SUM'
    end
    object ITOGI_STSTRUK_ID: TSmallintField
      FieldName = 'STRUK_ID'
    end
    object ITOGI_STKEI_ID: TSmallintField
      FieldName = 'KEI_ID'
    end
    object ITOGI_STSUMNDS: TFloatField
      FieldName = 'SUMNDS'
    end
    object ITOGI_STDATEI: TDateField
      FieldName = 'DATEI'
    end
    object ITOGI_STMES: TSmallintField
      FieldName = 'MES'
    end
    object ITOGI_STGOD: TSmallintField
      FieldName = 'GOD'
    end
    object ITOGI_STPR: TStringField
      FieldName = 'PR'
      Size = 1
    end
    object ITOGI_STDATEC: TDateField
      FieldName = 'DATEC'
    end
  end
  object Cen_dbf: TTable
    DatabaseName = 'mascomc'
    TableName = 'cennik.dbf'
    Left = 432
    Top = 133
    object Cen_dbfKSM: TStringField
      FieldName = 'KSM'
      Size = 5
    end
    object Cen_dbfKSM_ID: TFloatField
      FieldName = 'KSM_ID'
    end
    object Cen_dbfACCOUNT: TStringField
      FieldName = 'ACCOUNT'
      Size = 5
    end
    object Cen_dbfCENA: TFloatField
      FieldName = 'CENA'
    end
    object Cen_dbfCEN_NDS: TFloatField
      FieldName = 'CEN_NDS'
    end
    object Cen_dbfKEI: TStringField
      FieldName = 'KEI'
      Size = 4
    end
    object Cen_dbfKEI_ID: TSmallintField
      FieldName = 'KEI_ID'
    end
    object Cen_dbfDATCEN: TDateField
      FieldName = 'DATCEN'
    end
    object Cen_dbfPRIZ: TStringField
      FieldName = 'PRIZ'
      Size = 1
    end
    object Cen_dbfMES: TSmallintField
      FieldName = 'MES'
    end
    object Cen_dbfSKLAD: TStringField
      FieldName = 'SKLAD'
      Size = 4
    end
    object Cen_dbfSTRUK_ID: TSmallintField
      FieldName = 'STRUK_ID'
    end
    object Cen_dbfKORR: TStringField
      FieldName = 'KORR'
      Size = 1
    end
    object Cen_dbfUSERNET: TStringField
      FieldName = 'USERNET'
      Size = 10
    end
    object Cen_dbfDAT_KOR: TDateField
      FieldName = 'DAT_KOR'
    end
  end
  object TPodpis: TTable
    DatabaseName = 'mascomn'
    TableName = 'PODPIS.DBF'
    Left = 472
    Top = 134
    object TPodpisPOLOG: TStringField
      FieldName = 'POLOG'
      Size = 4
    end
    object TPodpisDOLG: TStringField
      FieldName = 'DOLG'
      Size = 50
    end
    object TPodpisFIO: TStringField
      FieldName = 'FIO'
      Size = 50
    end
    object TPodpisREG_ID: TSmallintField
      FieldName = 'REG_ID'
    end
    object TPodpisSTRUK_ID: TSmallintField
      FieldName = 'STRUK_ID'
    end
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 88
    object INTARBASE1: TMenuItem
      Caption = #1048#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' INTERBASE'
      object NORMdbf1: TMenuItem
        Caption = 'NORM.dbf'
        OnClick = ToolButton1Click
      end
      object ITOGIdbf1: TMenuItem
        Caption = 'ITOGI.dbf'
        OnClick = ToolButton4Click
      end
      object CENNIKdbf1: TMenuItem
        Caption = 'CENNIK.dbf'
        OnClick = ToolButton5Click
      end
      object PODPISIdbf1: TMenuItem
        Caption = 'PODPISI.dbf'
        OnClick = ToolButton6Click
      end
      object Otxody1: TMenuItem
        Caption = 'OTXODY.dbf'
        OnClick = Otxody1Click
      end
      object ARXNORMdbf1: TMenuItem
        Caption = 'ARXNORM.dbf'
        OnClick = ARXNORMdbf1Click
      end
      object ARXRASHIFdbf1: TMenuItem
        Caption = 'ARXRASHIF.dbf'
        OnClick = ARXRASHIFdbf1Click
      end
    end
    object INTERBASE1: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1080#1079' INTERBASE'
      object NORMN1: TMenuItem
        Caption = #1055#1077#1088#1077#1076#1072#1095#1072' '#1085#1086#1088#1084' '#1076#1083#1103' '#1086#1090#1095#1077#1090#1086#1074
        OnClick = NORMN1Click
      end
      object N2: TMenuItem
        Caption = #1055#1077#1088#1077#1076#1072#1095#1072' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1074' ('#1088#1072#1079#1076#1077#1083#1099','#1077#1076'.'#1080#1079#1084'.,'#1082#1086#1077#1092#1092'.'#1077#1076'.'#1080#1079#1084','#1086#1090#1093#1086#1076#1099')'
        OnClick = N2Click
      end
    end
  end
  object normn: TRxIBQuery
    Database = DM1.BELMED
    Transaction = DM1.IBT_Read
    AutoCalcFields = False
    CachedUpdates = True
    SQL.Strings = (
      'SELECT * '
      ' FROM  normn '
      '')
    UpdateObject = IBUpdateSQLNormn
    GeneratorField.Field = 'NORM_ID'
    GeneratorField.Generator = 'G_NORMN'
    Macros = <>
    Left = 392
    Top = 168
    object normnTIP_OP_ID: TSmallintField
      FieldName = 'TIP_OP_ID'
      Origin = '"NORMN"."TIP_OP_ID"'
      Required = True
    end
    object normnKODP: TIntegerField
      FieldName = 'KODP'
      Origin = '"NORMN"."KODP"'
      Required = True
    end
    object normnKSM_ID: TIntegerField
      FieldName = 'KSM_ID'
      Origin = '"NORMN"."KSM_ID"'
      Required = True
    end
    object normnSTRUK_ID: TSmallintField
      FieldName = 'STRUK_ID'
      Origin = '"NORMN"."STRUK_ID"'
    end
    object normnKEI_ID: TSmallintField
      FieldName = 'KEI_ID'
      Origin = '"NORMN"."KEI_ID"'
    end
    object normnPLNORM: TFloatField
      FieldName = 'PLNORM'
      Origin = '"NORMN"."PLNORM"'
    end
    object normnKRAZ: TSmallintField
      FieldName = 'KRAZ'
      Origin = '"NORMN"."KRAZ"'
      Required = True
    end
    object normnMES: TSmallintField
      FieldName = 'MES'
      Origin = '"NORMN"."MES"'
      Required = True
    end
    object normnGOD: TSmallintField
      FieldName = 'GOD'
      Origin = '"NORMN"."GOD"'
      Required = True
    end
    object normnPRPF: TSmallintField
      FieldName = 'PRPF'
      Origin = '"NORMN"."PRPF"'
    end
    object normnNAZPRPF: TIBStringField
      FieldName = 'NAZPRPF'
      Origin = '"NORMN"."NAZPRPF"'
      FixedChar = True
      Size = 3
    end
    object normnNORM_ID: TIntegerField
      FieldName = 'NORM_ID'
      Origin = '"NORMN"."NORM_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object normnPR_OV: TSmallintField
      FieldName = 'PR_OV'
      Origin = '"NORMN"."PR_OV"'
    end
    object normnRAZDEL_ID: TSmallintField
      FieldName = 'RAZDEL_ID'
      Origin = '"NORMN"."RAZDEL_ID"'
    end
    object normnDATE_TIME_UPDATE: TDateTimeField
      FieldName = 'DATE_TIME_UPDATE'
      Origin = '"NORMN"."DATE_TIME_UPDATE"'
    end
    object normnUSER_NAME: TIBStringField
      FieldName = 'USER_NAME'
      Origin = '"NORMN"."USER_NAME"'
      FixedChar = True
      Size = 10
    end
    object normnDOC_ID: TIntegerField
      FieldName = 'DOC_ID'
      Origin = '"NORMN"."DOC_ID"'
    end
    object normnDATANORM: TDateField
      FieldName = 'DATANORM'
      Origin = '"NORMN"."DATANORM"'
      Required = True
    end
    object normnSPROD_ID: TIntegerField
      FieldName = 'SPROD_ID'
      Origin = '"NORMN"."SPROD_ID"'
    end
  end
  object IBUpdateSQLNormn: TIBUpdateSQLW
    RefreshSQL.Strings = (
      'Select * '
      ' from normn ')
    ModifySQL.Strings = (
      'update normn'
      'set'
      '  GOD = :GOD,'
      '  KEI_ID = :KEI_ID,'
      '  KODP = :KODP,'
      '  KRAZ = :KRAZ,'
      '  KSM_ID = :KSM_ID,'
      '  MES = :MES,'
      '  NORM_ID = :NORM_ID,'
      '  PLNORM = :PLNORM,'
      '  PR_OV = :PR_OV,'
      '  PRPF = :PRPF,'
      '  NAZPRPF = :NAZPRPF,'
      '  RAZDEL_ID = :RAZDEL_ID,'
      '  STRUK_ID = :STRUK_ID,'
      '  doc_id=:doc_id,'
      '  tip_op_id=:tip_op_id,'
      '  sprod_id=:sprod_id,'
      '  datanorm=:datanorm'
      'where'
      '  NORM_ID = :OLD_NORM_ID')
    InsertSQL.Strings = (
      'insert into normn'
      
        '  ( GOD, KEI_ID, KODP, KRAZ, KSM_ID, MES, NORM_ID, PLNORM, PR_OV' +
        ', '
      
        '    NAZPRPF, PRPF, RAZDEL_ID, STRUK_ID,doc_id,tip_op_id,datanorm' +
        ',sprod_id)'
      'values'
      
        '  ( :GOD, :KEI_ID, :KODP, :KRAZ, :KSM_ID, :MES, :NORM_ID, :PLNOR' +
        'M, '
      
        '   :PR_OV, :NAZPRPF,:PRPF, :RAZDEL_ID, :STRUK_ID,:doc_id,:tip_op' +
        '_id,:datanorm,:sprod_id)')
    DeleteSQL.Strings = (
      'delete from normn'
      'where'
      '  NORM_ID = :OLD_NORM_ID')
    AutoCommit = False
    UpdateTransaction = DM1.IBT_Write
    Left = 432
    Top = 168
  end
  object Normn_asy: TIBQuery
    Database = DM1.BELMED
    Transaction = DM1.IBT_Read
    SQL.Strings = (
      'SELECT *'
      'FROM norm_view(119,:god,:mes,0,0,0) norm')
    Left = 448
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'god'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'mes'
        ParamType = ptInput
      end>
    object Normn_asyKODP: TIntegerField
      FieldName = 'KODP'
      Origin = '"NORM_VIEW"."KODP"'
    end
    object Normn_asyDOC_ID: TIntegerField
      FieldName = 'DOC_ID'
      Origin = '"NORM_VIEW"."DOC_ID"'
    end
    object Normn_asyTIP_OP_ID: TSmallintField
      FieldName = 'TIP_OP_ID'
      Origin = '"NORM_VIEW"."TIP_OP_ID"'
    end
    object Normn_asyKSM_ID: TIntegerField
      FieldName = 'KSM_ID'
      Origin = '"NORM_VIEW"."KSM_ID"'
    end
    object Normn_asySTRUK_ID: TSmallintField
      FieldName = 'STRUK_ID'
      Origin = '"NORM_VIEW"."STRUK_ID"'
    end
    object Normn_asyKEI_ID: TSmallintField
      FieldName = 'KEI_ID'
      Origin = '"NORM_VIEW"."KEI_ID"'
    end
    object Normn_asyKRAZ: TSmallintField
      FieldName = 'KRAZ'
      Origin = '"NORM_VIEW"."KRAZ"'
    end
    object Normn_asyMES: TSmallintField
      FieldName = 'MES'
      Origin = '"NORM_VIEW"."MES"'
    end
    object Normn_asyGOD: TSmallintField
      FieldName = 'GOD'
      Origin = '"NORM_VIEW"."GOD"'
    end
    object Normn_asyPRPF: TSmallintField
      FieldName = 'PRPF'
      Origin = '"NORM_VIEW"."PRPF"'
    end
    object Normn_asyNORM_ID: TIntegerField
      FieldName = 'NORM_ID'
      Origin = '"NORM_VIEW"."NORM_ID"'
    end
    object Normn_asyRAZDEL_ID: TSmallintField
      FieldName = 'RAZDEL_ID'
      Origin = '"NORM_VIEW"."RAZDEL_ID"'
    end
    object Normn_asyPR_OV: TSmallintField
      FieldName = 'PR_OV'
      Origin = '"NORM_VIEW"."PR_OV"'
    end
    object Normn_asyNMAT_KSM: TIBStringField
      FieldName = 'NMAT_KSM'
      Origin = '"NORM_VIEW"."NMAT_KSM"'
      Size = 60
    end
    object Normn_asyKOD_PROD: TIBStringField
      FieldName = 'KOD_PROD'
      Origin = '"NORM_VIEW"."KOD_PROD"'
      FixedChar = True
      Size = 18
    end
    object Normn_asyNEIS: TIBStringField
      FieldName = 'NEIS'
      Origin = '"NORM_VIEW"."NEIS"'
      FixedChar = True
      Size = 10
    end
    object Normn_asyDATANORM: TDateField
      FieldName = 'DATANORM'
      Origin = '"NORM_VIEW"."DATANORM"'
    end
    object Normn_asyPLNORM: TFMTBCDField
      FieldName = 'PLNORM'
      Origin = '"NORM_VIEW"."PLNORM"'
      Precision = 18
      Size = 7
    end
    object Normn_asyXARKT: TIBStringField
      FieldName = 'XARKT'
      Origin = '"NORM_VIEW"."XARKT"'
      Size = 30
    end
    object Normn_asyNAZPRPF: TIBStringField
      FieldName = 'NAZPRPF'
      Origin = '"NORM_VIEW"."NAZPRPF"'
      FixedChar = True
      Size = 3
    end
    object Normn_asyKOD_PROD_KSM: TIBStringField
      FieldName = 'KOD_PROD_KSM'
      Origin = '"NORM_VIEW"."KOD_PROD_KSM"'
      FixedChar = True
      Size = 18
    end
    object Normn_asySTNAME: TIBStringField
      FieldName = 'STNAME'
      Origin = '"NORM_VIEW"."STNAME"'
      FixedChar = True
    end
    object Normn_asyNAM: TIBStringField
      FieldName = 'NAM'
      Origin = '"NORM_VIEW"."NAM"'
      FixedChar = True
    end
    object Normn_asyNAMSPSR: TIBStringField
      FieldName = 'NAMSPSR'
      Origin = '"NORM_VIEW"."NAMSPSR"'
      FixedChar = True
      Size = 30
    end
    object Normn_asyNAMORG: TIBStringField
      FieldName = 'NAMORG'
      Origin = '"NORM_VIEW"."NAMORG"'
      FixedChar = True
      Size = 50
    end
    object Normn_asyNMAT: TIBStringField
      FieldName = 'NMAT'
      Origin = '"NORM_VIEW"."NMAT"'
      FixedChar = True
      Size = 60
    end
    object Normn_asySPROD_ID: TIntegerField
      FieldName = 'SPROD_ID'
      Origin = '"NORM_VIEW"."SPROD_ID"'
    end
    object Normn_asyNEIS_PROD: TIBStringField
      FieldName = 'NEIS_PROD'
      Origin = '"NORM_VIEW"."NEIS_PROD"'
      FixedChar = True
      Size = 10
    end
    object Normn_asyGOST: TIBStringField
      FieldName = 'GOST'
      Origin = '"NORM_VIEW"."GOST"'
      Size = 30
    end
  end
  object Otx_imp: TRxIBQuery
    Database = DM1.BELMED
    Transaction = DM1.IBT_Read
    AutoCalcFields = False
    BeforeInsert = Otx_impBeforeInsert
    CachedUpdates = True
    SQL.Strings = (
      'SELECT *'
      '  FROM Norm_Otxody')
    UpdateObject = IBOtx_imp
    GeneratorField.Field = 'BAS_ID'
    GeneratorField.Generator = 'GEN_NORM_OTXODY'
    Macros = <>
    Left = 392
    Top = 264
    object Otx_impBAS_ID: TIntegerField
      FieldName = 'BAS_ID'
      Origin = '"OTXODY"."BAS_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Otx_impSTRUK_ID: TIntegerField
      FieldName = 'STRUK_ID'
      Origin = '"OTXODY"."STRUK_ID"'
    end
    object Otx_impKSM_IDO: TIntegerField
      FieldName = 'KSM_IDO'
      Origin = '"OTXODY"."KSM_IDO"'
    end
    object Otx_impRAZDEL_IDO: TSmallintField
      FieldName = 'RAZDEL_IDO'
      Origin = '"OTXODY"."RAZDEL_IDO"'
    end
    object Otx_impRAZDEL_IDOS: TSmallintField
      FieldName = 'RAZDEL_IDOS'
      Origin = '"OTXODY"."RAZDEL_IDOS"'
    end
    object Otx_impKSM_IDOS: TIntegerField
      FieldName = 'KSM_IDOS'
      Origin = '"OTXODY"."KSM_IDOS"'
    end
    object Otx_impKEI_IDO: TSmallintField
      FieldName = 'KEI_IDO'
      Origin = '"OTXODY"."KEI_IDO"'
    end
    object Otx_impKEI_IDOS: TSmallintField
      FieldName = 'KEI_IDOS'
      Origin = '"OTXODY"."KEI_IDOS"'
    end
    object Otx_impDATEVV: TDateField
      FieldName = 'DATEVV'
      Origin = '"OTXODY"."DATEVV"'
    end
    object Otx_impKODP_O: TIntegerField
      FieldName = 'KODP_O'
      Origin = '"OTXODY"."KODP_O"'
    end
    object Otx_impKODP_OS: TIntegerField
      FieldName = 'KODP_OS'
      Origin = '"OTXODY"."KODP_OS"'
    end
    object Otx_impKODST_O: TIBStringField
      FieldName = 'KODST_O'
      Origin = '"OTXODY"."KODST_O"'
      FixedChar = True
      Size = 6
    end
    object Otx_impKODST_OS: TIBStringField
      FieldName = 'KODST_OS'
      Origin = '"OTXODY"."KODST_OS"'
      FixedChar = True
      Size = 6
    end
    object Otx_impSPROD_IDO: TIntegerField
      FieldName = 'SPROD_IDO'
      Origin = '"OTXODY"."SPROD_IDO"'
    end
    object Otx_impSPROD_IDOS: TIntegerField
      FieldName = 'SPROD_IDOS'
      Origin = '"OTXODY"."SPROD_IDOS"'
    end
  end
  object IBOtx_imp: TIBUpdateSQLW
    RefreshSQL.Strings = (
      'Select * '
      'from Norm_Otxody ')
    ModifySQL.Strings = (
      'update Norm_Otxody'
      'set'
      '  BAS_ID = :BAS_ID,'
      '  DATEVV = :DATEVV,'
      '  KEI_IDO = :KEI_IDO,'
      '  KEI_IDOS = :KEI_IDOS,'
      '  KODP_O = :KODP_O,'
      '  KODP_OS = :KODP_OS,'
      '  KODST_O = :KODST_O,'
      '  KODST_OS = :KODST_OS,'
      '  KSM_IDO = :KSM_IDO,'
      '  KSM_IDOS = :KSM_IDOS,'
      '  RAZDEL_IDO = :RAZDEL_IDO,'
      '  RAZDEL_IDOS = :RAZDEL_IDOS,'
      '  STRUK_ID = :STRUK_ID,'
      ' sprod_idos =:sprod_idos,'
      ' sprod_ido= :sprod_ido'
      'where'
      '  BAS_ID = :OLD_BAS_ID')
    InsertSQL.Strings = (
      'insert into Norm_Otxody'
      
        '  (BAS_ID, DATEVV, KEI_IDO, KEI_IDOS, KODP_O, KODP_OS, KODST_O, ' +
        'KODST_OS, '
      
        '   KSM_IDO, KSM_IDOS, RAZDEL_IDO, RAZDEL_IDOS, STRUK_ID,sprod_id' +
        'o,sprod_idos)'
      'values'
      
        '  (:BAS_ID, :DATEVV, :KEI_IDO, :KEI_IDOS, :KODP_O, :KODP_OS, :KO' +
        'DST_O, '
      
        '   :KODST_OS, :KSM_IDO, :KSM_IDOS, :RAZDEL_IDO, :RAZDEL_IDOS, :S' +
        'TRUK_ID,:sprod_ido,:sprod_idos)')
    DeleteSQL.Strings = (
      'delete from Norm_Otxody'
      'where'
      '  BAS_ID = :OLD_BAS_ID')
    AutoCommit = False
    UpdateTransaction = DM1.IBT_Write
    Left = 432
    Top = 264
  end
  object DSotxody: TDataSource
    DataSet = IBArhRashi
    Left = 496
    Top = 256
  end
  object Arxnorm: TTable
    DatabaseName = 'c_mascomn'
    DefaultIndex = False
    TableName = 'ARXNORM.DBF'
    Left = 348
    Top = 198
    object ArxnormKODP: TFloatField
      FieldName = 'KODP'
    end
    object ArxnormKSM_ID: TFloatField
      FieldName = 'KSM_ID'
    end
    object ArxnormSTRUK_ID: TSmallintField
      FieldName = 'STRUK_ID'
    end
    object ArxnormKEI_ID: TSmallintField
      FieldName = 'KEI_ID'
    end
    object ArxnormPLNORM: TFloatField
      FieldName = 'PLNORM'
    end
    object ArxnormDATAV: TDateField
      FieldName = 'DATAV'
    end
    object ArxnormKRAZ: TSmallintField
      FieldName = 'KRAZ'
    end
    object ArxnormMES: TSmallintField
      FieldName = 'MES'
    end
    object ArxnormGOD: TSmallintField
      FieldName = 'GOD'
    end
    object ArxnormPRPF: TBooleanField
      FieldName = 'PRPF'
    end
    object ArxnormNAZPRPF: TStringField
      FieldName = 'NAZPRPF'
      Size = 3
    end
    object ArxnormPRKOR: TStringField
      FieldName = 'PRKOR'
      Size = 1
    end
    object ArxnormTIMEV: TStringField
      FieldName = 'TIMEV'
      Size = 8
    end
    object ArxnormNORM_ID: TFloatField
      FieldName = 'NORM_ID'
    end
    object ArxnormPR_OV: TBooleanField
      FieldName = 'PR_OV'
    end
  end
  object ArhRashi: TTable
    DatabaseName = 'c_mascomn'
    DefaultIndex = False
    TableName = 'ARHRASHI.DBF'
    Left = 348
    Top = 238
    object ArhRashiKODP: TFloatField
      FieldName = 'KODP'
    end
    object ArhRashiKSM_ID: TFloatField
      FieldName = 'KSM_ID'
    end
    object ArhRashiSTRUK_ID: TSmallintField
      FieldName = 'STRUK_ID'
    end
    object ArhRashiKEI_ID: TSmallintField
      FieldName = 'KEI_ID'
    end
    object ArhRashiPLNORM: TFloatField
      FieldName = 'PLNORM'
    end
    object ArhRashiDATEI: TDateField
      FieldName = 'DATEI'
    end
    object ArhRashiKRAZ: TSmallintField
      FieldName = 'KRAZ'
    end
    object ArhRashiMES: TSmallintField
      FieldName = 'MES'
    end
    object ArhRashiGOD: TSmallintField
      FieldName = 'GOD'
    end
  end
  object IBArxNorm: TRxIBQuery
    Database = DM1.BELMED
    Transaction = DM1.IBT_Read
    AutoCalcFields = False
    CachedUpdates = True
    SQL.Strings = (
      'SELECT * '
      ' FROM  arxnorm '
      'where god>2007')
    Macros = <>
    Left = 392
    Top = 200
    object IBArxNormKODP: TIntegerField
      FieldName = 'KODP'
      Origin = '"ARXNORM"."KODP"'
    end
    object IBArxNormKSM_ID: TIntegerField
      FieldName = 'KSM_ID'
      Origin = '"ARXNORM"."KSM_ID"'
    end
    object IBArxNormSTRUK_ID: TIntegerField
      FieldName = 'STRUK_ID'
      Origin = '"ARXNORM"."STRUK_ID"'
    end
    object IBArxNormKEI_ID: TIntegerField
      FieldName = 'KEI_ID'
      Origin = '"ARXNORM"."KEI_ID"'
    end
    object IBArxNormPLNORM: TFloatField
      FieldName = 'PLNORM'
      Origin = '"ARXNORM"."PLNORM"'
    end
    object IBArxNormDATAV: TDateField
      FieldName = 'DATAV'
      Origin = '"ARXNORM"."DATAV"'
    end
    object IBArxNormKRAZ: TSmallintField
      FieldName = 'KRAZ'
      Origin = '"ARXNORM"."KRAZ"'
    end
    object IBArxNormMES: TSmallintField
      FieldName = 'MES'
      Origin = '"ARXNORM"."MES"'
    end
    object IBArxNormGOD: TSmallintField
      FieldName = 'GOD'
      Origin = '"ARXNORM"."GOD"'
    end
    object IBArxNormPRPF: TSmallintField
      FieldName = 'PRPF'
      Origin = '"ARXNORM"."PRPF"'
    end
    object IBArxNormNAZPRPF: TIBStringField
      FieldName = 'NAZPRPF'
      Origin = '"ARXNORM"."NAZPRPF"'
      FixedChar = True
      Size = 3
    end
    object IBArxNormPRKOR: TIBStringField
      FieldName = 'PRKOR'
      Origin = '"ARXNORM"."PRKOR"'
      FixedChar = True
      Size = 1
    end
    object IBArxNormTIMEV: TIBStringField
      FieldName = 'TIMEV'
      Origin = '"ARXNORM"."TIMEV"'
      FixedChar = True
      Size = 8
    end
    object IBArxNormNORM_ID: TIntegerField
      FieldName = 'NORM_ID'
      Origin = '"ARXNORM"."NORM_ID"'
    end
    object IBArxNormPR_OV: TSmallintField
      FieldName = 'PR_OV'
      Origin = '"ARXNORM"."PR_OV"'
    end
  end
  object IBUpdateArxnorm: TIBUpdateSQLW
    RefreshSQL.Strings = (
      'Select '
      '  KODP,'
      '  KSM_ID,'
      '  STRUK_ID,'
      '  KEI_ID,'
      '  PLNORM,'
      '  DATAV,'
      '  KRAZ,'
      '  MES,'
      '  GOD,'
      '  PRPF,'
      '  NAZPRPF,'
      '  PRKOR,'
      '  TIMEV,'
      '  NORM_ID,'
      '  PR_OV'
      'from arxnorm '
      'where'
      '  NORM_ID = :NORM_ID')
    ModifySQL.Strings = (
      'update arxnorm'
      'set'
      '  DATAV = :DATAV,'
      '  GOD = :GOD,'
      '  KEI_ID = :KEI_ID,'
      '  KODP = :KODP,'
      '  KRAZ = :KRAZ,'
      '  KSM_ID = :KSM_ID,'
      '  MES = :MES,'
      '  NAZPRPF = :NAZPRPF,'
      '  NORM_ID = :NORM_ID,'
      '  PLNORM = :PLNORM,'
      '  PR_OV = :PR_OV,'
      '  PRKOR = :PRKOR,'
      '  PRPF = :PRPF,'
      '  STRUK_ID = :STRUK_ID,'
      '  TIMEV = :TIMEV'
      'where'
      '  NORM_ID = :OLD_NORM_ID')
    InsertSQL.Strings = (
      'insert into arxnorm'
      
        '  (DATAV, GOD, KEI_ID, KODP, KRAZ, KSM_ID, MES, NAZPRPF, NORM_ID' +
        ', PLNORM, '
      '   PR_OV, PRKOR, PRPF, STRUK_ID, TIMEV)'
      'values'
      
        '  (:DATAV, :GOD, :KEI_ID, :KODP, :KRAZ, :KSM_ID, :MES, :NAZPRPF,' +
        ' :NORM_ID, '
      '   :PLNORM, :PR_OV, :PRKOR, :PRPF, :STRUK_ID, :TIMEV)')
    DeleteSQL.Strings = (
      'delete from arxnorm'
      'where'
      '  NORM_ID = :OLD_NORM_ID')
    AutoCommit = False
    UpdateTransaction = DM1.IBT_Write
    Left = 432
    Top = 200
  end
  object IBArhRashi: TRxIBQuery
    Database = DM1.BELMED
    Transaction = DM1.IBT_Read
    AutoCalcFields = False
    BeforeInsert = IBArhRashiBeforeInsert
    CachedUpdates = True
    SQL.Strings = (
      'SELECT * '
      ' FROM Arhrashi '
      '')
    Macros = <>
    Left = 392
    Top = 232
    object IBArhRashiKODP: TIntegerField
      FieldName = 'KODP'
      Origin = '"ARHRASHI"."KODP"'
    end
    object IBArhRashiKSM_ID: TIntegerField
      FieldName = 'KSM_ID'
      Origin = '"ARHRASHI"."KSM_ID"'
    end
    object IBArhRashiSTRUK_ID: TIntegerField
      FieldName = 'STRUK_ID'
      Origin = '"ARHRASHI"."STRUK_ID"'
    end
    object IBArhRashiKEI_ID: TIntegerField
      FieldName = 'KEI_ID'
      Origin = '"ARHRASHI"."KEI_ID"'
    end
    object IBArhRashiPLNORM: TFloatField
      FieldName = 'PLNORM'
      Origin = '"ARHRASHI"."PLNORM"'
    end
    object IBArhRashiDATEI: TDateField
      FieldName = 'DATEI'
      Origin = '"ARHRASHI"."DATEI"'
    end
    object IBArhRashiKRAZ: TSmallintField
      FieldName = 'KRAZ'
      Origin = '"ARHRASHI"."KRAZ"'
    end
    object IBArhRashiMES: TSmallintField
      FieldName = 'MES'
      Origin = '"ARHRASHI"."MES"'
    end
    object IBArhRashiGOD: TSmallintField
      FieldName = 'GOD'
      Origin = '"ARHRASHI"."GOD"'
    end
    object IBArhRashiNORM_ID: TIntegerField
      FieldName = 'NORM_ID'
      Origin = '"ARHRASHI"."NORM_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object IBUpdateArhrashi: TIBUpdateSQLW
    RefreshSQL.Strings = (
      'Select '
      '  KODP,'
      '  KSM_ID,'
      '  STRUK_ID,'
      '  KEI_ID,'
      '  PLNORM,'
      '  DATEI,'
      '  KRAZ,'
      '  MES,'
      '  GOD,'
      '  NORM_ID'
      'from Arhrashi '
      'where'
      '  NORM_ID = :NORM_ID')
    ModifySQL.Strings = (
      'update Arhrashi'
      'set'
      '  DATEI = :DATEI,'
      '  GOD = :GOD,'
      '  KEI_ID = :KEI_ID,'
      '  KODP = :KODP,'
      '  KRAZ = :KRAZ,'
      '  KSM_ID = :KSM_ID,'
      '  MES = :MES,'
      '  NORM_ID = :NORM_ID,'
      '  PLNORM = :PLNORM,'
      '  STRUK_ID = :STRUK_ID'
      'where'
      '  NORM_ID = :OLD_NORM_ID')
    InsertSQL.Strings = (
      'insert into Arhrashi'
      
        '  (DATEI, GOD, KEI_ID, KODP, KRAZ, KSM_ID, MES, NORM_ID, PLNORM,' +
        ' STRUK_ID)'
      'values'
      
        '  (:DATEI, :GOD, :KEI_ID, :KODP, :KRAZ, :KSM_ID, :MES, :NORM_ID,' +
        ' :PLNORM, '
      '   :STRUK_ID)')
    DeleteSQL.Strings = (
      'delete from Arhrashi'
      'where'
      '  NORM_ID = :OLD_NORM_ID')
    AutoCommit = False
    UpdateTransaction = DM1.IBT_Write
    Left = 432
    Top = 232
  end
  object IBQuery1: TIBQuery
    Database = DM1.BELMED
    Transaction = DM1.IBT_Read
    SQL.Strings = (
      ''
      ''
      ''
      '')
    Left = 520
    Top = 72
  end
  object IBPodpis: TIBQuery
    Database = DM1.BELMED
    Transaction = DM1.IBT_Read
    SQL.Strings = (
      'SELECT *'
      'FROM podpis')
    Left = 184
    Top = 144
    object IBPodpisPODPIS_ID: TIntegerField
      FieldName = 'PODPIS_ID'
      Origin = '"PODPIS"."PODPIS_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBPodpisPOLOG: TSmallintField
      FieldName = 'POLOG'
      Origin = '"PODPIS"."POLOG"'
    end
    object IBPodpisDOLG: TIBStringField
      FieldName = 'DOLG'
      Origin = '"PODPIS"."DOLG"'
      FixedChar = True
      Size = 50
    end
    object IBPodpisFIO: TIBStringField
      FieldName = 'FIO'
      Origin = '"PODPIS"."FIO"'
      FixedChar = True
      Size = 50
    end
    object IBPodpisTIP_OP_ID: TSmallintField
      FieldName = 'TIP_OP_ID'
      Origin = '"PODPIS"."TIP_OP_ID"'
    end
    object IBPodpisSTRUK_ID: TSmallintField
      FieldName = 'STRUK_ID'
      Origin = '"PODPIS"."STRUK_ID"'
    end
    object IBPodpisTIP_DOK_ID: TSmallintField
      FieldName = 'TIP_DOK_ID'
      Origin = '"PODPIS"."TIP_DOK_ID"'
    end
  end
end
