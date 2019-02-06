object Main: TMain
  Left = 197
  Top = 125
  BorderStyle = bsNone
  Caption = 'Borderless Gaming Tool'
  ClientHeight = 637
  ClientWidth = 1289
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SelectWndBtn: TLabel
    Left = 8
    Top = 8
    Width = 12
    Height = 20
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = SelectWndBtnClick
  end
  object CloseBtn: TLabel
    Left = 8
    Top = 32
    Width = 11
    Height = 20
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = CloseBtnClick
  end
  object XPManifest: TXPManifest
    Left = 32
    Top = 8
  end
end
