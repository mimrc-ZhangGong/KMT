object DlgDisableFile: TDlgDisableFile
  Left = 278
  Top = 328
  BorderStyle = bsDialog
  Caption = #35774#32622#25490#38500#30446#24405'&'#25991#20214
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
  object rbFile: TRadioButton
    Left = 16
    Top = 155
    Width = 73
    Height = 17
    Caption = #25490#38500#25991#20214
    Checked = True
    TabOrder = 0
    TabStop = True
  end
  object rbDir: TRadioButton
    Left = 16
    Top = 179
    Width = 73
    Height = 17
    Caption = #25490#38500#30446#24405
    TabOrder = 1
  end
  object edtFileName: TEdit
    Left = 96
    Top = 152
    Width = 241
    Height = 21
    TabOrder = 2
    OnChange = edtFileNameChange
  end
  object edtDirName: TEdit
    Left = 96
    Top = 176
    Width = 241
    Height = 21
    TabOrder = 3
    OnChange = edtDirNameChange
  end
  object BitBtn1: TBitBtn
    Left = 344
    Top = 152
    Width = 57
    Height = 25
    Caption = #22686#21152'(&A)'
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 400
    Top = 152
    Width = 57
    Height = 25
    Caption = #31227#38500'(&D)'
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 16
    Width = 441
    Height = 129
    DataSource = dsList
    ReadOnly = True
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Type_'
        Title.Alignment = taCenter
        Title.Caption = #31867#21035
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name_'
        Title.Alignment = taCenter
        Title.Caption = #21517#31216
        Width = 335
        Visible = True
      end>
  end
  object BitBtn3: TBitBtn
    Left = 344
    Top = 182
    Width = 75
    Height = 25
    TabOrder = 7
    Kind = bkOK
  end
  object BitBtn4: TBitBtn
    Left = 344
    Top = 206
    Width = 75
    Height = 25
    TabOrder = 8
    Kind = bkCancel
  end
  object rbExt: TRadioButton
    Left = 16
    Top = 203
    Width = 73
    Height = 17
    Caption = #25490#38500#31867#21035
    TabOrder = 9
  end
  object edtExtName: TEdit
    Left = 96
    Top = 200
    Width = 241
    Height = 21
    TabOrder = 10
    OnChange = edtDirNameChange
  end
  object cdsList: TZjhDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspSQL'
    AfterScroll = cdsListAfterScroll
    Left = 40
    Top = 48
    object cdsListType_: TIntegerField
      FieldName = 'Type_'
      OnGetText = cdsListType_GetText
    end
    object cdsListName_: TStringField
      FieldName = 'Name_'
      Size = 255
    end
  end
  object dsList: TDataSource
    DataSet = cdsList
    Left = 40
    Top = 80
  end
end
