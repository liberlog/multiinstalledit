object frmDecrypt: TfrmDecrypt
  Left = 268
  Top = 181
  BorderStyle = bsNone
  Caption = 'frmDecrypt'
  ClientHeight = 52
  ClientWidth = 307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 299
    Height = 49
    TabOrder = 0
    object lblDecrypt: TLabel
      Left = 8
      Top = 8
      Width = 60
      Height = 13
      Caption = 'Decrypting...'
    end
    object ProgressBar: TProgressBar
      Left = 8
      Top = 24
      Width = 283
      Height = 17
      TabOrder = 0
    end
  end
end
