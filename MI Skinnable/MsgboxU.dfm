object frmMsgBox: TfrmMsgBox
  Left = 350
  Top = 149
  BorderStyle = bsNone
  Caption = 'frmMsgBox'
  ClientHeight = 284
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object imgMsgBox: TImage
    Left = 0
    Top = 0
    Width = 425
    Height = 217
    AutoSize = True
    OnMouseDown = imgMsgBoxMouseDown
  end
  object lblMsgTitle: TLabel
    Left = 32
    Top = 15
    Width = 90
    Height = 24
    Caption = 'lblMsgTitle'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
    OnMouseDown = lblMsgTitleMouseDown
  end
  object imgOK: TImage
    Left = 152
    Top = 172
    Width = 57
    Height = 25
    AutoSize = True
    Transparent = True
    OnClick = imgOKClick
    OnMouseDown = imgOKMouseDown
    OnMouseUp = imgOKMouseUp
  end
  object imgOCCancel: TImage
    Left = 240
    Top = 172
    Width = 57
    Height = 25
    AutoSize = True
    Transparent = True
    OnClick = imgOCCancelClick
    OnMouseDown = imgOCCancelMouseDown
    OnMouseUp = imgOCCancelMouseUp
  end
  object imgOCOK: TImage
    Left = 80
    Top = 172
    Width = 57
    Height = 25
    AutoSize = True
    Transparent = True
    OnClick = imgOKClick
    OnMouseDown = imgOCOKMouseDown
    OnMouseUp = imgOCOKMouseUp
  end
  object RichViewMsgBox: TRichView
    Left = 32
    Top = 56
    Width = 361
    Height = 97
    TabStop = True
    TabOrder = 0
    Tracking = True
    VScrollVisible = True
    AllowSelection = True
    BackgroundStyle = bsNoBitmap
    Delimiters = ' .;,:(){}"'
    FirstJumpNo = 0
    LeftMargin = 5
    MaxTextWidth = 0
    MinTextWidth = 0
    OnJump = RichViewMsgBoxJump
    OnKeyPress = RichViewMsgBoxKeyPress
    PopupMenu = PopupMenuMsgBox
    RightMargin = 5
    SingleClick = False
    Style = frmMain.RVStyle
  end
  object ChkImg: TTimer
    Enabled = False
    Interval = 50
    OnTimer = ChkImgTimer
    Left = 72
    Top = 24
  end
  object PopupMenuMsgBox: TPopupMenu
    OnPopup = PopupMenuMsgBoxPopup
    Left = 824
    Top = 320
    object mnuMsgBoxSelectAll: TMenuItem
      Caption = 'Select all'
      OnClick = mnuMsgBoxSelectAllClick
    end
    object mnuMsgBoxCopy: TMenuItem
      Caption = 'Copy'
      OnClick = mnuMsgBoxCopyClick
    end
  end
end