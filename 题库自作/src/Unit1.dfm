object Form1: TForm1
  Left = 316
  Top = 173
  Width = 486
  Height = 379
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #39064#24211#25991#20214#21046#20316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 470
    Height = 341
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet4: TTabSheet
      Caption = #39064#24211#21046#20316
      ImageIndex = 3
      object Edit7: TEdit
        Left = 16
        Top = 24
        Width = 417
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#36755#20837#27861
        TabOrder = 0
        Text = 'http://kaoshi.bb158.com'
      end
      object Button5: TButton
        Left = 16
        Top = 58
        Width = 121
        Height = 25
        Caption = #19979#36733#35813#32593#31449#39064#24211
        TabOrder = 1
        OnClick = Button5Click
      end
      object GroupBox3: TGroupBox
        Left = 4
        Top = 102
        Width = 446
        Height = 201
        Caption = #21333#20010#28155#21152
        TabOrder = 2
        object Label1: TLabel
          Left = 16
          Top = 128
          Width = 24
          Height = 13
          Caption = #31572#26696
        end
        object Label2: TLabel
          Left = 16
          Top = 88
          Width = 24
          Height = 13
          Caption = #36873#39033
        end
        object Label3: TLabel
          Left = 19
          Top = 53
          Width = 24
          Height = 13
          Caption = #39064#30446
        end
        object Label4: TLabel
          Left = 8
          Top = 24
          Width = 36
          Height = 13
          Caption = #39064#24211#21517
        end
        object Edit8: TEdit
          Left = 49
          Top = 49
          Width = 393
          Height = 21
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#36755#20837#27861
          TabOrder = 0
          Text = #34892#25919#20027#20307#26159#25351#20381#27861#25317#26377#29420#31435#30340#34892#25919#32844#26435#65292#33021#20195#34920#22269#23478#65292#20197#33258#24049#30340#21517#20041#34892#20351#34892#25919#32844#26435#20197#21450#29420#31435#21442#21152#34892#25919#35785#35772
        end
        object Edit9: TEdit
          Left = 49
          Top = 85
          Width = 393
          Height = 21
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#36755#20837#27861
          TabOrder = 1
          Text = 'A. '#20844#27665'  B. '#27861#20154' C. '#29420#31435#33258#28982#20154'  D. '#20844#21496#27861#20154#20195#34920
        end
        object Edit10: TEdit
          Left = 49
          Top = 125
          Width = 90
          Height = 21
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#36755#20837#27861
          TabOrder = 2
          Text = 'C'
        end
        object Button6: TButton
          Left = 176
          Top = 121
          Width = 75
          Height = 25
          Caption = #28155#21152
          TabOrder = 3
        end
        object Edit11: TEdit
          Left = 59
          Top = 21
          Width = 90
          Height = 21
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#36755#20837#27861
          TabOrder = 4
          Text = #32771#35797'A'
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = #39064#24211#23548#20837
      object GroupBox1: TGroupBox
        Left = 12
        Top = 5
        Width = 252
        Height = 47
        Caption = #23548#20837#26041#24335#36873#25321
        TabOrder = 0
        object RadioButton1: TRadioButton
          Left = 12
          Top = 22
          Width = 113
          Height = 17
          Caption = 'excel '#23548#20837
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object RadioButton2: TRadioButton
          Left = 113
          Top = 22
          Width = 113
          Height = 17
          Caption = 'word '#23548#20837
          Enabled = False
          TabOrder = 1
        end
      end
      object Edit3: TEdit
        Left = 87
        Top = 102
        Width = 178
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#36755#20837#27861
        TabOrder = 1
      end
      object StaticText3: TStaticText
        Left = 13
        Top = 105
        Width = 64
        Height = 17
        Caption = #31185#30446#21517#31216#65306
        TabOrder = 2
      end
      object Button2: TButton
        Left = 12
        Top = 64
        Width = 75
        Height = 25
        Caption = #36873#25321#25991#20214
        TabOrder = 3
        OnClick = Button2Click
      end
      object GroupBox2: TGroupBox
        Left = 4
        Top = 141
        Width = 445
        Height = 120
        Caption = #21305#37197#20851#31995#36873#25321
        TabOrder = 4
        object StaticText4: TStaticText
          Left = 21
          Top = 28
          Width = 64
          Height = 17
          Caption = #39064#30446#26631#39064#65306
          TabOrder = 0
        end
        object StaticText5: TStaticText
          Left = 21
          Top = 57
          Width = 88
          Height = 17
          Caption = #31572#26696#65288'A'#25110'BC)'#65306
          TabOrder = 1
        end
        object StaticText6: TStaticText
          Left = 21
          Top = 81
          Width = 161
          Height = 17
          Caption = #36873#39033#20869#23481'('#23545#24212'A'#30340#25991#23383#20869#23481')'#65306
          TabOrder = 2
        end
        object ComboBoxTitle: TComboBox
          Left = 187
          Top = 26
          Width = 145
          Height = 21
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#36755#20837#27861
          ItemHeight = 13
          TabOrder = 3
        end
        object ComboBoxAnswer: TComboBox
          Left = 187
          Top = 50
          Width = 145
          Height = 21
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#36755#20837#27861
          ItemHeight = 13
          TabOrder = 4
        end
        object ComboBoxText: TComboBox
          Left = 186
          Top = 79
          Width = 145
          Height = 21
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#36755#20837#27861
          ItemHeight = 13
          TabOrder = 5
        end
      end
      object Button3: TButton
        Left = 24
        Top = 272
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 5
        OnClick = Button3Click
      end
      object CheckBoxHasTitle: TCheckBox
        Left = 298
        Top = 103
        Width = 117
        Height = 17
        Caption = #25968#25454#21547#26631#39064#34892
        TabOrder = 6
      end
    end
    object TabSheet2: TTabSheet
      Caption = #25480#26435#25511#21046
      ImageIndex = 1
      object Edit1: TEdit
        Left = 60
        Top = 9
        Width = 233
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#36755#20837#27861
        TabOrder = 0
      end
      object StaticText1: TStaticText
        Left = 14
        Top = 12
        Width = 40
        Height = 17
        Caption = #36134#21495#65306
        TabOrder = 1
      end
      object StaticText2: TStaticText
        Left = 14
        Top = 44
        Width = 52
        Height = 17
        Caption = #25480#26435#30721#65306
        TabOrder = 2
      end
      object Edit2: TEdit
        Left = 60
        Top = 41
        Width = 233
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#36755#20837#27861
        TabOrder = 3
      end
      object Button1: TButton
        Left = 332
        Top = 10
        Width = 75
        Height = 25
        Caption = #29983#25104
        TabOrder = 4
        OnClick = Button1Click
      end
      object Memo1: TMemo
        Left = 18
        Top = 82
        Width = 281
        Height = 113
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#36755#20837#27861
        Lines.Strings = (
          #36134#21495#21487#20197#26159#30331#38470#29992#25143#21517#65292#22914#36523#20221#35777#21495#65292#23398#29983#21495#31561#12290
          #29983#25104#21518#21457#32473#29992#25143#65292#22635#20837#37197#32622#25991#20214'setting.ini '#25991#20214#30340' '
          'AuthCode= '#21518#38754)
        TabOrder = 5
      end
    end
    object TabSheet3: TTabSheet
      Caption = #27979#35797
      ImageIndex = 2
      object Button4: TButton
        Left = 14
        Top = 78
        Width = 75
        Height = 25
        Caption = #25214#31572#26696
        TabOrder = 0
        OnClick = Button4Click
      end
      object StaticText7: TStaticText
        Left = 11
        Top = 45
        Width = 76
        Height = 17
        Caption = #39064#30446#21253#21547#26631#39064
        TabOrder = 1
      end
      object Edit4: TEdit
        Left = 97
        Top = 42
        Width = 350
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#36755#20837#27861
        TabOrder = 2
      end
      object Edit5: TEdit
        Left = 14
        Top = 122
        Width = 165
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#36755#20837#27861
        TabOrder = 3
      end
      object StaticText8: TStaticText
        Left = 11
        Top = 13
        Width = 28
        Height = 17
        Caption = #39064#24211
        TabOrder = 4
      end
      object Edit6: TEdit
        Left = 97
        Top = 10
        Width = 350
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#36755#20837#27861
        TabOrder = 5
        Text = #30005#23376#21830#21153
      end
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.xls'
    Filter = 'xls|*.xls|xlsx|*.xlsx'
    Left = 404
    Top = 160
  end
  object OBFileStore1: TOBFileStore
    Files = <>
    Left = 212
    Top = 80
  end
end
