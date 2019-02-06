object SelectWnd: TSelectWnd
  Left = 192
  Top = 124
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Select game'
  ClientHeight = 273
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 208
    Width = 53
    Height = 13
    Caption = 'Resolution:'
  end
  object ListBox: TListBox
    Left = 8
    Top = 8
    Width = 305
    Height = 185
    ItemHeight = 13
    TabOrder = 0
  end
  object OkBtn: TButton
    Left = 8
    Top = 240
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = OkBtnClick
  end
  object ComboBox: TComboBox
    Left = 72
    Top = 205
    Width = 89
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = '1280x720'
  end
  object CancelBtn: TButton
    Left = 88
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = CancelBtnClick
  end
end
