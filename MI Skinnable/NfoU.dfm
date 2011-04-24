object frmNFO: TfrmNFO
  Left = 226
  Top = 265
  BorderStyle = bsNone
  Caption = 'frmNFO'
  ClientHeight = 398
  ClientWidth = 574
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
  PixelsPerInch = 96
  TextHeight = 13
  object ImgNFO: TImage
    Left = 0
    Top = 0
    Width = 575
    Height = 400
    AutoSize = True
    OnMouseDown = ImgNFOMouseDown
  end
  object imgClose: TImage
    Left = 336
    Top = 8
    Width = 65
    Height = 33
    AutoSize = True
    Transparent = True
    OnClick = imgCloseClick
    OnMouseDown = imgCloseMouseDown
    OnMouseUp = imgCloseMouseUp
  end
  object RichViewNFO: TRichView
    Left = 29
    Top = 45
    Width = 510
    Height = 290
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
    OnJump = RichViewNFOJump
    OnKeyPress = RichViewNFOKeyPress
    PopupMenu = PopupMenuNfo
    RightMargin = 5
    SingleClick = False
    Style = RVStyleNFO
  end
  object RVStyleNFO: TRVStyle
    TextStyles = <    
      item
        CharSet = OEM_CHARSET
        FontName = 'Terminal'
        Size = 9
        Color = clWindowText
        Style = []
      end    
      item
        CharSet = DEFAULT_CHARSET
        FontName = 'Arial'
        Size = 10
        Color = clBlue
        Style = [fsBold]
      end    
      item
        CharSet = DEFAULT_CHARSET
        FontName = 'Arial'
        Size = 10
        Color = clNavy
        Style = [fsBold]
      end    
      item
        CharSet = DEFAULT_CHARSET
        FontName = 'Arial'
        Size = 10
        Color = clMaroon
        Style = [fsItalic]
      end    
      item
        CharSet = OEM_CHARSET
        FontName = 'Terminal'
        Size = 9
        Color = clNavy
        Style = [fsUnderline]
      end    
      item
        CharSet = DEFAULT_CHARSET
        FontName = 'Arial'
        Size = 10
        Color = clGreen
        Style = [fsUnderline]
      end>
    JumpCursor = 101
    Color = clWindow
    HoverColor = clNone
    FullRedraw = False
    SelColor = clHighlight
    SelTextColor = clHighlightText
    Left = 528
    Top = 16
  end
  object ChkImg: TTimer
    Enabled = False
    Interval = 50
    OnTimer = ChkImgTimer
    Left = 24
  end
  object PopupMenuNfo: TPopupMenu
    OnPopup = PopupMenuNfoPopup
    Left = 824
    Top = 320
    object mnuNfoSelectAll: TMenuItem
      Caption = 'Select all'
      OnClick = mnuNfoSelectAllClick
    end
    object mnuNfoCopy: TMenuItem
      Caption = 'Copy'
      OnClick = mnuNfoCopyClick
    end
  end
end