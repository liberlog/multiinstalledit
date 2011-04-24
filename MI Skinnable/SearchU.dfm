object frmSearch: TfrmSearch
  Left = 308
  Top = 115
  BorderStyle = bsNone
  Caption = 'frmSearch'
  ClientHeight = 237
  ClientWidth = 449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object imgSearchBG: TImage
    Left = 0
    Top = 0
    Width = 425
    Height = 209
    AutoSize = True
    OnMouseDown = imgSearchBGMouseDown
  end
  object imgTitlesOnly: TImage
    Left = 32
    Top = 81
    Width = 25
    Height = 25
    OnMouseDown = imgTitlesOnlyMouseDown
  end
  object lblSearchTitle: TLabel
    Left = 288
    Top = 6
    Width = 60
    Height = 24
    Caption = 'Search'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object imgSearchSearch: TImage
    Left = 32
    Top = 144
    Width = 89
    Height = 41
    AutoSize = True
    OnClick = imgSearchSearchClick
    OnMouseDown = imgSearchSearchMouseDown
    OnMouseUp = imgSearchSearchMouseUp
  end
  object imgDone: TImage
    Left = 104
    Top = 104
    Width = 89
    Height = 41
    AutoSize = True
    OnClick = imgDoneClick
    OnMouseDown = imgDoneMouseDown
    OnMouseUp = imgDoneMouseUp
  end
  object ImageChecked: TImage
    Left = 44
    Top = 92
    Width = 9
    Height = 9
    Picture.Data = {
      07544269746D617032010000424D320100000000000036000000280000000900
      0000090000000100180000000000FC0000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00000000000000
      0000000000000000FFFFFFFFFFFFFFFFFF00FFFFFF000000000000FFFFFF0000
      00000000000000FFFFFFFFFFFF00FFFFFF000000FFFFFFFFFFFFFFFFFF000000
      000000000000FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
      0000FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
      FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
    OnMouseDown = ImageCheckedMouseDown
  end
  object lblTitlesOnly: TLabel
    Left = 64
    Top = 88
    Width = 120
    Height = 19
    Caption = 'Search titles only'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
    OnMouseDown = lblTitlesOnlyMouseDown
  end
  object EditSearchText: TDirectoryEdit
    Left = 16
    Top = 16
    Width = 161
    Height = 21
    SelectionBrush.Color = clBlue
    BackBMP.Data = {07544269746D617000000000}
    OnKeyPress = EditSearchTextKeyPress
    HideSelection = True
    BorderStyle = bsNone
    Color = clWhite
    Text = 'EditSearchText'
  end
  object VSTree: TVirtualStringTree
    Left = 200
    Top = 40
    Width = 201
    Height = 113
    BorderStyle = bsNone
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'MS Sans Serif'
    Header.Font.Style = []
    Header.MainColumn = -1
    Header.Options = [hoColumnResize, hoDrag]
    HintAnimation = hatNone
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    TreeOptions.AutoOptions = [toAutoDropExpand]
    OnChange = VSTreeChange
    OnDblClick = VSTreeDblClick
    OnGetText = VSTreeGetText
    OnPaintText = VSTreePaintText
    OnGetImageIndex = VSTreeGetImageIndex
    OnKeyPress = VSTreeKeyPress
    Columns = <>
  end
  object ChkImg: TTimer
    Interval = 50
    OnTimer = ChkImgTimer
    Left = 200
    Top = 8
  end
end