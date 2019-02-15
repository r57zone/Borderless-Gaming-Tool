unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles;

type
  TSelectWnd = class(TForm)
    ListBox: TListBox;
    OkBtn: TButton;
    ResolutionsCB: TComboBox;
    ResolutionsLbl: TLabel;
    CancelBtn: TButton;
    AutoCB: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure AutoCBMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectWnd: TSelectWnd;

implementation

{$R *.dfm}

procedure TSelectWnd.FormShow(Sender: TObject);
var
  Window: HWND;
  Buff: array [0..127] of Char;
  Ini: TIniFile;
begin
  Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Setup.ini');
  ResolutionsCB.Text:=Ini.ReadString('Main', 'Resolution', '1280x720');
  Ini.Free;
  ListBox.Clear;
  Window:=GetWindow(Handle, GW_HWNDFIRST);
  while Window <> 0 do begin // Не показываем:
    if (Window <> Application.Handle) // Собственное окно
      and IsWindowVisible(Window) // Невидимые окна
      and (GetWindow(Window, GW_OWNER) = 0) // Дочерние окна
      and (GetWindowText(Window, Buff, SizeOf(Buff)) <> 0) then begin

        GetWindowText(Window, Buff, SizeOf(Buff));
        ListBox.Items.Add(StrPas(Buff));
      end;
    Window:=GetWindow(Window, GW_HWNDNEXT);
  end;
  ListBox.ItemIndex:=0;
end;

procedure TSelectWnd.OkBtnClick(Sender: TObject);
var
  Wnd: HWND;
  WndWidth, WndHeight: integer;
  WndRect: TRect;
  Ini: TIniFile;
begin
  if ResolutionsCB.Text <> '1280x720' then begin
    Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Setup.ini');
    Ini.WriteString('Main', 'Resolution', ResolutionsCB.Text);
    Ini.Free;
  end;
  if ListBox.ItemIndex <> -1 then begin
    WND:=FindWindow(nil, PChar(ListBox.Items[ListBox.ItemIndex]));
    if WND <> 0 then begin
      if AutoCB.Enabled = false then begin
        WndWidth:=StrToIntDef(Copy(ResolutionsCB.Text, 1, Pos('x', ResolutionsCB.Text) - 1), 640);
        WndHeight:=StrToIntDef(Copy(ResolutionsCB.Text, Pos('x', ResolutionsCB.Text) + 1, Length(ResolutionsCB.Text)), 480);
      end else begin
        Windows.GetClientRect(Wnd, WndRect);
        WndWidth:=WndRect.Right;
        WndHeight:=WndRect.Bottom;
      end;
      SetWindowLong(Wnd, GWL_STYLE, GetWindowLong(Wnd, GWL_STYLE) and not WS_BORDER and not WS_SIZEBOX and not WS_DLGFRAME);
      SetWindowPos(Wnd, HWND_TOP, Screen.Width div 2 - WndWidth div 2, Screen.Height div 2 - WndHeight div 2, WndWidth, WndHeight, SWP_FRAMECHANGED);
      SetForegroundWindow(Wnd);
    end;
    Close;
  end;
end;

procedure TSelectWnd.FormCreate(Sender: TObject);
begin
  if FileExists(ExtractFilePath(ParamStr(0)) + 'Resolutions.txt') then
    ResolutionsCB.Items.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Resolutions.txt');
end;

procedure TSelectWnd.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TSelectWnd.AutoCBMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ResolutionsCB.Enabled:=AutoCB.Checked;
end;

end.
