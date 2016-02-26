object FrmUpdateFiles: TFrmUpdateFiles
  Left = 276
  Top = 127
  BorderStyle = bsSingle
  Caption = #25991#20214#21516#27493'&'#22791#20221#24037#20855
  ClientHeight = 386
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  Visible = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 632
    Height = 152
    Align = alClient
    DataSource = dsView
    DefaultDrawing = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Type_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #31867#21035
        Width = 35
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LocalNo_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #25991#20214#21495
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FileName_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #25991#20214#21517
        Width = 225
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FileDateTime_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#26085#26399
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FileSize_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #25991#20214#22823#23567
        Width = 65
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'UP_'
        Title.Alignment = taCenter
        Title.Caption = #22788#29702#26041#21521
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Remark_'
        Title.Alignment = taCenter
        Title.Caption = #22791#27880
        Width = 155
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 11
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #26412#22320#30446#24405
    end
    object Label2: TLabel
      Left = 320
      Top = 11
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #20027#26426#30446#24405
    end
    object edtLocalPath: TEdit
      Left = 72
      Top = 9
      Width = 241
      Height = 20
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtServerPath: TEdit
      Left = 376
      Top = 9
      Width = 241
      Height = 20
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 193
    Width = 632
    Height = 193
    ActivePage = TabSheet1
    Align = alBottom
    Style = tsFlatButtons
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #24046#24322#22788#29702
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 161
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Label3: TLabel
          Left = 16
          Top = 14
          Width = 97
          Height = 15
          AutoSize = False
          Caption = #26412#22320#25991#20214#26085#26399#65306
        end
        object Label4: TLabel
          Left = 248
          Top = 14
          Width = 97
          Height = 15
          AutoSize = False
          Caption = #26412#22320#25991#20214#22823#23567#65306
        end
        object Label5: TLabel
          Left = 16
          Top = 42
          Width = 97
          Height = 15
          AutoSize = False
          Caption = #20027#26426#25991#20214#26085#26399#65306
        end
        object Label6: TLabel
          Left = 248
          Top = 42
          Width = 97
          Height = 15
          AutoSize = False
          Caption = #20027#26426#25991#20214#22823#23567#65306
        end
        object Label7: TLabel
          Left = 440
          Top = 29
          Width = 65
          Height = 15
          AutoSize = False
          Caption = #22788#29702#26041#21521
        end
        object Label8: TLabel
          Left = 16
          Top = 100
          Width = 97
          Height = 15
          AutoSize = False
          Caption = #38656#22788#29702#25991#20214#25968#65306
        end
        object Label9: TLabel
          Left = 16
          Top = 124
          Width = 97
          Height = 15
          AutoSize = False
          Caption = #24635#20849#25991#20214#22823#23567#65306
        end
        object Label10: TLabel
          Left = 248
          Top = 100
          Width = 97
          Height = 15
          AutoSize = False
          Caption = #24320#22987#20316#19994#26102#38388#65306
        end
        object Label11: TLabel
          Left = 248
          Top = 124
          Width = 97
          Height = 15
          AutoSize = False
          Caption = #35745#21010#23436#25104#26102#38388#65306
        end
        object Label12: TLabel
          Left = 440
          Top = 115
          Width = 65
          Height = 15
          AutoSize = False
          Caption = #20272#35745#32791#26102
        end
        object edtLocalTime: TEdit
          Left = 104
          Top = 13
          Width = 129
          Height = 22
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
        object edtLocalSize: TEdit
          Left = 336
          Top = 13
          Width = 81
          Height = 22
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 1
        end
        object edtServerTime: TEdit
          Left = 104
          Top = 39
          Width = 129
          Height = 22
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 2
        end
        object edtServerSize: TEdit
          Left = 336
          Top = 39
          Width = 81
          Height = 22
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 3
        end
        object cboUP: TDBComboBox
          Left = 496
          Top = 26
          Width = 105
          Height = 22
          DataField = 'UP_'
          DataSource = dsView
          TabOrder = 4
        end
        object pb1: TProgressBar
          Left = 16
          Top = 72
          Width = 585
          Height = 17
          TabOrder = 5
        end
        object Edit1: TEdit
          Left = 104
          Top = 99
          Width = 129
          Height = 20
          Color = clBtnFace
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 6
        end
        object Edit2: TEdit
          Left = 104
          Top = 123
          Width = 129
          Height = 20
          Color = clBtnFace
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 7
        end
        object Edit3: TEdit
          Left = 336
          Top = 99
          Width = 81
          Height = 20
          Color = clBtnFace
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 8
        end
        object Edit4: TEdit
          Left = 336
          Top = 123
          Width = 81
          Height = 20
          Color = clBtnFace
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 9
        end
        object Edit5: TEdit
          Left = 496
          Top = 112
          Width = 49
          Height = 20
          Color = clBtnFace
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 10
        end
        object btnCacel: TBitBtn
          Left = 552
          Top = 110
          Width = 49
          Height = 25
          Caption = #21462#28040'(&C)'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 11
          Visible = False
          OnClick = btnCacelClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #20316#19994#36873#39033
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 176
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        object GroupBox3: TGroupBox
          Left = 12
          Top = 10
          Width = 185
          Height = 95
          TabOrder = 0
          object rbChanged1: TRadioButton
            Left = 16
            Top = 24
            Width = 163
            Height = 17
            Caption = #20197#26085#26399#20026#20027#65292#26412#22320'<=>'#20027#26426
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = chkChangedClick
          end
          object rbChanged3: TRadioButton
            Left = 16
            Top = 64
            Width = 163
            Height = 17
            Caption = #20197#20027#26426#20026#20027#65292#26412#22320'<='#20027#26426
            TabOrder = 1
            OnClick = chkChangedClick
          end
          object rbChanged2: TRadioButton
            Left = 16
            Top = 44
            Width = 163
            Height = 17
            Caption = #20197#26412#22320#20026#20027#65292#26412#22320'=>'#20027#26426
            TabOrder = 2
            OnClick = chkChangedClick
          end
          object chkChanged: TCheckBox
            Left = 16
            Top = 0
            Width = 137
            Height = 17
            Caption = #26816#27979#26412#22320#19982#20027#26426#19981#21516
            Checked = True
            State = cbChecked
            TabOrder = 3
            OnClick = chkChangedClick
          end
        end
        object GroupBox1: TGroupBox
          Left = 212
          Top = 10
          Width = 193
          Height = 71
          TabOrder = 1
          object rbNewLocal1: TRadioButton
            Left = 16
            Top = 24
            Width = 169
            Height = 17
            Caption = #23558#26412#22320#25991#20214#19978#20256#33267#20027#26426
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = chkChangedClick
          end
          object rbNewLocal2: TRadioButton
            Left = 16
            Top = 44
            Width = 169
            Height = 17
            Caption = #21024#38500#26412#22320#25991#20214#20197#19982#20027#26426#30456#21516
            TabOrder = 1
            OnClick = chkChangedClick
          end
        end
        object GroupBox2: TGroupBox
          Left = 420
          Top = 10
          Width = 193
          Height = 71
          TabOrder = 2
          object rbNewServer1: TRadioButton
            Left = 16
            Top = 24
            Width = 169
            Height = 17
            Caption = #21024#38500#20027#26426#25991#20214#20197#19982#26412#22320#30456#21516
            TabOrder = 0
            OnClick = chkChangedClick
          end
          object rbNewServer2: TRadioButton
            Left = 16
            Top = 44
            Width = 169
            Height = 17
            Caption = #23558#20027#26426#25991#20214#19979#36733#33267#26412#22320
            Checked = True
            TabOrder = 1
            TabStop = True
            OnClick = chkChangedClick
          end
        end
        object chkNewServer: TCheckBox
          Left = 436
          Top = 10
          Width = 137
          Height = 17
          Caption = #26816#27979#26412#22320#26080#65292#20027#26426#26377
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnClick = chkChangedClick
        end
        object chkNewLocal: TCheckBox
          Left = 228
          Top = 10
          Width = 137
          Height = 17
          Caption = #26816#27979#26412#22320#26377#65292#20027#26426#26080' '
          Checked = True
          State = cbChecked
          TabOrder = 4
          OnClick = chkChangedClick
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #21382#21490#29256#26412
      ImageIndex = 2
      OnShow = TabSheet3Show
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 624
        Height = 160
        Align = alClient
        DataSource = dsHistory
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Index_'
            Title.Alignment = taCenter
            Title.Caption = #29256#21495
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FileTime_'
            Title.Alignment = taCenter
            Title.Caption = #25991#20214#26102#38388
            Width = 145
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FileSize_'
            Title.Alignment = taCenter
            Title.Caption = #25991#20214#22823#23567
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Remark_'
            Title.Alignment = taCenter
            Title.Caption = #22791#27880
            Width = 255
            Visible = True
          end>
      end
    end
  end
  object cdsView: TZjhDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspSQL'
    BeforeInsert = cdsViewBeforeInsert
    AfterScroll = cdsViewAfterScroll
    Left = 56
    Top = 88
    object cdsViewType_: TIntegerField
      FieldName = 'Type_'
      OnGetText = cdsViewType_GetText
    end
    object cdsViewLocalNo_: TIntegerField
      FieldName = 'LocalNo_'
    end
    object cdsViewServerNo_: TIntegerField
      FieldName = 'ServerNo_'
    end
    object cdsViewFileName_: TStringField
      FieldName = 'FileName_'
      Size = 255
    end
    object cdsViewFileDateTime_: TDateTimeField
      FieldName = 'FileDateTime_'
      OnGetText = cdsViewFileDateTime_GetText
    end
    object cdsViewFileSize_: TFloatField
      FieldName = 'FileSize_'
    end
    object cdsViewTag_: TIntegerField
      FieldName = 'Tag_'
    end
    object cdsViewUP_: TIntegerField
      FieldName = 'UP_'
      OnGetText = cdsViewUP_GetText
      OnSetText = cdsViewUP_SetText
    end
    object cdsViewRemark_: TStringField
      FieldName = 'Remark_'
      Size = 80
    end
  end
  object dsView: TDataSource
    DataSet = cdsView
    Left = 56
    Top = 120
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 88
    object O1: TMenuItem
      Caption = #39033#30446'(&P)'
      object O2: TMenuItem
        Caption = #25171#24320'(&O)'
        ShortCut = 16463
        OnClick = O2Click
      end
      object S1: TMenuItem
        Caption = #20445#23384'(&S)'
        ShortCut = 16467
        OnClick = S1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object popNewProject: TMenuItem
        Caption = #26032#24314'(&A)'
        OnClick = popNewProjectClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object C2: TMenuItem
        Caption = #20851#38381'(&C)'
        OnClick = C2Click
      end
    end
    object E1: TMenuItem
      Caption = #31574#30053'(&E)'
      object N2: TMenuItem
        Caption = #20197#25991#20214#23384#26723#20026#20027'('#29992#20110#21516#27493')'
        Checked = True
        GroupIndex = 1
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #20197#26412#22320#25991#20214#20026#20027'('#29992#20110#22791#20221')'
        GroupIndex = 1
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #20197#20027#26426#25991#20214#20026#20027'('#29992#20110#36824#21407')'
        GroupIndex = 1
        OnClick = N4Click
      end
    end
    object D1: TMenuItem
      Caption = #25805#20316'(&D)'
      object popCheck: TMenuItem
        Caption = #26816#27979'(&C)'
        OnClick = popCheckClick
      end
      object popFastCheck: TMenuItem
        Caption = #24555#36895#26816#27979'(&F)'
        OnClick = popCheckClick
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object I1: TMenuItem
        Caption = #25490#24207'(&I)'
        object N8: TMenuItem
          Tag = 1
          Caption = #25353#31867#21035#25490#24207
          OnClick = N12Click
        end
        object N9: TMenuItem
          Tag = 2
          Caption = #25353#25991#20214#21517#25490#24207
          OnClick = N12Click
        end
        object N10: TMenuItem
          Tag = 3
          Caption = #25353#26356#26032#26085#26399#25490#24207
          OnClick = N12Click
        end
        object N11: TMenuItem
          Tag = 4
          Caption = #25353#25991#20214#22823#23567#25490#24207
          OnClick = N12Click
        end
        object N12: TMenuItem
          Tag = 5
          Caption = #25353#22788#29702#26041#24335#25490#24207
          OnClick = N12Click
        end
      end
      object H1: TMenuItem
        Caption = #20840#26174#20027#26426#25991#20214'(&H)'
        OnClick = H1Click
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object popBatchUpdate: TMenuItem
        Caption = #26356#26032'(&U)'
        OnClick = popBatchUpdateClick
      end
    end
    object T1: TMenuItem
      Caption = #24037#20855'(&T)'
      object Delphi1: TMenuItem
        Caption = 'Delphi'#28304#30721#24037#20855
        object pasdfm1: TMenuItem
          Caption = #20165#23558#38500'(pas,dfm)'#22806#30340#25991#20214#19978#20256#33267#20027#26426
          OnClick = pasdfm1Click
        end
        object pasdfm2: TMenuItem
          Caption = #23558'(pas,dfm)'#30340#25991#20214#21478#23384#33267#25351#23450#30446#24405
          OnClick = pasdfm2Click
        end
      end
      object N6: TMenuItem
        Caption = '-'
      end
    end
    object O3: TMenuItem
      Caption = #36873#39033'(&O)'
      object popEncryptFile: TMenuItem
        AutoCheck = True
        Caption = #20027#26426#25991#20214#21152#23494#23384#25918'('#20851#38190#36873#39033')'
      end
      object N5: TMenuItem
        Caption = #35774#32622#25490#38500#25991#20214'&&'#30446#24405'&&'#31867#21035
        OnClick = N5Click
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object S2: TMenuItem
        Caption = #29992#25143#21450#26435#38480#35774#32622'(&S)'
        OnClick = S2Click
      end
    end
    object A2: TMenuItem
      Caption = #24110#21161'(&H)'
      object N16: TMenuItem
        Caption = #38382#39064#21450#24847#35265#36820#39304
        OnClick = N16Click
      end
      object A1: TMenuItem
        Caption = #20851#20110'(&A)'
        OnClick = A1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.ufp'
    Filter = 'update files project(*.kmp)|*.kmp'
    Left = 120
    Top = 88
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.ufp'
    Filter = 'update files project(*.kmp)|*.kmp'
    Left = 120
    Top = 120
  end
  object cdsHistory: TZjhDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspSQL'
    Left = 88
    Top = 88
    object cdsHistoryIndex_: TStringField
      FieldName = 'Index_'
      Size = 4
    end
    object cdsHistoryFileTime_: TDateTimeField
      FieldName = 'FileTime_'
    end
    object cdsHistoryFileSize_: TFloatField
      FieldName = 'FileSize_'
    end
    object cdsHistoryRemark_: TStringField
      FieldName = 'Remark_'
      Size = 255
    end
  end
  object dsHistory: TDataSource
    DataSet = cdsHistory
    Left = 88
    Top = 120
  end
end
