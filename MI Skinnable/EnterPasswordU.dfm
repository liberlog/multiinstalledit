object frmEnterPassword: TfrmEnterPassword
  Left = 192
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Enter password'
  ClientHeight = 101
  ClientWidth = 245
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object lblEnterPassword: TLabel
    Left = 24
    Top = 16
    Width = 82
    Height = 13
    Caption = 'lblEnterPassword'
  end
  object EditPassword: TEdit
    Left = 24
    Top = 32
    Width = 193
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object cmdOK: TButton
    Left = 40
    Top = 67
    Width = 73
    Height = 25
    Caption = '&OK'
    ModalResult = 1
    TabOrder = 1
  end
  object cmdCancel: TButton
    Left = 120
    Top = 67
    Width = 73
    Height = 25
    Caption = 'C&ancel'
    ModalResult = 2
    TabOrder = 2
  end
end
