object FSyrie: TFSyrie
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088'/'#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1089#1099#1088#1100#1103' '#1085#1072' '#1087#1088#1077#1087#1072#1088#1072#1090#1072#1093
  ClientHeight = 465
  ClientWidth = 1019
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1019
    Height = 29
    ButtonHeight = 30
    ButtonWidth = 31
    Caption = 'ToolBar1'
    Images = ImageList1
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 0
      Width = 96
      Height = 30
      DataSource = DM1.DSNormSyr
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 2
    end
    object ToolButton5: TToolButton
      Left = 96
      Top = 0
      Action = FGlmenu_ogt.SprPrep
      ParentShowHint = False
      ShowHint = True
      OnMouseDown = ToolButton5MouseDown
    end
    object ToolButton6: TToolButton
      Left = 127
      Top = 0
      Action = FGlmenu_ogt.SprMat
      ParentShowHint = False
      ShowHint = True
      OnMouseDown = ToolButton6MouseDown
    end
    object btn_changeData: TToolButton
      Left = 158
      Top = 0
      Hint = #1047#1072#1084#1077#1085#1072' '#1082#1086#1076#1072' '#1089#1099#1088#1100#1103' '#1080'/'#1080#1083#1080' '#1085#1086#1088#1084#1099
      Caption = 'btn_changeData'
      ImageIndex = 9
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_changeDataClick
    end
    object btn_addMaterial: TToolButton
      Left = 189
      Top = 0
      Hint = #1042#1089#1090#1072#1074#1080#1090#1100' '#1089#1099#1088#1100#1077' '#1074' '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1077' '#1087#1088#1077#1087#1072#1088#1072#1090#1099
      Caption = 'btn_addMaterial'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_addMaterialClick
    end
    object btn_delMaterial: TToolButton
      Left = 220
      Top = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1099#1088#1100#1077' '#1080#1079' '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1093' '#1087#1088#1077#1087#1072#1088#1072#1090#1086#1074
      Caption = 'btn_delMaterial'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_delMaterialClick
    end
    object ToolButton3: TToolButton
      Left = 251
      Top = 0
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      Caption = 'ToolButton3'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton3Click
    end
    object ToolButton4: TToolButton
      Left = 282
      Top = 0
      Hint = #1055#1077#1095#1072#1090#1100
      Caption = 'ToolButton4'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton4Click
    end
    object Label1: TLabel
      Left = 313
      Top = 0
      Width = 54
      Height = 30
      Margins.Bottom = 0
      Caption = '   '#1052#1077#1089':'#1103#1094':  '
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object ComboBox1: TComboBox
      Left = 367
      Top = 4
      Width = 101
      Height = 21
      Align = alLeft
      Ctl3D = False
      DropDownCount = 12
      ParentCtl3D = False
      TabOrder = 1
      OnChange = ComboBox1Change
      Items.Strings = (
        ' '#1103#1085#1074#1072#1088#1100
        ' '#1092#1077#1074#1088#1072#1083#1100
        ' '#1084#1072#1088#1090
        ' '#1072#1087#1088#1077#1083#1100
        ' '#1084#1072#1081
        ' '#1080#1102#1085#1100
        ' '#1080#1102#1083#1100
        ' '#1072#1074#1075#1091#1089#1090
        ' '#1089#1077#1085#1090#1103#1073#1088#1100
        ' '#1086#1082#1090#1103#1073#1088#1100
        ' '#1085#1086#1103#1073#1088#1100
        ' '#1076#1077#1082#1072#1073#1088#1100)
    end
    object Label3: TLabel
      Left = 468
      Top = 0
      Width = 30
      Height = 30
      Margins.Bottom = 0
      Align = alLeft
      Caption = '  '#1043#1086#1076': '
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object SpinEdit2: TSpinEdit
      Left = 498
      Top = 0
      Width = 50
      Height = 30
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxValue = 2050
      MinValue = 1998
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Value = 1998
      OnChange = SpinEdit2Change
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 1019
    Height = 56
    Align = alTop
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
    object Label8: TLabel
      Left = 282
      Top = 10
      Width = 75
      Height = 13
      Margins.Bottom = 0
      Caption = #1057#1099#1088#1100#1077' '#1080#1083#1080' '#1087'/'#1092
    end
    object Label9: TLabel
      Left = 873
      Top = 9
      Width = 38
      Height = 13
      Margins.Bottom = 0
      Caption = #1061#1072#1088'-'#1082#1072':'
    end
    object Label10: TLabel
      Left = 269
      Top = 37
      Width = 27
      Height = 13
      Margins.Bottom = 0
      Caption = #1043#1086#1089#1090':'
    end
    object Label37: TLabel
      Left = 427
      Top = 37
      Width = 52
      Height = 13
      Margins.Bottom = 0
      Caption = #1055#1088'.'#1089#1099#1088#1100#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label39: TLabel
      Left = 627
      Top = 37
      Width = 40
      Height = 13
      Margins.Bottom = 0
      Caption = #1060#1080#1088#1084#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 450
      Top = 8
      Width = 423
      Height = 19
      Margins.Bottom = 0
      AutoSize = False
      Caption = 'Label19'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton2: TSpeedButton
      Left = 422
      Top = 7
      Width = 22
      Height = 22
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        96000000424D960000000000000076000000280000000A000000040000000100
        0400000000002000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
        000000FF00FF0000000000FF00FF00000000FFFFFFFFFF000000}
      Layout = blGlyphBottom
      ParentFont = False
      ParentShowHint = False
      ParentBiDiMode = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
    object Label4: TLabel
      Left = 917
      Top = 9
      Width = 35
      Height = 14
      Margins.Bottom = 0
      Caption = 'Label4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 302
      Top = 37
      Width = 35
      Height = 14
      Margins.Bottom = 0
      Caption = 'Label5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 485
      Top = 37
      Width = 35
      Height = 14
      Margins.Bottom = 0
      Caption = 'Label7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 667
      Top = 36
      Width = 42
      Height = 14
      Margins.Bottom = 0
      Caption = 'Label11'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label27: TLabel
      Left = 4
      Top = 10
      Width = 24
      Height = 13
      Margins.Bottom = 0
      Caption = #1062#1077#1093':'
    end
    object SpeedButton3: TSpeedButton
      Left = 230
      Top = 7
      Width = 22
      Height = 22
      Glyph.Data = {
        96000000424D960000000000000076000000280000000A000000040000000100
        0400000000002000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
        000000FF00FF0000000000FF00FF00000000FFFFFFFFFF000000}
      OnClick = SpeedButton3Click
    end
    object Label6: TLabel
      Left = 6
      Top = 34
      Width = 40
      Height = 13
      Margins.Bottom = 0
      Caption = #1056#1072#1079#1076#1077#1083':'
    end
    object SpeedButton6: TSpeedButton
      Left = 228
      Top = 33
      Width = 22
      Height = 21
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        96000000424D960000000000000076000000280000000A000000040000000100
        0400000000002000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
        000000FF00FF0000000000FF00FF00000000FFFFFFFFFF000000}
      Layout = blGlyphBottom
      ParentFont = False
      ParentShowHint = False
      ParentBiDiMode = False
      ShowHint = True
      OnClick = SpeedButton6Click
    end
    object Edit1: TEdit
      Left = 364
      Top = 7
      Width = 59
      Height = 22
      Color = clWhite
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnClick = Edit1Click
      OnKeyDown = Edit1KeyDown
    end
    object Edit4: TEdit
      Left = 48
      Top = 7
      Width = 57
      Height = 22
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnClick = Edit4Click
      OnKeyDown = Edit4KeyDown
    end
    object Edit5: TEdit
      Left = 104
      Top = 7
      Width = 125
      Height = 22
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
    object Edit10: TEdit
      Left = 48
      Top = 33
      Width = 29
      Height = 20
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      OnClick = Edit10Click
      OnKeyDown = Edit10KeyDown
    end
    object Edit11: TEdit
      Left = 75
      Top = 33
      Width = 154
      Height = 20
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 185
    Width = 1019
    Height = 280
    Align = alClient
    AutoFitColWidths = True
    DataSource = DM1.DSNormSyr
    DynProps = <>
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    IndicatorOptions = [gioShowRowIndicatorEh]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghRowHighlight, dghColumnResize, dghColumnMove]
    ParentFont = False
    STFilter.Visible = True
    TabOrder = 2
    TitleParams.MultiTitle = True
    TitleParams.RowHeight = 25
    OnEditButtonClick = DBGridEh1EditButtonClick
    OnSortMarkingChanged = DBGridEh1SortMarkingChanged
    Columns = <
      item
        Alignment = taCenter
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'VIB'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0'
          '2')
        Title.Caption = #1048#1079#1084'.'
        Width = 27
      end
      item
        Alignment = taCenter
        ButtonStyle = cbsEllipsis
        DynProps = <>
        EditButton.Style = ebsEllipsisEh
        EditButton.Visible = True
        EditButtons = <>
        FieldName = 'KOD_PROD'
        Footers = <>
        Title.Caption = #1050#1086#1076' '
        Title.TitleButton = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'NMAT'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1077#1087#1072#1088#1072#1090#1072
        Title.TitleButton = True
        Width = 230
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAM'
        Footers = <>
        Title.Caption = #1056#1077#1075#1080#1086#1085
        Width = 154
      end
      item
        DisplayFormat = '#####0.0000000'
        DynProps = <>
        EditButtons = <>
        FieldName = 'PLNORM'
        Footers = <>
        Title.Caption = #1055#1083#1072#1085#1086#1074#1072#1103' '#1085#1086#1088#1084#1072
        Title.TitleButton = True
        Width = 77
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'NEIS'
        Footers = <>
        Title.Caption = #1045#1076'. '#1080#1079#1084'.'
        Width = 40
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'KRAZ'
        Footers = <>
        Title.Caption = #1056#1072#1079'.'
        Title.TitleButton = True
        Width = 32
      end
      item
        Alignment = taCenter
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'PRPF'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        Title.Caption = #1055'/'#1092
        Width = 32
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'STNAME'
        Footers = <>
        PickList.Strings = (
          '1'
          '0')
        Title.Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1085#1086#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
        Title.TitleButton = True
        Width = 88
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'KSM_ID'
        Footers = <>
        Title.Caption = #1050#1086#1076' '#1089#1099#1088#1100#1103
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'NORM_ID'
        Footers = <>
        Visible = False
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'VIB1'
        Footers = <>
        Visible = False
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PLAN'
        Footers = <>
        Title.Caption = #1055#1083#1072#1085' '#1087#1088'-'#1074#1072
        Visible = False
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'POTREB'
        Footers = <>
        Title.Caption = #1055#1086#1090#1088#1077#1073'.'
        Visible = False
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 85
    Width = 1019
    Height = 100
    Align = alTop
    TabOrder = 3
    object Label12: TLabel
      Left = 4
      Top = 27
      Width = 82
      Height = 13
      Margins.Bottom = 0
      Caption = #1057#1099#1088#1100#1077' '#1080#1083#1080' '#1087'/'#1092' :'
    end
    object Label13: TLabel
      Left = 855
      Top = 27
      Width = 38
      Height = 13
      Margins.Bottom = 0
      Caption = #1061#1072#1088'-'#1082#1072':'
    end
    object Label14: TLabel
      Left = 295
      Top = 52
      Width = 27
      Height = 13
      Margins.Bottom = 0
      Caption = #1043#1086#1089#1090':'
    end
    object Label15: TLabel
      Left = 4
      Top = 73
      Width = 36
      Height = 13
      Margins.Bottom = 0
      Caption = #1045#1076'.'#1080#1079'.:'
    end
    object Label16: TLabel
      Left = 447
      Top = 54
      Width = 52
      Height = 13
      Margins.Bottom = 0
      Caption = #1055#1088'.'#1089#1099#1088#1100#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 693
      Top = 54
      Width = 40
      Height = 13
      Margins.Bottom = 0
      Caption = #1060#1080#1088#1084#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 186
      Top = 28
      Width = 663
      Height = 21
      Margins.Bottom = 0
      AutoSize = False
      Caption = 'Label18'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 147
      Top = 25
      Width = 22
      Height = 22
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        96000000424D960000000000000076000000280000000A000000040000000100
        0400000000002000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
        000000FF00FF0000000000FF00FF00000000FFFFFFFFFF000000}
      Layout = blGlyphBottom
      ParentFont = False
      ParentShowHint = False
      ParentBiDiMode = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object Label20: TLabel
      Left = 899
      Top = 27
      Width = 42
      Height = 14
      Margins.Bottom = 0
      Caption = 'Label20'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label21: TLabel
      Left = 328
      Top = 52
      Width = 42
      Height = 14
      Margins.Bottom = 0
      Caption = 'Label21'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 505
      Top = 54
      Width = 42
      Height = 14
      Margins.Bottom = 0
      Caption = 'Label24'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 739
      Top = 53
      Width = 42
      Height = 14
      Margins.Bottom = 0
      Caption = 'Label25'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label26: TLabel
      Left = 202
      Top = 76
      Width = 35
      Height = 13
      Margins.Bottom = 0
      Caption = #1053#1086#1088#1084#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label28: TLabel
      Left = 5
      Top = 51
      Width = 40
      Height = 13
      Margins.Bottom = 0
      Caption = #1056#1072#1079#1076#1077#1083':'
    end
    object SpeedButton4: TSpeedButton
      Left = 261
      Top = 49
      Width = 22
      Height = 21
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        96000000424D960000000000000076000000280000000A000000040000000100
        0400000000002000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
        000000FF00FF0000000000FF00FF00000000FFFFFFFFFF000000}
      Layout = blGlyphBottom
      ParentFont = False
      ParentShowHint = False
      ParentBiDiMode = False
      ShowHint = True
      OnClick = SpeedButton4Click
    end
    object SpeedButton5: TSpeedButton
      Left = 152
      Top = 73
      Width = 22
      Height = 19
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        96000000424D960000000000000076000000280000000A000000040000000100
        0400000000002000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
        000000FF00FF0000000000FF00FF00000000FFFFFFFFFF000000}
      Layout = blGlyphBottom
      ParentFont = False
      ParentShowHint = False
      ParentBiDiMode = False
      ShowHint = True
      OnClick = SpeedButton5Click
    end
    object Label22: TLabel
      Left = 231
      Top = 3
      Width = 369
      Height = 16
      Margins.Bottom = 0
      Caption = #1057#1099#1088#1100#1077' '#1080#1083#1080' '#1087#1086#1083#1091#1092#1072#1073#1088#1080#1082#1072#1090' '#1076#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1080#1083#1080' '#1079#1072#1084#1077#1085#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object edt_ksmId: TEdit
      Left = 92
      Top = 25
      Width = 54
      Height = 22
      Color = clWhite
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnClick = edt_ksmIdClick
      OnKeyDown = edt_ksmIdKeyDown
    end
    object edt_plNorm: TEdit
      Left = 243
      Top = 72
      Width = 100
      Height = 20
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnClick = edt_plNormClick
    end
    object RadioGroup2: TRadioGroup
      Left = 468
      Top = 70
      Width = 219
      Height = 29
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #1074#1099#1073#1088#1072#1090#1100' '
        #1074#1089#1077' '#1087#1088#1077#1087#1072#1088#1072#1090#1099)
      TabOrder = 2
      OnClick = RadioGroup2Click
    end
    object edt_kRaz: TEdit
      Left = 47
      Top = 50
      Width = 29
      Height = 20
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      OnClick = edt_kRazClick
      OnKeyDown = edt_kRazKeyDown
    end
    object cbx_isPf: TCheckBox
      Left = 355
      Top = 75
      Width = 89
      Height = 16
      Alignment = taLeftJustify
      Caption = #1055#1088#1080#1079#1085#1072#1082' '#1087'/'#1092':'
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      OnClick = cbx_isPfClick
    end
    object Edit7: TEdit
      Left = 74
      Top = 50
      Width = 188
      Height = 20
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
    end
    object edt_keiId: TEdit
      Left = 47
      Top = 72
      Width = 30
      Height = 20
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
      OnClick = edt_keiIdClick
      OnKeyDown = edt_keiIdKeyDown
    end
    object Edit9: TEdit
      Left = 76
      Top = 72
      Width = 76
      Height = 20
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
    end
    object planCB: TCheckBox
      Left = 707
      Top = 77
      Width = 278
      Height = 17
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1083#1072#1085' '#1087#1088#1086#1080#1079'-'#1074#1072' '#1080' '#1087#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100
      TabOrder = 8
      OnClick = planCBClick
    end
    object potrebCB: TCheckBox
      Left = 873
      Top = 77
      Width = 146
      Height = 17
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100
      TabOrder = 9
      Visible = False
      OnClick = potrebCBClick
    end
  end
  object ImageList1: TImageList
    Height = 24
    Width = 24
    Left = 512
    Top = 4
    Bitmap = {
      494C01010D000F00340018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000006000000001002000000000000090
      000000000000000000000000000000000000000000000000000000000000A87D
      7800B7818300B7818300B7818300B7818300B7818300B7818300B7818300B781
      8300B7818300B7818300B7818300B7818300B7818300B7818300B7818300B781
      8300B78183000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A87D
      7800F3E7D800F3E7D800F3E7D800F3E7D800F3E7D800F3E7D800F3E7D800F3E7
      D800F0E2CF00F0E2CF00F0E2CF00F0E2CF00F0E2CF00F0E2CF00F0E2CF00F0E2
      CF00B78183000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A87D
      7800F3E7D800F2E6D700FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000FDEF
      E000FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000F0E2CF00F0E2
      CF00B78183000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A87D
      7800F3E8DB00F3E7D900FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC
      9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00F0E2CF00F0E2
      CF00B78183000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A87D
      7800F4EADE00F4E9DC00F3E8DA00F3E7D900F2E6D700F2E5D500F1E4D400F1E4
      D200F0E3D000F0E2CF00F0E2CF00F0E2CF00F0E2CF00F0E2CF00F0E2CF00F0E2
      CF00B78183000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A87D
      7800F4EBE000F3E9DE00FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000FDEF
      E000FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000EFE1CE00EFE1
      CE00B78183000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A87D
      7800EDE5DB00EDE4DA00FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC
      9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00E8DAC800E8DA
      C800B78183000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B288
      7E00D9D3CB00D9D2C900D9D1C700D8D0C700D7CFC500D7CEC400D6CEC200D6CD
      C000D6CCBF00D6CBBE00D6CABC00D5C9BA00D5C8B900D4C7B800D4C7B700D4C7
      B700B78183000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A07A
      7100B5AFAA00B4AEA900B4ADA700B4ACA600B4ACA400B3ACA300B2ABA200B2AA
      A100B1A9A000B1A99E00B0A89D00B0A89C00B0A79A00B0A69A00B0A59900AFA4
      9800A47476000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A3522800A3522800A3522800A352
      2800A3522800A3522800A3522800A3522800A3522800A3522800A3522800A352
      2800A3522800A3522800A3522800A3522800A3522800A3522800A3522800A352
      2800A3522800A3522800A3522800A35228000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A35228000000000000000000BA8E
      8200E7E2DD00E7E2DB00E6E0DA00E6E0D900E5DED700E5DED500E5DDD400E5DB
      D200E4DBD100E3D9CF00E3D9CD00E2D9CC00E2D8CB00E1D6C900E1D6C700E1D5
      C600B78183000000000000000000A35228000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A35228000000000000000000BA8E
      8200DCD8D400DCD6D200D8754200D8754200D8754200D8754200D8754200D875
      4200D8754200D8754200D8754200D8754200D8754200D8754200D5CBBF00D5CA
      BD00B78183000000000000000000A35228000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A35228000000000000000000AE87
      7700B7B5B100B6B4B000F6CAB300F6CAB300F6CAB300F6CAB300F6CAB300F6CA
      B300F6CAB300F6CAB300F6CAB300F6CAB300F6CAB300F6CAB300B1AAA100B1A9
      9F00A47476000000000000000000A35228000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A3522800A3522800A3522800A352
      2800A3522800A3522800A3522800A3522800A3522800A3522800A3522800A352
      2800A3522800A3522800A3522800A3522800A3522800A3522800A3522800A352
      2800A3522800A3522800A3522800A35228000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C296
      8500FFFEFD00FFFEFD00FFFEFD00FFFEFD00FFFEFD00FBF7F300FBF7F300FAF5
      EF00FAF5EF00F8F1EB00F8F1EB00F7F1E900F7F1E900F6ECE200F6ECE200F6EC
      E200B78183000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CA9C
      8800FEFDFC00FDFCFA00FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000FDEF
      E000FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000F5ECE300F5EB
      E100B78183000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CEA0
      8900FFFFFF00FFFFFF00FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC
      9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00F6EFE600F6EE
      E500B78183000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D2A3
      8A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F1E900F7F0
      E700B78183000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D7A7
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFD00FEFCFA00FEFB
      F800FCF9F600FBF8F400FBF7F300FAF6F100FAF4EF00F9F3EE00F9F2EC00F7F1
      EA00B78183000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DAAB
      8D00FFFFFF00FFFFFF00FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000FDEF
      E000FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000F9F4EF00F9F3
      ED00B78183000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEAD
      8E00FFFFFF00FFFFFF00FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC
      9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00FAF6F100FAF5
      EF00B78183000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEAD
      8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFC00FEFCFA00FDFBF800FCF9F600FBF8F400FAF6
      F200B78183000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEAD
      8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00FEFDFB00FEFBF900FDFAF700FBF8
      F500B78183000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEAD
      8F00DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200DAA4
      8200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200DAA4
      8200AA807C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006600000066
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000726F6E003E454900675F
      6900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006600000A91
      1300006600000000000000000000000000009F6F60009F6F60009F6F60009F6F
      60009F6F60009F6F60009F6F60009F6F60009F6F60009F6F60009F6F60009F6F
      60009F6F60009F6F60009F6F60009F6F60009F6F60009F6F60009F6F60000000
      0000000000000000000000000000000000000000000091939500276AB4001660
      AC007F6F7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A97F7900B7818300B7818300B781
      8300B7818300B7818300B7818300B7818300B7818300B7818300B7818300B781
      8300B7818300B7818300B7818300B7818300B7818300B7818300B78183000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000066000000660000006600000066000017AB
      28000A91130000660000000000000000000093655F00F3DAB400F2D8B100F2D5
      AC00F2D5A900F2D3A600F0D1A300F0D09F00EFCE9C00EFCC9900EECA9600EEC9
      9300EEC79100EEC68E00EBC58B00EBC48900EBC28700EBC284009F6F60000000
      0000000000000000000000000000000000008C38160043739D0038A6FF00197B
      F400165DA4007A676C005E2D1C0056230D006B2B11007E321300863515008836
      1500883615008836150088361500893715008B3716008B3816008C3816008C38
      16008C3816008C3816008C3816008C381600A97F7A00F2DEC800F7E3CA00F5DF
      C200F1D9BA00ECD4B100E8CEA900E6CAA300E8CA9F00EBCB9C00EDCB9900EDCB
      9600EECC9700EECC9700EECC9700EECC9700EFCD9700EDCB9600B3897B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000006600004FD87A0042CE670033C1510024B5
      3B0017AA28000A911300006600000000000093655F00F4DCB800F3DAB500F3D8
      B100F3D8AF00F2D4AA00F0D3A700F0D1A300EFCFA000EFCE9D00EECC9900EECB
      9700EECA9500EDC99100EDC78F00EDC68C00EBC48900EDC287009F6F60000000
      0000000000000000000000000000000000008C381600BBD8F00041A7FB003AA4
      FF00187BF200175DA400837077008F766700752F0000C2A58600D8B58E00D9B4
      8A00D5AD8300D7AD8100DDB18200E9BB8900F3C29000FAC79300FCCA9500FECB
      9600FECB9600FECB9600FECB96008C381600A97F7A00F2E0CE00F7E6CE00F4E1
      C700EED8BD00E2CCAE00D5BFA000CFB89700D3B99600DCC09700E3C49700E8C7
      9500EAC99500EDCB9600EECC9700EECC9700EFCD9700EDCB9600B3897B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000066000058E087004FD97A0042CE670033C1
      510024B63B0017AA28000A9113000066000093655F00F6DEBD00F3DDBA00F3DA
      B600F3D9B200F2D8AF00F2D5AB00F2D4A700F0D1A500EFD0A100EFCF9E00EECE
      9A00EECB9800EECA9500EEC99100EEC78F00EDC68C00EDC58A009F6F60000000
      0000000000000000000000000000000000008C381600FFFBF400BAD7F00041A7
      FB003AA3FF00187AF000175DA10086737800783910009C877000AA917600A98E
      7000A3876900A4866600B18F6B00C7A07600E0B48400F0C18E00FAC79300FCCA
      9500FECB9600FECB9600FECB96008C381600A97F7A00F3E3D200F8E8D300F4E2
      CB00ECD9C0003837390058534E00A3927B00B19E8100BCA58500C8AF8900D4B7
      8D00DCBD8E00E6C59200EBCA9500EDCB9600EFCD9700EDCB9600B3897B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000066000058E0870058E0870050D87A0042CE
      670033C15100199D2900006600000000000093656000F6E1C100F4DEBF00F4DE
      BB00F4DAB600F3D9B200F2D8B000F2D7AB00F0D4A900F0D3A500EFD0A100F0CF
      9F00EECE9C00EECB9800EECB9500EDC99200EDC79000EDC68E009F6F60000000
      0000000000000000000000000000000000008C381600FFFCFA00FFFAF400B8D7
      F00041A7FB003AA3FF00187AF200165DA40078584D007E6F5F00816F5C007F6A
      57007D675300816854008C725800A9886600C7A07600DEB28300EEBF8C00F8C7
      9200FCCA9500FECB9600FECB96008C381600A97F7B00F4E6D800F9EBD900F7E6
      D200EFDEC60056524F00353537002C424C004D5E5F009B897100A4907400B29B
      7A00C3A88200D4B68900E2C28F00EAC99500EDCB9600EDCB9600B3897B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000066000000660000006600000066000050D9
      7A002EAF480000660000000000000000000095666000F6E3C600F6E1C200F4E0
      C000F3DDBB00F3DCB700F3D9B400F3D8B000F2D7AC00F0D5A900F2D3A500F0D1
      A300EFD09F00EFCE9D00EFCC9900EECB9600EECA9300EEC791009F6F60000000
      0000000000000000000000000000000000008C381600FFFFFF00FFFEFB00FFFB
      F600B4D4F20040A6FB0035A1FF002D7FDA004B4942006D5D55008F644A00A684
      7200A7887700A7887700AA867300A46F4A00AC5E0A00BF600000D46B0000ED78
      0000FA7F0000FE800000FE8000008C381600AA807B00F5E9DD00FBEFE000F8EA
      D900F4E3D000BEB1A100225569000C82AF00106A8E001A566D0054646300907E
      6700A08B6E00B79D7A00CBAE8300DCBD8C00E8C79200EAC99400B3897B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006600003DBB
      5E000066000000000000000000000000000098696300F7E6CB00F6E3C700D581
      2700D5812700D5812700D5812700D5812700D5812700D5812700D5812700D581
      2700D5812700D5812700D5812700D5812700EECB9700EECA93009F6F60000000
      0000000000000000000000000000000000008C381600FFFFFF00FFFFFF00AFAD
      AD00ADABA900A7CEEE0062B0ED00B8C6CE009F8A8400A3827300C2AB9000E5DA
      B600F7F4CC00F7F4CA00E5DAB500C1A79100A582740097786000AF8C6800D9AD
      8000F4C49000FCCA9500FCCA95008C381600AD837D00F5ECE300FBF2E600F9ED
      DE00F7E8D600F0E1CC002E5868000A84B1000D81AD002F6B8800424D5A005B4E
      520084705D0096836700AD957300C3A77D00D8B98800E3C29000B1877A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006600000066
      0000000000000000000000000000000000009E6E6400F8E7D000F7E6CC00F7E5
      C700F6E2C400F6E0C100F4DEBD00F4DCBA00F3DAB600F3D9B200F3D7AF00F2D5
      AB00F2D4A700F0D1A400EFD0A000EFCF9E00EFCC9A00EFCB97009F6F60000000
      0000000000000000000000000000000000008C381600FFFFFF00FFFFFF00FFFF
      FF00FEFCFB00F2EEEA00CCC9C200A6979200AF8C7B00E0C69A00FED9A400FEDC
      A900FEDCA900FEDCAA00FEDCAC00FEE2C200D9CBC200A07E70009A7E6000CEA6
      7A00F0C18E00FCCA9500FCCA95008C381600B2887E00F7EFE800FCF5EC00FAEF
      E400F9ECDD00F6E7D6008D9D9D000B749B004A6B7F00AA7B7B00BC888800AB78
      78007E5554007F6D5A008F7D6200A48D6C00BBA07800CEB08300AB8375000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000670
      A4001876A0001880AD000670A400000000000000000000000000000000000000
      000000000000000000000000000000000000A3726600F8EAD400F8E7D000F7E6
      CE00F7E5CA00F6E3C500F4E1C200F6DEBD00F4DDBA00F3DAB700F3D9B400F3D8
      AF00F2D5AC00F2D4A700F0D1A500EFD0A100EFCF9E00EFCE9A009F6F60000000
      0000000000000000000000000000000000008C381600FFFFFF00FFFFFF0033A4
      330033A33300F2F2F000CBC7C600A5837900C4A68800F7D19500FAE9B400FFFF
      CF00FFFFD000FFFFE000FFFFF000FFFFFC00FFFFFF00BA9F8A009C642700CC68
      0000F27A0000FE800000FE8000008C381600B68B8000F8F2EE00FDF8F100FAF3
      EA00F9EFE300F9ECDD00F4E5D500185B7400A3767600D8A4A400CA969600BC88
      8800AB7777007E5554007E6C580089785E009A866600AF9670009D786C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001388BB002D8D
      B0000D0D0E00070707001C4D61000D7EB1000000000000000000000000000000
      000000000000000000000000000000000000A7756800F8EBD900F8EAD400D581
      2700D5812700D5812700D5812700D5812700D5812700D5812700D5812700D581
      2700D5812700D5812700D5812700D5812700F0D1A100F0CF9F009F6F60000000
      0000000000000000000000000000000000008C381600FFFFFF00FFFFFF0033A4
      330033A33300F2F2F200CCC9C700AD8C7B00E2C59500EEB77B00F8E2AC00FFFF
      CF00FFFFD100FFFFE700FFFFFC00FFFFF700FFFFE100DED3AF00A0837000CEAA
      8300F0C49500FCCB9700FCCB97008C381600BA8E8200FAF6F400FEFCF800FCF6
      F000FAF2EA00FAF0E400F8ECDC0069868F00B0838300E5B1B100D7A3A300C995
      9500BB878700A7747400754E4D007C6B570084735B00948063008C6B61000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000670A40027ACDF0039CCFE005693
      9F00F2C49300806A54000000000029627A000000000000000000000000000000
      000000000000000000000000000000000000AC796900FAEEDD00F8EDD900F8EA
      D500F8E9D100F8E6CF00F7E6CB000081BD000081BD000081BD000081BD000081
      BD000081BD000081BD000081BD000081BD000081BD000081BD000081BD000081
      BD000081BD000081BD000081BD000081BD008C381600FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00F6F6F600D1C7C700A7887800F4D79A00EAAB6E00F8CA9300FEDA
      A600FEDCAA00FEDCAF00FEDCB500FEDCB200FEDCAC00F0EBC000A4867500D9B6
      9100F4CA9D00FCCF9D00FCCF9D008C381600BE928300FBF8F700FFFFFE00FEFA
      F600FCF5EF00FAF2EA00FAF0E300F7EADB00946B6A00E9B7B700E4B1B100D6A3
      A300C9959500BB878700A3727200754E4D007B6A570086745C007C5F56000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000976A900158CC00039CCFE0039CCFE005693
      9F00FFCD9900FFCD99004D413400161B1E002A84B10000000000000000000000
      000000000000000000000000000000000000B17E6B00FAF0E100FAEEDD00FAED
      DA00F8EBD700F8E9D300F8E7CF000081BD00C1FFFE00B2FFFE00A4FFFE0097FF
      FE008CFFFE0083FFFE0081FFFE0081FEFE0081FBFF0081F8FE0081F6FE0081F3
      FF0081F0FE0081EFFE0081EDFF000081BD008C381600FFFFFF00FFFFFF00AFAF
      AF00ADADAD00FAFAFA00E1D7D700A7887800F7DCA000EAA66900F7BF8800FBD1
      9D00FEDCA900FEDCAB00FEDCAB00FEDCAB00FEDCA900F8D49F00A7826800EB77
      0000FA7F0000FE800000FE8000008C381600C2968500FBF8F700FFFFFF00FFFE
      FC00FEF9F400FCF6EF00FBF3EA00FAEFE300E8D8CA00946B6A00E9B6B600E4B0
      B000D6A2A200C8949400BA868600A3717100754E4E00806D5900735951000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000669A001D99CC0039CCFE001D99CC003BCCFE0049CFFE0054A4
      BF00F2C49300FFCD9900AD8D6D00070707005C96B40000000000000000000052
      86002B86B30000669A000000000000000000B6816C00FBF2E500FBF0E200D581
      2700D5812700D5812700D58127000081BD00CCFFFF00BBFFFE00ACFFFE009EFF
      FE0092FFFE0088FFFE0081FFFE0081FEFE0081FCFE0081FAFE0081F7FE0081F4
      FF0081F2FF0081F0FF0081EEFE000081BD008C381600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00F4F2F200AF8E7E00E5CC9C00F4C98E00EEBB7E00F2C7
      8A00F8E3AD00FEFBC900FFFFCF00FFFFCF00FFFFCE00E1D3AC00B7988600F7D8
      B500FED8B100FED5AB00FED5AB008C381600C6998600FBF8F700FFFFFF00FFFF
      FF00FFFDFC00FEF9F500FCF6F000FAF2EA00FAF0E400E8D8CA008C636200E8B6
      B600E3B0B000D5A2A200C8949400BA868600A2717100785250006E564F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D7EB1002EB9EB0039CCFE003DCDFE002595C60073D9FF0093E1FF00AEE7
      FF00AC9C8600FFCD9900CDA7810007070700518EAD0000669A004499C200659E
      B700181C1E001C3541000E72A20000000000BB846E00FBF4E900FBF2E600FBF0
      E200FAEEDE00FAEDDC00F8EBD9000081BD00D4FFFF00C5FFFE00B5FFFE00A6FF
      FE008BE9E70080E7E60086FFFE0081FFFE0081FEFE0081FBFE0081FAFE0081F7
      FF0081F3FE0081F2FE0081EEFE000081BD008C381600FFFFFF00FFFFFF00537B
      FF00537BFF00FFFFFF00FEFEFE00BB9A9200C2A68A00FFFCE000FAE9CE00F0C2
      8900EEBA7E00F3CE9500F8E0AB00FBEBB700FFFFC700B89C8600D1B5A000FCE1
      C100FFDDBA00FFD9B200FFD9B2008C381600CA9C8800FBF8F700FFFFFF00FFFF
      FF00FFFFFF00FFFEFC00FEF9F500FCF6EF00FBF2EA00FAEFE300CAB5AB008C63
      6200E8B5B500E3AFAF00D5A1A100C7939300B9858500A2707000754F4E000000
      000000000000000000000000000000000000000000000000000000000000158C
      C00039CCFE0042CEFE005CD4FE007EDBFF00439CC600ABE2F900D0F1FF00E4F7
      FF00E8EFF300A6978600836A5100324D5A00368FBA0082D2F2007BDBFF005E8D
      99009D81640003030300112D3B0000669A00C0896F00FCF6ED00FBF4EA00FBF3
      E700FBF0E200FAEFE100FAEEDD000081BD00DDFFFF00CFFFFE00BFFFFE009FE9
      E70067A3A10083E2E1008AFFFE0082FFFE0081FFFE0081FCFE0081FAFE0081F8
      FF0081F4FF0081F3FF0081EFFE000081BD008C381600FFFFFF00FFFFFF00537B
      FF00537BFF00FFFFFF00FFFFFF00EAE0DE00A7816E00DDD0C600FFFFFF00FAE1
      B100EFB77800EEB47700F3C98B00FFE9A900D1B79600AB7F6000F3800600FF81
      0000FF810000FF810000FF8100008C381600CEA08900FCF9F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFC00FEF9F500FCF5EF00FBF2E900FAF0E300CAB5
      AB008C636200E7B5B500E2AFAF00D4A1A100C7939300B9858500A1707000764E
      4E0000000000000000000000000000000000000000000670A4001486B9004AD0
      FE0068D6FE0089DEFF00A6E5FF00C0EDFF00BDE1F200589DC000F5FCFF00F0FA
      FF00DDF5FF00BBE6F9005EA8CD000D96C30057C2EC0051D1FE003ECDFE005693
      9F00FFCD99006D5A4700030303000C5B8300C58C7000FCF7EF00FCF6ED00D581
      2700D5812700D5812700D58127000081BD00E6FFFF00D8FFFE00BBEEEE0078A6
      A50097E2E1009DFFFE0090FFFE0087FFFE0081FFFE0081FEFE0081FCFE0081F8
      FE0081F7FE0081F4FE0081F0FE000081BD008C381600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B15A1C00A7877B00BBA18E00E2CC
      A300F6DDA500F4DCA300DEC69A00BC9C8400AD8C7F00E3D0C200FFEFDD00FEEB
      D400FEE7CC00FFE2C400FFE2C4008C381600D2A38A00FCF9F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFDFC00FDFAF500FCF6EF00FAF2E900FAEF
      E200CBB5AB00A77B7B00F0BCBC00E2AEAE00D4A0A000C6929200986969005C63
      70004F6271000000000000000000000000000D78AB0034A9D9004EAFD90093E1
      FF00AFE8FF00C8EFFF00DEF5FF00EFFAFF00F5FCFF002F9DC4002D9CC40066B8
      D800459CC4000C89B7000173A50004ADD70030B9EB0039CCFE0039CCFE00319C
      BE00F2C49300CDA78100000000001C739A00CB917300FEF8F300FCF7F000FCF6
      EE00FCF4EB00FBF3E700FBF2E5000081BD00EEFFFF009DB2B1006E878700A5DA
      DA00B2FFFE00A5FFFF0097FFFE008CFFFE0083FFFE0081FEFE0081FCFE0081FB
      FE0081F8FF0081F6FE0081F3FE000081BD008C381600E3AF5D00E3AF5D00E3AF
      5D00E3AF5D00E3AF5D00E3AF5D00E3AF5D00BD4C0000D7A45F00AD836400A783
      7200A6867600A6867600AD887600BC916C00DCAA6000E3AF5D00E3AF5D00E3AF
      5D00E3AF5D00E3AF5D00E3AF5D008C381600D7A78C00FCF9F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FDF9F400FCF5EE00FCF5
      EB00EEDDD1009C6F6700A77B7B00EFBCBC00E1AEAE006E69720007A1D10000BC
      EF0000B9EC00009ED100000000000000000000669A0094DCF9003A8FBA00D0F1
      FF00E5F7FF00F3FBFF00F3FBFF00E4F7FF00CDF0FF0090D0EC001C9CC80003A0
      CC000392C00004ADD7000285B50004A9D30025B8E80039CCFE0039CCFE0039CC
      FE0087938600CDA7810000000000186D9400CF967400FEFAF700FCF8F400FCF7
      F000FCF7EF00FCF4EB00FBF3E9000081BD00F4FFFF0092A1A1000405050092B7
      B700BCFFFF00ADFFFF009FFFFE0092FFFE0088FFFE0081FFFE0081FEFE0081FC
      FE0081FAFE0081F7FF0081F4FE000081BD008C381600BB530B00CB5C0700CB5C
      0700CB5C0700CB5C0700CB5C0700CB5C0700CB5C0700CB5C0700CB5C0700CB5C
      0700CB5C0700CB5C0700CB5C0700FBAF6600E9872800DD6C0A00FBAF6600E987
      2800874F35003553C700BB530B008C381600DAAB8D00FCF9F800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFDFB00FDF9F400FFFB
      F300E3CEC600B3817600BC917100A67B7B00D0A0A0001594BD0000CCFF0000CC
      FF0000B9EC000130B10000009A000000000000669A00D7F3FF0084B8D3007BB1
      CD00F0FAFF00DCF4FF00C4EDFF00AAE6FF008EDFFF0070D8FF0050D1FE001DA2
      D4000475A8000397C400017CAD0004A4CF000A9FCD0039CCFE0039CCFE0039CC
      FE0039C3F2005580860007364A000670A400D4987500FFFCFA00FEFAF700FEFA
      F600FEF7F200FCF7EF00FCF4ED000081BD00FAFFFF00F0FFFE0090A1A1000000
      82000000820000008200A6FFFE0099FFFF008EFFFE0086FFFE0081FEFE0081FE
      FE0081FBFE0081F8FE0081F7FE000081BD008C381600B65C2200C5692700C569
      2700C5692700C5692700C5692700C5692700C5692700C5692700C5692700C569
      2700C5692700C5692700C5692700F3A96600D9782800C75B0A00FBAF6600D978
      2800874F35003553C700B65C22008C381600DEAD8E00FDFAF800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFDFC00FFFE
      F900E5D1CB00B3817600EFC48D00C79561008C62620000B3E60000CCFF0000A3
      DC000130B100041CB1000316AC0000009A0000669A008BBBD300D0E7F2002A81
      AD00247FAD0064B5D90061B9DF0064D5FE0048CFFE003BCCFE0039CCFE0039CC
      FE0035C6F8001D9DD0000690BF0003A0CC0004A4CF0017A7D60035C6F8001EAB
      DE001092C5000076AA000052860000000000D4987500FFFCFC00FEFCF800FEFB
      F700FEFAF600FCF8F200FEF7EF000081BD00FFFFFF00F6FFFF00EAFFFF00315E
      FF0000008200000082005176C500A0FFFE0095FFFE008AFFFE0082FFFE0081FE
      FE0081FCFE0081FBFE0081F7FE000081BD00000000008C3816008C3816008C38
      16008C3816008C3816008C3816008C3816008C3816008C3816008C3816008C38
      16008C3816008C3816008C3816008C3816008C3816008C3816008C3816008C38
      16008C3816008C3816008C38160000000000DEAD8E00FDFAF800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E5D4D000B3817600EFC38C00F3BA6C009364650000A9DC0000C2F5000443
      BA00113CE4000C36C8000732C2000316AC000000000000669A0000669A000000
      0000000000000B71A40027A1D20024A6D90024A6D90035C6F80039CCFE0039CC
      FE0039CCFE0039CCFE0035C6F80024A6D900006C9E000076A500005286000000
      000000000000000000000000000000000000D4987500FFFEFE00FFFCFC00FEFC
      FA00FEFBF800FEFAF600FEF8F3000081BD000081BD000081BD000081BD000000
      8200315EFF0000008200000000000081BD000081BD000081BD000081BD000081
      BD000081BD000081BD000081BD000081BD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEAD8E00FFFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E9DBD900B3817600F1C58B00B88285000000000000000000019CCF001A37
      CD00456AF8001E47D8000833C200020EA5000000000000000000000000000000
      00000000000000000000000000000C7CAF0027ACDF00158CC0001D99CC00179F
      D1001092C500057FB200006C9F00005286000000000000000000000000000000
      000000000000000000000000000000000000CF8E6800FFFEFE00FFFEFE00FEFC
      FC00FEFBFA00FEFCF800FEFBF600FEF8F400FCF7F000FCF6EE00FCF4EB00FCF3
      E900746FB7000F0F8E00746EB500FAEEDC00FAEBD800F8EAD4009F6F60000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DAA48200DAA48200DAA48200DAA4
      8200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200DAA4
      8200DAA48200B3817600B882850000000000000000000000000000000000293B
      CD006D8AFD002B53EA000515AC00000000000000000000000000000000000000
      0000000000000000000000000000000000000074A700037BAE00006598000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E68000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002538CC000E1BB80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004F1F1F004F1F1F004F1F1F004F1F
      1F004F1F1F004F1F1F004F1F1F004F1F1F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006030300060303000603030006030
      3000603030006030300060303000603030000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000993E3E00913233008C535400A7ADAC00C0C2C100C2BFBD00BDBFBD00B5B5
      B500915353007D2222008E353500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004F1F1F004F1F1F006020100080300F00903F00009F3F
      00009F3F0000903F000080300F00602F10004F1F1F004F1F1F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000060303000603030007F3F2F009F4F1F00AF501000B05F
      0F00B05F0F00AF5010009F4F1F007F4020006030300060303000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AC5B
      5500C24B4B00BB4344008E50510097787700CCAFAC00F8F0ED00FCFCFB00E5E5
      E3009E53520076111100A5383800A04141000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006020100050201F006F2F1000A0400000C04F0000C0500000C04F0000C04F
      0000C04F0000C04F0000C0500000C04F0000AF400000702F10004F1F1F004F1F
      1F00000000000000000000000000000000000000000000000000000000000000
      00007F3F2F006F302F0080402000B05F0F00D06F0000D06F0000D06F0000D06F
      0000D06F0000D06F0000D06F0000D06F0000BF5F0F008F4020006F3030006F30
      3000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AB5B
      5400C04B4B00B84645009357570080383800963E3E00D9C7C500FFFFFF00F8F4
      F300A558570076111100A43737009F404100000000009F4010009F4010009F40
      10009F4010009F4010009F4010009F4010009F4010009F4010009F4010009F40
      10009F4010009F4010009F4010009F4010009F4010009F4010009F4010009F40
      10009F4010009F4010009F401000000000000000000000000000000000006020
      100060201000903F0F00CF500000C04F0000BF4F0000BF4F0000BF4F0000BF4F
      0000BF4F0000BF4F0000BF4F0000BF4F0000C04F0000CF500000903F00005020
      1F004F1F1F000000000000000000000000000000000000000000000000007F3F
      2F007F3F2F00AF501000D06F0000D06F0000CF600000CF600000CF600000CF60
      0000CF600000CF600000CF600000CF600000D06F0000DF6F0000AF5010006F30
      2F006F3030000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AB5B
      5400C04A4B00B64444009D5F5F00863C3B0079131300A9908F00EBF6F300FFFF
      FF00AA5E5C00700E0E00A33636009F404100AF6F0000EFA04F00FFB06F00FFB0
      5F00FFAF5000FFAF4F00FFA04000FFA03F00FF9F3000FF9F2F00FF901F00FF90
      1F00FF8F1000FF8F0F00FF800000FF800000FF800000FF800000FF800000FF80
      0000FF800000FF800000E07000009F4010000000000000000000602010006F2F
      10009F3F0000CF500000BF4F0000BF4F0000C0500000CF6F2000C05F0F00BF40
      0000BF4F0000BF4F0000BF4F0000BF4F0000BF4F0000BF4F0000CF5000009F3F
      000050201F004F1F1F00000000000000000000000000000000007F3F2F008040
      2000AF501000D06F0000CF6F0000CF600000CF600000CF600000CF600000CF60
      0000CF600000CF600000CF600000CF600000CF600000CF600000DF6F0000AF50
      10006F3030006F30300000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AB5B
      5400C04B4B00B6424200A5606000A36D6B008E4747008B777800BDC0BC00F0E7
      E600AC5C5C0076111100A43737009F404100BF7F0F00FFBF7F00FFB06F00EFAF
      5F00BF804F00DF904F00FFA04000FFA03F00DF8F3000BF7F2F00DF802000FF90
      1F00FF901000FF8F0F00FF8F0F00FF800000FF800000FF800000FF800000FF80
      0000FF800000FF800000FF8000009F4010000000000000000000702F10009F3F
      0000C0500000BF4F0000BF4F0000BF400000C05F1000EFCFA000EFC09F00C05F
      1000BF400000BF4F0000BF4F0000BF4F0000BF4F0000BF4F0000BF4F0000CF50
      0000903F00004F1F1F00000000000000000000000000000000008F402000AF5F
      0F00D06F0000CF600000CF600000CF600000CF600000CF600000CF600000CF60
      0000CF600000CF600000CF600000CF600000CF600000CF600000CF600000DF6F
      0000AF5010006030300000000000000000000000000000000000000000000000
      0000000000000000000000000000993E3E00913233008C535400A7ADAC00AB5B
      5500C04B4C00BC464700B74A4B00BD5D5C00B85B5B00B0515100B2515100C25E
      5E00B7484800AC393900BA4747009D3E3F00C0801000FFBF7F00CF9F60001F1F
      20001F1F20001F1F200090603000CF8F3F001F1F20001F1F20001F1F2000BF70
      1F00FF901F002F2020001F1F20001F1F20001F1F20001F1F20001F1F20001F1F
      20002F201F00DF700000FF8000009F40100000000000602010008F300F00C04F
      0000BF4F0000BF4F0000BF4F0000BF400000C0500F00EFC09F00FFFFFF00F0D0
      BF00C06F2000BF400000BF4F0000BF4F0000BF4F0000BF4F0000BF4F0000BF4F
      0000CF500000702F10004F1F1F0000000000000000007F3F2F00A0501000D06F
      0000CF600000CF600000CF6F0F00CF600000CF600000CF600000CF600000CF60
      0000CF6F0000CF6F0F00CF600000CF600000CF600000CF600000CF600000CF60
      0000D06F00008F40200060303000000000000000000000000000000000000000
      00000000000000000000AC5B5500C24B4B00BB4344008E50510097787700AA59
      5300A53A3800AA4D4B00C0747300C7828200C9848300CA828100C6787700C479
      7A00C9888600CB878600C25656009C3B3C00CF801000FFBF8000FFBF7F00906F
      4F008060400080603F00EFA04F00EF9F400090603000805F2F0090602F00EF90
      2000FF901F00905F1F0080501F0080501000804F1000804F0F00804F0F00804F
      0F0090500F00FF800000FF8000009F4010000000000080300F00AF400000C04F
      0000BF4F0000C0500000C0500000BF4F0000C05F0F00EFC09F00FFFFFF00FFFF
      FF00F0DFC000CF702F00BF400000BF4F0000BF4F0000BF4F0000BF4F0000BF4F
      0000C04F0000A04000004F1F1F0000000000000000009F4F1F00BF600F00D06F
      0000CF6F0000CF6F0F00DF9F5000E0AF6F00CF6F0F00CF600000CF6F0000CF5F
      0000D07F2000E0AF6F00D0803F00CF5F0000CF600000CF600000CF600000CF60
      0000D06F0000BF5F0F0060303000000000000000000000000000000000000000
      00000000000000000000AB5B5400C04B4B00B84645009357570080383800A552
      4B00A74C4800E5D3D000F6F0F000F4EEED00F4EFED00F4EFED00F6EFEE00F6EE
      ED00FAF8F700E3D0CF00BA55550099373900CF801000FFBF8000FFBF8000DFA0
      6F00BF8F5F00CF905000FFAF5000FFAF4F00CF8F3F00BF7F3000CF802F00FF9F
      2F00FF902000C07F3F00AF6F4000C0702F00FF8F0000FF800000C06F1F00AF60
      2F00C06F1F00FF800000FF8000009F4010009F3F0000903F0F00C0500000C050
      0000C05F0F00C05F0F00C05F0F00C0500000CF601000EFC0A000FFFFFF00FFFF
      FF00FFFFFF00FFF0EF00DF905F00BF4F0000BF400000BF4F0000BF4F0000BF4F
      0000BF4F0000C04F0000602F10004F1F1F00AF5F0F00A0501000CF6F0F00D070
      1000D0701000D0701000EFB08000FFFFFF00EFB08000D0701F00CF6F0000CF60
      0000D07F2000FFEFDF00F0E0D000DF8F4F00CF5F0000CF600000CF600000CF60
      0000CF600000D06F00007F3F2000603030000000000000000000000000000000
      00000000000000000000AB5B5400C04A4B00B64444009D5F5F00863C3B00A551
      4A00AD545100F3EDEA00F4F2F200EDE6E500EEE7E600EEE7E600EEE7E600EDE6
      E500F4F4F300E5D0CF00B853530099373800CF8F1000FFBF8000CF9F6F001F1F
      20001F1F20001F1F2000906F4000BF8040001F1F20001F1F20001F1F2000AF70
      2F008F606F00001FFF00001FFF00001FFF00AF6F300070505F00001FFF00001F
      FF00001FFF00C06F1F00FF8000009F4010009F3F0000A0400F00CF5F0F00CF60
      1000CF601000CF601000CF6F1000CF601000CF6F1F00EFCFA000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E0AF7F00C0500F00BF400000BF4F0000BF4F
      0000BF4F0000C050000080300F004F1F1F00AF5F0F00B05F1000DF7F1000D07F
      2000D07F2000DF7F2000EFB08000FFFFFF00FFFFFF00F0CFAF00DF8F3000CF60
      0000D07F1F00F0DFC000FFFFFF00FFF0E000DFA06000CF600F00CF600000CF60
      0000CF600000D06F00009F4F1F00603030000000000000000000000000000000
      00000000000000000000AB5B5400C04B4B00B6424200A5606000A36D6B00A551
      4A00AF545100EFE6E300DCDADA00CBC7C600CECACA00CECACA00CECACA00CBC7
      C600D8DCDA00E2CCCB00BA54540099373800D08F1000FFBF8000FFBF80009F7F
      5F0080604F00906F4F00EFAF5F00FFB05F009F703F00805F30009F6F3000EF90
      3000EF9030008F606F00605080008F605F00FF8F0F00EF80100070505F00604F
      60008F5F4000FF800000FF8000009F4010009F3F0000B0500F00D06F1000D06F
      1F00D06F1F00D0702000D0702000D06F1F00D0702F00F0CFAF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFC09F00C0601F00BF4F0000BF4F
      0000BF4F0000C04F0000903F00004F1F1F00AF5F0F00C06F1F00DF802F00DF80
      3000DF803000DF8F3000EFBF8F00FFFFFF00FFFFFF00FFFFFF00F0E0CF00DF8F
      3F00D07F1F00F0DFC000FFFFFF00FFFFFF00FFFFFF00E0B08000CF6F0F00CF60
      0000CF600000D06F0000AF5010006030300000000000993E3E00913233008C53
      5400A7ADAC00C0C2C100AB5B5500C04B4C00BC464700B74A4B00BD5D5C00A551
      4A00AD535100F0E7E600E6E3E200D8D3D100DAD5D500DAD5D500DAD5D500D8D3
      D100E3E5E300E2CCCC00BA54530099373800D08F1000FFBF8000FFBF8000CF9F
      6F0090705000BF8F5F00FFB06F00FFB05F00BF804000805F3000C07F3F00FFA0
      3F00FF9F3000AF70500060508000AF704000FF8F1000FF8F0F00AF6F3000604F
      6000AF602F00FF800000FF8000009F4010009F3F0000BF5F1000DF7F2F00DF80
      3000DF7F2F00DF7F2F00DF7F2F00DF702000DF803000F0D0B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0DFC000C0601F00BF4F
      0000BF4F0000C04F00009F3F00004F1F1F00AF5F0F00CF702000E0904000E09F
      4F00E0903F00E0904000EFC09000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0E0
      D000E0AF7F00F0DFC000FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFCFA000D070
      2000CF600000D06F0000B05F0F0060303000AC5B5500C24B4B00BB4344008E50
      510097787700CCAFAC00AA595300A53A3800AA4D4B00C0747300C7828200A551
      4A00AF545100EFE6E600E0DDDC00CFCBCA00D1CFCE00D1CFCE00D1CFCE00CFCB
      CA00DDDEDD00E3CECB00BB55540099373800D08F1000FFBF8000C0906F001F1F
      20001F1F20001F1F200080604000BF8F50001F1F20001F1F20001F1F20009F6F
      30008F6F7F00001FFF00001FFF00001FFF00AF6F40008F5F5F00001FFF00001F
      FF00001FFF00AF602F00FF8000009F4010009F400000C0601F00E0904F00E09F
      5000E08F3F00E0803F00E08F3F00E0803000E08F4000F0D0B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFCFAF00C0601F00BF4F
      0000BF4F0000C04F00009F3F00004F1F1F00B05F0F00CF7F2F00EFAF6000EFAF
      7000E09F5000E09F4F00F0C09F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F0D0AF00F0E0CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF0EF00D080
      3000CF600000D06F0000B05F0F0060303000AB5B5400C04B4B00B84645009357
      570080383800963E3E00A5524B00A74C4800E5D3D000F6F0F000F4EEED00A551
      4A00AD535000F2E9E900F6F2F200EEE5E300EEE7E600EEE7E600EEE7E600EEE5
      E300F6F4F200E6D0CF00BA55540099383800DF901000FFBF8000FFBF8000CF9F
      6F0080604F00AF805F00FFBF7000FFB06F00AF7F4F00805F3F00AF7F3F00FFA0
      4000FFA03F009F706F0060508F00AF704F00FF901F00FF8F10009F604000604F
      6F00AF602F00FF800000FF8000009F4010009F3F0000C0601F00E09F5F00EFB0
      7F00E09F5000E0904000E0904F00E08F4000E0904F00F0DFBF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0A07000BF500F00BF400000BF4F
      0000BF4F0000C04F0000903F00004F1F1F00AF5F0F00CF7F2F00EFB07F00F0C0
      9000EFAF6F00EFA05F00F0CFA000FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFC0
      9F00E09F5000F0DFCF00FFFFFF00FFFFFF00FFFFFF00F0E0CF00DF8F4F00CF60
      0000CF600000D06F0000AF50100060303000AB5B5400C04A4B00B64444009D5F
      5F00863C3B0079131300A5514A00AD545100F3EDEA00F4F2F200EDE6E500EEE7
      E6009D4B4800C7C1C000CFCFCF00CCC6C600CCC7C700CCC7C700CCC7C700CCC6
      C600CFCFCF00C7B7B6009A48480000000000DF901000FFBF8000FFBF8000FFBF
      8000FFBF8000FFBF8000FFBF7F00FFBF7000FFB06000FFB05F00FFAF5000FFAF
      4F00FFA03F00FFA03000FF9F2F00FF9F2000FF901F00FF901000FF8F0F00FF8F
      0F00FF800000FF800000FF8000009F4010009F3F0000BF5F1000EFA06000F0C0
      9F00EFB07000EF9F5000EF9F5F00EF9F4F00EF9F5F00FFDFC000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF0EF00E0A06F00BF4F0000BF400000BF4F0000BF4F
      0000BF4F0000C050000080300F004F1F1F00AF5F0F00CF702000EFB07F00F0D0
      B000F0C08F00F0AF6F00F0D0AF00FFFFFF00FFFFFF00FFF0EF00F0CF9F00E090
      3F00E0904000F0E0CF00FFFFFF00FFFFFF00EFCFAF00D0803000CF5F0000CF60
      0000CF600000D06F00009F4F1F0060303000AB5B5400C04B4B00B6424200A560
      6000A36D6B008E474700A5514A00AF545100EFE6E300DCDADA00CBC7C600CECA
      CA00CECACA00CECACA00CBC7C600D8DCDA00E2CCCB00BA545400993738000000
      000000000000000000000000000000000000DF901000FFBF8000FFC08000FFCF
      9F00FFCF9F00FFCF9F00FFCF9F00FFCF9000FFCF9000FFC08000FFC07F00FFBF
      7000FFBF6F00FFB05F00FF9F3000FF9F2F00FF902000FF901F00FF8F1000FF8F
      0F00FF8F0000FF800000FF8000009F4010009F3F0000B04F0F00E09F5000F0CF
      A000FFD0AF00F0B07000F0AF6000F0A05F00F0A06000FFE0C000FFFFFF00FFFF
      FF00FFFFFF00FFE0D000DF905000C0500000BF4F0000BF4F0000BF4F0000BF4F
      0000BF4F0000C04F0000602F10004F1F1F00AF5F0F00C06F1000EFAF7000F0DF
      BF00FFDFBF00F0C08F00FFDFB000FFFFFF00FFEFE000F0C08F00EFA05000E090
      4000E09F5000FFEFDF00FFFFFF00EFC09000D0701F00CF5F0000CF600000CF60
      0000CF600000D06F00007F3F2F0060303000AB5B5500C04B4C00BC464700B74A
      4B00BD5D5C00B85B5B00A5514A00AD535100F0E7E600E6E3E200D8D3D100DAD5
      D500DAD5D500DAD5D500D8D3D100E3E5E300E2CCCC00BA545300993738000000
      000000000000000000000000000000000000E09F1000FFBF8000C0906F0070DF
      CF0070DFCF0070DFCF0070DFCF0070DFCF0070DFCF0070DFCF0070DFCF0070DF
      CF0070DFCF00D0DFBF00FFA03000DF8F2F00CF7F2000BF701F00BF701F00BF6F
      1000CF700F00FF800000FF8000009F40100000000000B0400000D07F3000F0C0
      9000FFE0CF00FFD0AF00FFBF8000FFB06F00F0AF6F00FFE0C000FFFFFF00FFFF
      FF00F0D0B000DF803F00CF600F00C05F0F00C0500000BF4F0000BF4F0000BF4F
      0000C04F0000A04000004F1F1F000000000000000000C0600000DF904F00FFD0
      AF00FFEFD000FFDFBF00FFE0C000FFF0E000FFC08F00F0AF6F00EFAF6000E09F
      4F00E0A06000F0DFC000EFBF8F00D0701F00CF600000CF600000CF600000CF60
      0000D06F0000BF5F0F006030300000000000AA595300A53A3800AA4D4B00C074
      7300C7828200C9848300A5514A00AF545100EFE6E600E0DDDC00CFCBCA00D1CF
      CE00D1CFCE00D1CFCE00CFCBCA00DDDEDD00E3CECB00BB555400993738000000
      000000000000000000000000000000000000E09F1000FFBF8000AF805F004FCF
      BF004FCFBF004FCFBF004FCFBF004FCFBF004FCFBF004FCFBF004FCFBF004FCF
      BF004FCFBF00D0DFBF00FFA03F00AF702F009F6F2F00905F20009F601F008050
      1F00BF6F1000FF8F0F00FF8000009F40100000000000903F0000BF5F0F00EFAF
      7000FFDFBF00FFEFD000FFD0AF00FFBF7F00F0B06F00FFE0D000FFFFFF00F0D0
      B000DF803F00D06F1F00CF601000C05F0F00C0500000BF4F0000BF4F0000BF4F
      0000CF5000006F2F10004F1F1F000000000000000000AF501000CF701F00F0C0
      8F00FFE0CF00FFEFE000FFE0C000FFD0A000F0BF7F00F0B07000EFAF6000E09F
      5000E09F5000E09F5F00DF802F00D0701000CF6F0F00CF600000CF600000CF60
      0000D06F0000804020006030300000000000A5524B00A74C4800E5D3D000F6F0
      F000F4EEED00F4EFED00A5514A00AD535000F2E9E900F6F2F200EEE5E300EEE7
      E600EEE7E600EEE7E600EEE5E300F6F4F200E6D0CF00BA555400993838000000
      000000000000000000000000000000000000E0900F00FFBF8000EFAF7000AF80
      5F00AF805F00AF805F00AF805F00AF805F00AF805000AF7F4F00AF7F4F00AF7F
      4000AF703F00EFA05F00FFA04000EF9F3000EF902F00FF9F2F00DF802000BF70
      1F00FF8F1000FF8F0F00FF8000009F4010000000000000000000B0400000CF70
      2F00FFC09000FFE0D000FFEFDF00FFD0AF00F0BF8000FFDFC000F0CFA000E08F
      3F00DF702000D0701F00CF601000C05F0F00C0500000BF4F0000BF4F0000CF50
      00008F3F0F004F1F1F0000000000000000000000000000000000C0600000DF8F
      4000FFD0AF00FFEFDF00FFF0E000FFDFBF00F0C09000F0B07000EFA06000E09F
      5000E0904000DF803000DF7F2000D0701F00CF6F0F00CF600000CF600000DF6F
      0000A0501000603030000000000000000000A5514A00AD545100F3EDEA00F4F2
      F200EDE6E500EEE7E600EEE7E6009D4B4800C7C1C000CFCFCF00CCC6C600CCC7
      C700CCC7C700CCC7C700CCC6C600CFCFCF00C7B7B6009A484800000000000000
      000000000000000000000000000000000000DF8F0000FFB06000FFBF8000FFBF
      8000FFBF8000FFBF8000FFBF8000FFBF8000FFBF8000FFBF7F00FFB06F00FFB0
      6000FFB05F00FFAF5000FFA04000FFA03F00FFA03000FF9F2F00FF9F2000FF90
      1F00FF901000FF8F0F00E07F0F00904F10000000000000000000903F0000B04F
      0000D07F3000F0C09000FFE0CF00FFEFDF00FFDFC000F0C09F00EFA06F00E08F
      4000DF803000D0702000CF6F2000CF6F1F00C0601000C0500000CF500000903F
      0F004F1F1F006F2F100000000000000000000000000000000000AF501000C060
      0F00DF904F00FFD0AF00FFEFDF00FFF0E000FFE0CF00F0CFA000EFBF7F00EFA0
      6000E09F4F00DF8F3F00DF8F3000D0802F00D07F2000D0701000DF6F0000A050
      10006F3030008F4020000000000000000000A5514A00AF545100EFE6E300DCDA
      DA00CBC7C600CECACA00CECACA00CECACA00CBC7C600D8DCDA00E2CCCB00BA54
      5400993738000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DF900000E09F2000EFA0
      3000EFA03000EFA03000E0A03000E09F3000E09F3000DF9F3000DF902F00DF90
      2F00DF8F2000DF8F2000D08F1F00D0801F00D0801000D07F1000CF7F1000CF70
      0F00CF700F00B0600F0090500F0000000000000000000000000000000000903F
      0000B04F0000CF702F00F0B07F00FFD0B000FFE0D000FFE0D000F0DFBF00EFC0
      A000EFBF8F00E0AF7000E0A06F00DF904F00D0702000CF5F0F00903F0F005020
      1F006F2F1000000000000000000000000000000000000000000000000000AF50
      1000C0600F00DF8F4000F0C09000FFDFC000FFEFDF00FFEFDF00FFE0CF00F0D0
      B000EFCF9F00EFBF8F00EFB08000E0A06F00DF8F3F00D0701000A05010006F3F
      2F008F402000000000000000000000000000A5514A00AD535100F0E7E600E6E3
      E200D8D3D100DAD5D500DAD5D500DAD5D500D8D3D100E3E5E300E2CCCC00BA54
      5300993738000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000903F0000AF400000BF5F1000D0804000EFAF7000F0C09000F0CFA000F0CF
      A000F0C09F00EFB08000E09F5F00D07F3000AF5010007F3010005F2010006F2F
      1000000000000000000000000000000000000000000000000000000000000000
      0000AF501000C0600000CF702000E09F5F00F0C08F00F0D0AF00F0DFBF00F0DF
      BF00F0D0B000EFC09F00EFB07000DF904F00C06F2000904F2000703F2F008F40
      200000000000000000000000000000000000A5514A00AF545100EFE6E600E0DD
      DC00CFCBCA00D1CFCE00D1CFCE00D1CFCE00CFCBCA00DDDEDD00E3CECB00BB55
      5400993738000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000903F0000AF400000AF501000BF602000C0703000CF7F
      3F00C0703F00BF6F2F00A0501F00803F10006F2F10006F2F1000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AF501000BF5F0F00BF6F2000CF803F00D08F5000D090
      5F00D0905000CF804000B06F30009F5020008F4020008F402000000000000000
      000000000000000000000000000000000000A5514A00AD535000F2E9E900F6F2
      F200EEE5E300EEE7E600EEE7E600EEE7E600EEE5E300F6F4F200E6D0CF00BA55
      5400993838000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000903F0000903F0000903F0000903F
      0F008F300F00903F0000903F0000903F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AF501000AF501000AF501000A050
      10009F4F1000AF501000AF501000AF5010000000000000000000000000000000
      000000000000000000000000000000000000000000009D4B4800C7C1C000CFCF
      CF00CCC6C600CCC7C700CCC7C700CCC7C700CCC6C600CFCFCF00C7B7B6009A48
      4800000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AF7F
      7F00B0808000B0808000B0808000B0808000B0808000B0808000B0808000B080
      8000B0808000B0808000B0808000B0808000B0808000B0808000B0808000B080
      8000B0808000B08080000000000000000000000000000000000000000000AF7F
      7F00B0808000B0808000B0808000B0808000B0808000B0808000B0808000B080
      8000B0808000B0808000B0808000B0808000B0808000B0808000B0808000B080
      8000B0808000B0808000000000000000000000000000AF5F5F00A04F4F00A06F
      6F00BFBFBF00CFD0CF00D0CFCF00CFCFCF00C0C0C000A06F6F00903F3F00A04F
      4F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AF7F
      7F00F0E0C000F0E0BF00F0DFBF00F0DFBF00F0DFB000F0DFB000F0DFB000F0D0
      AF00F0D0AF00F0D0AF00F0D0A000F0D0A000F0D0A000F0D09F00F0D09F00F0CF
      9F00F0CF9F00B08F7F000000000000000000000000000000000000000000AF7F
      7F00F0E0C000F0E0BF00F0DFBF00F0DFBF00F0DFB000F0DFB000F0DFB000F0D0
      AF00F0D0AF00F0D0AF00F0D0A000F0D0A000F0D0A000F0D09F00F0D09F00F0CF
      9F00F0CF9F00B08F7F000000000000000000BF707000D0606000CF5F5F00A06F
      6F00AF909000DFC0BF00FFF0F000FFFFFF00EFEFEF00B06F6F008F202000BF50
      5000B05F5F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AFAFAF00CFCFCF00B0AFAF00A09F
      9F000000000000000000AFAFAF00D0D0D000DFDFDF00C0BFBF00AFAFAF000000
      000000000000000000000000000000000000000000000000000000000000AF7F
      7F00F0E0C000F0E0C000F0E0BF00F0DFBF00F0DFBF00F0DFB000F0DFB000F0DF
      B000F0DFAF00F0D0AF00F0D0AF00F0D0A000F0D0A000F0D0A000F0D0A000F0D0
      9F00F0D09F00B08F7F000000000000000000000000000000000000000000AF7F
      7F00F0E0C000F0E0C000F0E0BF00F0DFBF00F0DFBF00F0DFB000F0DFB000F0DF
      B000F0DFAF00F0D0AF00F0D0AF00F0D0A000F0D0A000F0D0A000F0D0A000F0D0
      9F00F0D09F00B08F7F000000000000000000BF706F00CF606000CF606000AF70
      70009F505000AF5F5F00E0D0D000FFFFFF00FFF0F000BF7070008F202000B050
      5000B05F5F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AFAFAF00C0C0C000F0F0F000F0F0F000BFBFBF00B0AF
      AF005F5F5F00605F60008F808000AFAFAF00CFCFCF00E0E0E000E0E0E000D0D0
      D000B0B0B000000000000000000000000000000000000000000000000000AF7F
      7F00F0E0CF00F0E0C000009F0000009F0000F0DFBF00F0DFBF009F3000009F30
      00009F3000009F3000009F3000009F3000009F3000009F3000009F300000F0D0
      A000F0D09F00B08F7F000000000000000000000000000000000000000000AF7F
      7F00F0E0CF00F0E0C000009F0000009F0000F0DFBF00F0DFBF009F3000009F30
      00009F3000009F3000009F3000009F3000009F3000009F3000009F300000F0D0
      A000F0D09F00B08F7F000000000000000000BF706F00CF606000C05F5F00B07F
      7F009F50500090202000BFA0A000F0FFF000FFFFFF00BF7F70008F1F1F00B050
      5000B05F5F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AFAFAF00BFBFBF00EFEFEF00FFFFFF00FFFFFF00F0F0F000BFBFBF00B0B0
      B0004F4F4F002020200030303000404040006060600080808000AFAFAF00D0D0
      D000EFEFEF00DFDFDF00AFA0AF0000000000000000000000000000000000AF7F
      7F00F0E0CF00F0E0CF00009F0000009F0000F0E0C000F0DFBF00F0DFBF00F0DF
      B000F0DFB000F0DFB000F0DFB000F0DFAF00F0D0AF00F0D0AF00F0D0A000F0D0
      A000F0D0A000B08F7F000000000000000000000000000000000000000000AF7F
      7F00F0E0CF00F0E0CF00009F0000009F0000F0E0C000F0DFBF00F0DFBF00F0DF
      B000F0DFB000F0DFB000F0DFB000F0DFAF00F0D0AF00F0D0AF00F0D0A000F0D0
      A000F0D0A000B08F7F000000000000000000BF706F00CF606000C05F5F00BF7F
      7F00B0808000A0606000A0909000CFCFCF00F0EFEF00BF7070008F2020000070
      0F0000700F0000700F0000700F0000700F000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AFAF
      AF00E0DFDF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00B0B0B000B0B0
      B0009F909F006F6F6F004F4F4F00303030002F2F2F002F2F300040404000605F
      60008F8F8F00A0A0A00000000000000000000000000000000000000000007F5F
      5F00BFAF9F00BFAF9F00BFAF9000BFAF9000BFAF9000BFAF9000BFAF8F00BFA0
      8F00BFA08F00B0A08F00B0A08000B0A08000B0A08000B0A08000B0A07F00B09F
      7F00B09F7F0080605F0000000000000000000000000000000000000000007F5F
      5F00BFAF9F00BFAF9F00BFAF9000BFAF9000BFAF9000BFAF9000BFAF8F00BFA0
      8F00BFA08F00B0A08F00B0A08000B0A08000B0A08000B0A08000B0A07F00B09F
      7F00B09F7F0080605F000000000000000000BF707000CF606000CF606000C060
      6000CF7F7000CF707000C06F6F00C06F6F00D07F7F00C060600000700F000070
      0F000F8010000F901F000F901F000F9010000F7F0F0000700F00000000000000
      00000000000000000000000000000000000000000000A0A0A000D0CFCF00FFF0
      F000FFFFFF00F0F0F000F0F0F000EFEFEF00CFC0C000AFAFAF00A09F9F00A0A0
      A000AFAFAF00BFB0B000B0B0B0009F9F9F007F7F7F00505050003F3F3F002020
      2F0040404000A09F9F0000000000000000000000000000600000006000000060
      0000006000000060000000600000006000000060000000600000006000000060
      0000006000000060000000600000006000000060000000600000006000000060
      0000006000000060000000600000006000000000000000009F0000009F000000
      9F0000009F0000009F0000009F0000009F0000009F0000009F0000009F000000
      9F0000009F0000009F0000009F0000009F0000009F0000009F0000009F000000
      9F0000009F0000009F0000009F0000009F00BF706F00BF505000BF6F6000CF8F
      8F00D09F9F00D09F9F00D09F9F00D0909000D0909000D09F9F00D09F9F00D070
      7000B0505000000000000F8010000F9F1F000FA01F000F8F100000700F000000
      00000000000000000000000000000000000000000000A0A0A000F0F0F000F0F0
      F000F0F0F000E0E0E000C0BFBF00AFAFAF00BFB0B000D0D0D000B0B0B000AFA0
      A000A09FA0009F9F9F00A0A0A000AFAFAF00B0B0B000B0B0B000A0A0A0008080
      80006F6F6F00A0A0A0000000000000000000000000000060000000000000AF80
      7F00FFEFDF00FFEFD000FFEFD000FFEFCF00F0E0CF00F0E0CF00F0E0C000F0E0
      C000F0E0C000F0DFBF00F0DFBF00F0DFB000F0DFB000F0DFB000F0DFAF00F0D0
      AF00F0D0AF00B08F7F0000000000006000000000000000009F0000000000AF80
      7F00FFEFDF00FFEFD000FFEFD000FFEFCF00F0E0CF00F0E0CF00F0E0C000F0E0
      C000F0E0C000F0DFBF00F0DFBF00F0DFB000F0DFB000F0DFB000F0DFAF00F0D0
      AF00F0D0AF00B08F7F000000000000009F00BF6F6000BF606000EFDFDF00FFF0
      F000F0F0F000F0F0F000F0F0F000FFF0F000FFF0F000FFFFFF00EFDFDF00CF70
      7000AF505000000000000000000000700F000F9F1F000FAF1F000F8010000070
      0F000000000000000000000000000000000000000000A0A0A000E0E0E000DFDF
      DF00BFBFBF00AFA0A000BFBFBF00D0D0D000DFE0DF00E0E0E000EFE0E000DFD0
      D000CFC0C000BFBFBF00AFAFAF00A0A0A000A09F9F00A09F9F00A0A0A000B0AF
      AF00B0B0B000A0A0A0000000000000000000000000000060000000000000B08F
      7F00FFEFDF00FFEFDF000060000000600000FFEFD000F0E0CF00006000000060
      000000600000006000000060000000600000006000000060000000600000F0DF
      B000F0DFAF00B08F7F0000000000006000000000000000009F0000000000B08F
      7F00FFEFDF00FFEFDF0000009F0000009F00FFEFD000F0E0CF0000009F000000
      9F0000009F0000009F0000009F0000009F0000009F0000009F0000009F00F0DF
      B000F0DFAF00B08F7F000000000000009F00BF6F6000BF6F6F00F0F0EF00F0F0
      F000F0EFEF00F0EFEF00F0EFEF00F0EFEF00F0EFEF00F0F0F000EFDFDF00CF6F
      6F00AF505000B0808000B0808000B08080000F80100010AF20000F9F1F000070
      0F00B0808000B0808000B0808000B080800000000000A0A0A000B0B0B000AFA0
      A000BFBFBF00D0D0D000DFDFDF00DFDFDF00D0D0D000EFEFEF00FFF0F000F0F0
      F000F0F0F000E0E0E000DFDFDF00CFCFCF00C0BFBF00B0B0B000AFAFAF00A0A0
      A000A09F9F009F9F9F000000000000000000000000000060000000000000B08F
      8000FFF0E000FFEFDF000060000000600000FFEFD000FFEFD000F0E0CF00F0E0
      CF00F0E0CF00F0E0C000F0E0C000F0E0BF00F0DFBF00F0DFBF00F0DFB000F0DF
      B000F0DFB000B08F7F0000000000006000000000000000009F0000000000B08F
      8000FFF0E000FFEFDF0000009F0000009F00FFEFD000FFEFD000F0E0CF00F0E0
      CF00F0E0CF00F0E0C000F0E0C000F0E0BF00F0DFBF00F0DFBF00F0DFB000F0DF
      B000F0DFB000B08F7F000000000000009F00BF6F6000C06F6F00F0EFEF00E0E0
      E000D0D0D000DFD0D000DFD0D000DFD0D000D0D0D000E0E0E000EFDFD000CF6F
      6F00AF505000F0E0C000F0DFBF00F0DFB0000F700F001FAF2F0010AF20000070
      0F00F0CF9F00F0CF9F00F0D09F00B080800000000000A0A0A000BFBFBF00D0D0
      D000DFDFDF00D0D0D000D0D0D000D0D0D000E0E0E000F0F0F000C0C0C000C0BF
      C000D0CFD000E0E0E000EFEFEF00EFEFEF00E0E0E000DFDFDF00CFCFCF00C0C0
      C000BFBFBF00AFA0A00000000000000000000000000000600000000000008F6F
      6000BFB0AF00BFB0A000BFB0A000BFB0A000BFB0A000BFAFA000BFAF9F00BFAF
      9F00BFAF9F00BFAF9000BFAF9000BFAF9000BFAF9000BFA08F00BFA08F00B0A0
      8F00B0A0800080605F0000000000006000000000000000009F00000000008F6F
      6000BFB0AF00BFB0AF00BFB0A000BFB0A000BFB0A000BFAFA000BFAF9F00BFAF
      9F00BFAF9F00BFAF9000BFAF9000BFAF9000BFAF9000BFA08F00BFA08F00B0A0
      8F00B0A0800080605F000000000000009F00BF6F6000BF6F6F00F0EFEF00EFEF
      EF00E0DFDF00E0DFDF00E0DFDF00E0DFDF00E0DFDF00EFEFEF00EFDFDF00CF6F
      6F00AF505000F0E0CF00F0DFC000F0DFBF0000700F0020AF3F0020BF3F000070
      0F00EFCF9000EFCF9000F0D09F00B080800000000000A0A0A000D0D0D000DFDF
      DF00D0D0D000D0D0D000D0D0D000E0E0E000F0F0F000C0BFBF00AFB0AF0080C0
      8000B0B0B000AFAFAF00B0AFAF00BFBFBF00CFCFCF00DFD0D000DFDFDF00DFDF
      DF00DFDFDF00AFAFAF0000000000000000000000000000600000006000000060
      0000006000000060000000600000006000000060000000600000006000000060
      0000006000000060000000600000006000000060000000600000006000000060
      0000006000000060000000600000006000000000000000009F0000009F000000
      9F0000009F0000009F0000009F0000009F0000009F0000009F0000009F000000
      9F0000009F0000009F0000009F0000009F0000009F0000009F0000009F000000
      9F0000009F0000009F0000009F0000009F00BF6F6000C06F6F00F0EFEF00E0E0
      E000DFD0D000DFDFDF00DFDFDF00DFDFDF00DFD0D000E0E0E000EFDFD000CF70
      6F00AF50500000700F0000700F0000700F000F70100030BF4F002FC04F000070
      0F0000700F0000700F0000700F00B08080000000000000000000BFBFBF00DFDF
      DF00DFDFDF00DFDFDF00E0E0E000EFEFEF00B0B0B000BFBFBF00F0F0F000D0F0
      D000EFEFEF00E0E0E000FFC0AF00C0BFC000B0B0B000AFA0AF00AFAFAF00BFBF
      BF00BFBFBF00B0B0B0000000000000000000000000000000000000000000BF90
      8000E0E0D000DFDFCF00DFD0CF00E0DFCF00F0E0D000F0EFDF00FFEFDF00FFEF
      D000FFEFD000F0EFD000F0E0CF00F0E0CF00F0E0CF00F0E0C000F0E0C000F0E0
      BF00F0DFBF00B08F7F000000000000000000000000000000000000000000C090
      8000FFF0EF00FFF0E000FFF0E000FFF0E000FFF0DF00FFEFDF00FFEFDF00FFEF
      D000FFEFD000F0EFD000F0E0CF00F0E0CF00F0E0CF00F0E0C000F0E0C000F0E0
      BF00F0DFBF00B08F7F000000000000000000BF6F6000BF6F6F00F0EFEF00FFF0
      F000F0EFEF00F0EFEF00F0EFEF00F0EFEF00F0EFEF00FFF0F000EFDFDF00CF70
      6F00AF50500000700F0020AF300030AF50003FBF5F0040CF6F003FC05F002FBF
      4F0020AF300020AF300000700F00B0808000000000000000000000000000B0B0
      B000CFCFCF00D0D0D000C0C0C000AFAFAF00CFCFCF00F0F0F000F0F0F000F0F0
      F000EFEFEF00EFEFEF00EFEFEF00EFEFEF00E0E0E000DFDFDF00CFCFCF00AFAF
      AF00A0A0A000000000000000000000000000000000000000000000000000B08F
      7F00CFCFC000BFBFB00000700000007F0000E0DFCF00F0EFDF009F3000009F30
      00009F3000009F3000009F3000009F3000009F3000009F3000009F300000F0E0
      C000F0E0C000B08F7F000000000000000000000000000000000000000000C09F
      8000FFF0EF00FFF0EF00009F0000009F0000FFF0E000FFEFDF009F3000009F30
      00009F3000009F3000009F3000009F3000009F3000009F3000009F300000F0E0
      C000F0E0C000B08F7F00000000000000000000000000B0606000D0CFCF00DFDF
      DF00DFD0D000DFD0D000DFD0D000DFD0D000DFD0D000DFDFDF00D0C0C000AF60
      6000FFFFF000FFEFE00000700F002FAF4F005FEF900050DF80004FD06F0020AF
      300020AF3F0000700F00F0D09F00B08080000000000000000000000000000000
      000000000000A09F9F00BFBFBF00DFDFDF00CFCFCF00AFAFAF00CFCFCF00DFDF
      DF00E0E0E000EFE0E000E0E0E000E0E0E000E0E0E000E0E0E000C0C0C000BFB0
      BF00000000000000000000000000000000000000000000000000000000000060
      000000600000006000000060000000700000DFD0C000EFE0D000F0EFDF00FFEF
      DF00FFEFDF00FFEFDF00FFEFD000FFEFD000FFEFD000F0E0CF00F0E0CF00F0E0
      C000F0E0C000B08F7F000000000000000000000000000000000000000000C090
      8000F0F0EF00F0EFE0000090000000900000F0EFDF00F0EFDF00F0EFDF00FFEF
      DF00FFEFDF00FFEFDF00FFEFD000FFEFD000FFEFD000F0E0CF00F0E0CF00F0E0
      C000F0E0C000B08F7F0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BF8F
      8000FFFFFF00FFF0EF00FFEFE000006F000030AF50005FEF90005FE08F003FBF
      5F000F700F00F0D0AF00F0D0A000B08080000000000000000000000000000000
      000000000000B0AFB000F0F0F000F0F0F000E0DFDF00BFBFBF00BFBFBF00C0C0
      CF00D0D0DF00D0DFDF00DFDFDF00DFDFDF00C0C0C000AFAFAF00BFB0BF000000
      0000000000000000000000000000000000000000000000000000000000000060
      000010AF200010A01F0000600000AFAFA000CFC0BF00DFD0CF00E0DFD000F0EF
      DF00FFEFDF00FFEFDF00FFEFDF00FFEFD000FFEFD000FFEFD000FFE0CF00F0E0
      CF00F0E0CF00B08F7F000000000000000000000000000000000000000000B08F
      7F00DFDFD000DFDFD000DFDFD000DFD0CF00DFD0CF00DFD0CF00E0DFD000F0EF
      DF00FFEFDF00FFEFDF00FFEFDF00FFEFD000FFEFD000FFEFD000FFE0CF00F0E0
      CF00F0E0CF00B08F7F0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CF9F
      8000FFFFFF00FFFFF000FFF0EF00FFEFE00000700F003FBF60004FD07F001080
      1F00F0DFBF00F0DFB000F0DFAF00B08080000000000000000000000000000000
      00000000000000000000EFDFDF00FFEFE000FFE0DF00FFDFD000FFDFD000F0DF
      D000F0DFD000EFDFDF00E0E0DF00DFDFDF00CFC0CF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000060
      00001FB02F0010AF200000600000A09F9F00AFAFA000BFB0AF00CFC0BF00E0DF
      D000F0EFDF00FFF0E000FFEFDF00FFEFDF00FFEFDF00FFEFD000FFEFD000F0EF
      CF00F0E0CF00B08F7F0000000000000000000000000000000000000000009F70
      6000BFB0B000BFB0B000BFB0B000B0B0AF00B0B0AF00BFB0AF00CFC0BF00E0DF
      D000F0EFDF00FFF0E000FFEFDF00FFEFDF00FFEFDF00FFEFD000FFEFD000F0EF
      CF00F0E0CF00B08F7F0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CF9F
      8000FFFFFF00FFFFFF00FFFFF000FFF0EF00FFEFE0000F7F100010801F00F0E0
      CF00F0DFC000F0DFBF00FFDFB000B08080000000000000000000000000000000
      00000000000000000000E0C0C000FFE0DF00FFE0D000FFDFCF00FFD0C000FFCF
      BF00FFCFB000FFC0B000FFC0AF00EFD0CF000000000000000000000000000000
      0000000000000000000000000000000000000060000000600000006000000060
      000020BF3F001FB0300000600000006000000060000000600000BFBFB000DFDF
      CF00F0EFE000FFF0E000FFF0E000FFEFDF00FFEFDF00FFEFDF00FFEFD000FFEF
      D000FFEFCF00B08F7F00000000000000000000009F0000009F0000009F000000
      9F0000009F0000009F0000009F0000009F0000009F0000009F00BFBFB000DFDF
      CF00F0EFE000FFF0E000FFF0E000FFEFDF00FFEFDF00FFEFDF00FFEFD000FFEF
      D000FFEFCF00B08F7F0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DFAF
      8000FFFFFF00FFFFFF00FFFFFF00FFFFF000FFF0EF00FFEFE000FFEFDF00FFE0
      D000F0E0CF00F0E0C000F0DFB000B08080000000000000000000000000000000
      00000000000000000000E0C0C000FFEFE000FFE0D000FFDFCF00FFD0C000FFCF
      BF00FFCFBF00FFC0B000FFBFA000000000000000000000000000000000000000
      000000000000000000000000000000000000006000003FD0600030CF5F0030CF
      50002FC04F0020BF400020BF3F001FB0300010AF2F0000600000702000008F2F
      0000903000009F3000009F3000009F3000009F3000009F3000009F300000FFEF
      D000FFEFD000B08F7F00000000000000000000009F004F7FFF003F6FFF002F5F
      FF00104FFF00003FFF00002FFF000020E000001FD00000009F00702000008F2F
      0000903000009F3000009F3000009F3000009F3000009F3000009F300000FFEF
      D000FFEFD000B08F7F0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DFAF
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF000FFF0EF00FFEFE000FFEF
      DF00FFEFDF00E0DFC000C0BFAF00B08080000000000000000000000000000000
      00000000000000000000EFCFCF00FFEFE000FFE0D000FFDFCF00FFD0C000FFCF
      BF00FFCFBF00FFC0B000F0B0A000000000000000000000000000000000000000
      0000000000000000000000000000000000000060000040DF70003FDF6F003FD0
      600030CF5F002FC04F002FC0400020BF3F0020BF300000600000CFCFC000E0E0
      DF00F0F0E000FFF0EF00FFF0EF00FFF0E000FFF0E000FFF0E000FFEFDF00FFEF
      DF00FFEFD000B08F7F00000000000000000000009F004F7FFF004070FF003060
      FF002050FF000F40FF000030FF00002FF000001FDF0000009F00CFCFC000E0E0
      DF00F0F0E000FFF0EF00FFF0EF00FFF0E000FFF0E000FFF0E000FFEFDF00FFEF
      DF00FFEFD000B08F7F0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E0B0
      8F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF000FFF0EF00F0E0
      D000BF807F00BF807F00BF807F00B08080000000000000000000000000000000
      00000000000000000000EFCFCF00FFEFDF00FFE0D000FFDFCF00FFD0C000FFCF
      BF00FFCFBF00FFC0B000FFC0AF00000000000000000000000000000000000000
      0000000000000000000000000000000000000060000000600000006000000060
      00003FD060003FD05F0000600000006000000060000000600000E0E0E000F0EF
      EF00FFF0EF00FFF0EF00FFF0EF00FFF0EF00FFF0E000FFF0E000FFF0E000FFEF
      DF00FFEFDF00B08F7F00000000000000000000009F0000009F0000009F000000
      9F0000009F0000009F0000009F0000009F0000009F0000009F00E0E0E000F0EF
      EF00FFF0EF00FFF0EF00FFF0EF00FFF0EF00FFF0E000FFF0E000FFF0E000FFEF
      DF00FFEFDF00B08F7F0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E0B0
      8F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0CF
      CF00BF807F00EFB07000EFA04F00C0806F000000000000000000000000000000
      00000000000000000000EFCFCF00FFE0DF00FFE0D000FFDFCF00FFD0C000FFCF
      BF00FFCFBF00FFC0AF00FFC0AF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000060
      000040DF700040DF6F0000600000BFBFBF00DFDFDF00F0EFEF00FFF0F000FFFF
      F000FFFFF000FFFFF000FFF0EF00FFF0EF00FFF0EF00FFF0E000FFF0E000FFF0
      E000FFEFDF00B08F7F000000000000000000000000000000000000000000DFAF
      8F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF0F000FFFF
      F000FFFFF000FFFFF000FFF0EF00FFF0EF00FFF0EF00FFF0E000FFF0E000FFF0
      E000FFEFDF00B08F7F0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EFBF
      9000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0D0
      D000BF807F00FFC07000CF907000000000000000000000000000000000000000
      000000000000E0CFC000FFF0EF00FFE0DF00FFE0D000FFDFCF00FFD0C000FFD0
      BF00FFCFBF00FFC0AF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000060
      00004FE07F004FE07F0000600000B0806F00C0907000D0A07F00DFA08000DFA0
      8000DFA08000DFA08000DFA08000DFA08000DFA08000DFA08000DFA08000DFA0
      8000DFA08000DFA080000000000000000000000000000000000000000000DFA0
      8000DFA08000DFA08000DFA08000DFA08000DFA08000DFA08000DFA08000DFA0
      8000DFA08000DFA08000DFA08000DFA08000DFA08000DFA08000DFA08000DFA0
      8000DFA08000DFA0800000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EFBF
      9000FFF0F000FFF0F000FFF0F000FFF0F000FFF0F000FFF0F000FFF0F000E0D0
      CF00BF807F00CF9F800000000000000000000000000000000000000000000000
      000000000000EFCFCF00FFF0EF00FFEFE000FFE0DF00FFDFD000FFDFCF00FFD0
      C000F0BFB000FFC0AF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000060
      0000006000000060000000600000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EFBF
      9000DFAF8000DFAF8000DFAF8000DFAF8000DFAF8000DFAF8000DFAF8000DFAF
      8000BF807F000000000000000000000000000000000000000000000000000000
      0000DFB0B000EFCFCF00E0C0C000E0C0BF00E0C0BF00E0BFBF00E0BFB000E0B0
      AF00FFC0AF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000600000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF00E00007000000000000000000E0000700
      0000000000000000E00007000000000000000000E00007000000000000000000
      E00007000000000000000000E00007000000000000000000E000070000000000
      00000000E00007000000000000000000E0000700000000000000000000000000
      0000000000000000600006000000000000000000600006000000000000000000
      600006000000000000000000000000000000000000000000E000070000000000
      00000000E00007000000000000000000E00007000000000000000000E0000700
      0000000000000000E00007000000000000000000E00007000000000000000000
      E00007000000000000000000E00007000000000000000000E000070000000000
      00000000E00007000000000000000000FFFFCFFFFFFF8FFFFFFFFFFFFFFFC700
      001F87FFFF00001FFFFE0300001F00000000001FFFFE0100001F00000000001F
      FFFE0000001F00000000001FFFFE0100001F00000000001FFFFE0300001F0000
      0000001FFFFFC700001F00000000001FFFFFCF00001F00000000001FFFE1FF00
      001F00000000001FFFC0FF00001F00000000001FFF00FF00000000000000001F
      FE007F00000000000000001FF8006300000000000000001FF000010000000000
      0000001FE0000000000000000000000F80000000000000000000000700000000
      0000000000000003000000000000000000000001000000000000000000000000
      00000100000080000100000098001F000000FFFFFF0000C0FE00FF00001FFFFF
      FF0001E1FF1FFF00001FFFFFFFFFFFF3FFFFFFFF00FFFF00FFFFF001FFFFFFFC
      003FFC003FFFE000FFFFFFF0000FF0000FFFE000800001E00007E00007FFE000
      000000C00003C00003FFE000000000C00003C00003FE00000000008000018000
      01FC0000000000800001800001FC0000000000000000000000FC000000000000
      0000000000FC0000000000000000000000800000000000000000000000000000
      0000000000000000000000000000000000000000000000010000000000000000
      0000001F00000000000000000000001F00000080000180000100001F00000080
      000180000100001F000000C00003C0000300003F000000C00003C000030007FF
      800001E00007E000070007FFFFFFFFF0000FF0000F0007FFFFFFFFFC003FFC00
      3F0007FFFFFFFFFF00FFFF00FF800FFFE00003E00003800FFFFFFFFFE00003E0
      00030007FFFF0C1FE00003E000030007FFFC0007E00003E000030007FFF00001
      E00003E000030000FFE00003E00003E0000300003F8000038000008000000004
      1F800003A00002A0000200060F800003A00002A00002000000800003A00002A0
      0002000000800003A00002A00002000000800003800000800000000000C00003
      E00003E00003000000E00007E00003E00003800000F8000FE00003E00003FFE0
      00F8001FE00003E00003FFE000FC007FE00003E00003FFE000FC00FF00000300
      0003FFE000FC01FF000003000003FFE000FC01FF000003000003FFE000FC01FF
      000003000003FFE000FC01FFE00003E00003FFE001F803FFE00003E00003FFE0
      03F803FFE1FFFFFFFFFFFFE007F007FF00000000000000000000000000000000
      000000000000}
  end
  object FindDlgEh1: TFindDlgEh
    DBGrid = DBGridEh1
    ShowFindResult = False
    FindFont.Charset = DEFAULT_CHARSET
    FindFont.Color = clRed
    FindFont.Height = -11
    FindFont.Name = 'MS Sans Serif'
    FindFont.Style = [fsBold]
    ShowFilterPanel = True
    SimpleSeek = True
    Left = 512
    Top = 312
  end
  object Spis_Rashif: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '7.64.00 Standard Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 200
    Top = 320
    object Spis_Rashifkodp: TFloatField
      FieldName = 'kodp'
    end
    object Spis_RashifSTRUK_ID: TIntegerField
      FieldName = 'STRUK_ID'
    end
  end
end
