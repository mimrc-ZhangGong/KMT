object DlgUserList: TDlgUserList
  Left = 324
  Top = 286
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #29992#25143#21450#26435#38480#35774#32622
  ClientHeight = 246
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 16
    Top = 16
    Width = 353
    Height = 217
    DataSource = dsUser
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Code_'
        Title.Alignment = taCenter
        Title.Caption = #24080#21495
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name_'
        Title.Alignment = taCenter
        Title.Caption = #22995#21517
        Width = 65
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Level_'
        Title.Alignment = taCenter
        Title.Caption = #26435#38480
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Remark_'
        Title.Alignment = taCenter
        Title.Caption = #22791#27880
        Width = 125
        Visible = True
      end>
  end
  object BitBtn3: TBitBtn
    Left = 384
    Top = 14
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn4: TBitBtn
    Left = 384
    Top = 46
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object cdsUser: TZjhDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspSQL'
    OnNewRecord = cdsUserNewRecord
    Left = 40
    Top = 48
    object cdsUserCode_: TStringField
      FieldName = 'Code_'
      Size = 10
    end
    object cdsUserName_: TStringField
      FieldName = 'Name_'
      Size = 10
    end
    object cdsUserPassword_: TStringField
      FieldName = 'Password_'
    end
    object cdsUserLevel_: TIntegerField
      FieldName = 'Level_'
      OnGetText = cdsUserLevel_GetText
      OnSetText = cdsUserLevel_SetText
    end
    object cdsUserRemark_: TStringField
      FieldName = 'Remark_'
      Size = 80
    end
  end
  object dsUser: TDataSource
    DataSet = cdsUser
    Left = 40
    Top = 80
  end
end
