object FRashifCols: TFRashifCols
  Left = 0
  Top = 0
  Caption = 'FRashifCols'
  ClientHeight = 506
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 370
    Height = 506
    Align = alClient
    AutoFitColWidths = True
    DataSource = DSRashifCols
    DynProps = <>
    FooterParams.Color = clWindow
    IndicatorOptions = [gioShowRowIndicatorEh]
    TabOrder = 0
    OnMouseUp = DBGridEh1MouseUp
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'VISIBLE'
        Footers = <>
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object DSRashifCols: TDataSource
    DataSet = mem_rashifCols
    Left = 72
    Top = 112
  end
  object mem_rashifCols: TkbmMemTable
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
    Left = 88
    Top = 64
    object mem_rashifColsNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object mem_rashifColsVISIBLE: TBooleanField
      FieldName = 'VISIBLE'
    end
  end
end
