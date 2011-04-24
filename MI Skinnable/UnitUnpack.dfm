object frmUnpack: TfrmUnpack
  Left = 327
  Top = 111
  BorderStyle = bsNone
  Caption = 'frmUnpack'
  ClientHeight = 293
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object imgUnpack: TImage
    Left = 0
    Top = 0
    Width = 425
    Height = 217
    AutoSize = True
    OnMouseDown = imgUnpackMouseDown
  end
  object lblBytes: TLabel
    Left = 24
    Top = 76
    Width = 36
    Height = 13
    Caption = 'lblBytes'
    Transparent = True
  end
  object lblCurrentFileLabel: TLabel
    Left = 24
    Top = 38
    Width = 53
    Height = 13
    Caption = 'Current file:'
    Transparent = True
  end
  object lblAllFilesLabel: TLabel
    Left = 24
    Top = 102
    Width = 70
    Height = 13
    Caption = 'Total progress '
    Transparent = True
  end
  object lblTotalMB: TLabel
    Left = 24
    Top = 140
    Width = 47
    Height = 13
    Caption = 'MB of MB'
    Transparent = True
  end
  object lblLabelElapsedTime: TLabel
    Left = 234
    Top = 140
    Width = 60
    Height = 13
    Caption = 'Elapsed time'
    Transparent = True
  end
  object lblLabelEstimatedTime: TLabel
    Left = 234
    Top = 156
    Width = 85
    Height = 13
    Caption = 'Estimated time left'
    Transparent = True
  end
  object lblEstiTime: TLabel
    Left = 354
    Top = 156
    Width = 50
    Height = 13
    Caption = 'lblEstiTime'
    Transparent = True
  end
  object lblElapTime: TLabel
    Left = 354
    Top = 140
    Width = 54
    Height = 13
    Caption = 'lblElapTime'
    Transparent = True
  end
  object Label3: TLabel
    Left = 347
    Top = 140
    Width = 3
    Height = 13
    Caption = ':'
    Transparent = True
  end
  object Label4: TLabel
    Left = 347
    Top = 156
    Width = 3
    Height = 13
    Caption = ':'
    Transparent = True
  end
  object lblCurrentFile: TLabel
    Left = 81
    Top = 38
    Width = 45
    Height = 13
    Caption = 'File name'
    Transparent = True
  end
  object lblUnpackTitle: TLabel
    Left = 24
    Top = 12
    Width = 118
    Height = 24
    Caption = 'lblUnpackTitle'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
    OnMouseDown = imgUnpackMouseDown
  end
  object Gauge2: TGauge
    Left = 24
    Top = 120
    Width = 372
    Height = 15
    BorderStyle = bsNone
    Progress = 0
  end
  object Gauge1: TGauge
    Left = 24
    Top = 56
    Width = 372
    Height = 15
    BorderStyle = bsNone
    Color = clBtnFace
    ParentColor = False
    Progress = 0
  end
  object imgCancel: TImage
    Left = 176
    Top = 176
    Width = 73
    Height = 25
    AutoSize = True
    Transparent = True
    OnClick = imgCancelClick
    OnMouseDown = imgCancelMouseDown
    OnMouseUp = imgCancelMouseUp
  end
  object ChkImg: TTimer
    Enabled = False
    Interval = 50
    OnTimer = ChkImgTimer
  end
end
