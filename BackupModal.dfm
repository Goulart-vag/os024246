object mdlBackup: TmdlBackup
  Left = 1100
  Top = 179
  Width = 605
  Height = 578
  Caption = 'Backup'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 88
    Top = 32
    Width = 78
    Height = 13
    Caption = 'Banco de dados'
  end
  object Label2: TLabel
    Left = 88
    Top = 144
    Width = 37
    Height = 13
    Caption = 'Backup'
  end
  object edtBD: TEdit
    Left = 88
    Top = 56
    Width = 305
    Height = 33
    Enabled = False
    TabOrder = 0
    Text = 'edtBD'
  end
  object btnSearchBD: TButton
    Left = 416
    Top = 56
    Width = 75
    Height = 33
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = btnSearchBDClick
  end
  object edtBackup: TEdit
    Left = 88
    Top = 160
    Width = 305
    Height = 33
    Enabled = False
    TabOrder = 2
    Text = 'edtBackup'
  end
  object Button2: TButton
    Left = 416
    Top = 160
    Width = 75
    Height = 33
    Caption = 'Buscar'
    TabOrder = 3
    OnClick = Button2Click
  end
  object btnBackup: TButton
    Left = 80
    Top = 280
    Width = 161
    Height = 49
    Caption = 'Fazer Backup'
    TabOrder = 4
  end
  object btnCancelar: TButton
    Left = 272
    Top = 280
    Width = 161
    Height = 49
    Caption = 'Fazer Backup'
    TabOrder = 5
  end
  object OpenDialog: TOpenDialog
    Filter = 'Firebird|*.FDB'
    Left = 528
    Top = 64
  end
  object SaveDialog: TSaveDialog
    FileName = 
      'C:\Users\Desenv4.SEO\Desktop\trabalhos de pesquisa\os024246\gfhf' +
      'ghgh'
    FilterIndex = 0
    Left = 528
    Top = 160
  end
end
