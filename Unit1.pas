unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI, XPMan;

type
  TMain = class(TForm)
    SelectWndBtn: TLabel;
    CloseBtn: TLabel;
    XPManifest: TXPManifest;
    procedure SelectWndBtnClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

uses Unit2;

{$R *.dfm}
{$R UAC.res}

procedure TMain.SelectWndBtnClick(Sender: TObject);
begin
  SelectWnd.ShowModal;
end;

procedure TMain.CloseBtnClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar(GetEnvironmentVariable('WinDir') + '\explorer.exe'), nil, nil, SW_SHOWNORMAL);
  Close;
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  Application.Title:=Caption;
  Top:=0;
  Left:=0;
  Main.Width:=Screen.Width;
  Main.Height:=Screen.Height;
  SelectWndBtn.Top:=Screen.Height - SelectWndBtn.Height * 2;
  SelectWndBtn.Left:=Screen.Width - SelectWndBtn.Width - SelectWndBtn.Height * 2 - CloseBtn.Width;
  CloseBtn.Top:=Screen.Height - CloseBtn.Height * 2;
  CloseBtn.Left:=Screen.Width - CloseBtn.Width - CloseBtn.Height;
  ShellExecute(0, 'open', 'taskkill', PChar(' /im explorer.exe /f'), nil, SW_HIDE);
end;

end.
