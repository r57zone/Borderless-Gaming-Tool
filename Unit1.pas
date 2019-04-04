unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI, IniFiles, XPMan;

type
  TMain = class(TForm)
    SelectWndBtn: TLabel;
    CloseBtn: TLabel;
    XPManifest: TXPManifest;
    procedure SelectWndBtnClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;
  HideTaskBar: boolean;

implementation

uses Unit2;

{$R *.dfm}

procedure TMain.SelectWndBtnClick(Sender: TObject);
begin
  SelectWnd.ShowModal;
end;

procedure TMain.CloseBtnClick(Sender: TObject);
begin
  if HideTaskBar then
    ShowWindow(FindWindow('Shell_TrayWnd', nil), SW_SHOW);
  Close;
end;

procedure TMain.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Setup.ini');
  HideTaskBar:=Ini.ReadBool('Main', 'HideTaskBar', true);
  Ini.Free;
  Application.Title:=Caption;
  Top:=0;
  Left:=0;
  Main.Width:=Screen.Width;
  Main.Height:=Screen.Height;
  SelectWndBtn.Top:=Screen.Height - SelectWndBtn.Height * 2;
  SelectWndBtn.Left:=Screen.Width - SelectWndBtn.Width - SelectWndBtn.Height * 2 - CloseBtn.Width;
  CloseBtn.Top:=Screen.Height - CloseBtn.Height * 2;
  CloseBtn.Left:=Screen.Width - CloseBtn.Width - CloseBtn.Height;
  if HideTaskBar then
    ShowWindow(FindWindow('Shell_TrayWnd', nil), SW_HIDE);
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if HideTaskBar then
    ShowWindow(FindWindow('Shell_TrayWnd', nil), SW_SHOW);
end;

end.
