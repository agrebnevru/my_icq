unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, registry, ExtCtrls, inifiles, ToolWin, StdCtrls, Menus,
  RVScroll, RichView, RVEdit, RVStyle, GetUserInfo, ImgList;

type
  TEmoticonCode = record
    Code: String;
    Index: Integer;
  end;
  
  TFormChat = class(TForm)
    TabControlChat: TTabControl;
    UpPanel: TPanel;
    DownPanel: TPanel;
    Splitter1: TSplitter;
    RightLeftPanel: TPanel;
    RVChat: TRichView;
    rvs: TRVStyle;
    ButtonSend: TButton;
    ToolBar1: TToolBar;
    ToolButtonSwithCOntacts: TToolButton;
    ToolButtonSwitchSound: TToolButton;
    ToolButtonSwitchGroup: TToolButton;
    ToolButtonHistory: TToolButton;
    ToolButtonSettings: TToolButton;
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    RVMsg: TMemo;
    HowLenMSG: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    ImageAvatar: TImage;
    ImageListCenterPan: TImageList;
    procedure FormShow(Sender: TObject);
    procedure NewTabCreate(UIN, nik: string);
    procedure ButtonSendClick(Sender: TObject);
    procedure TabControlChatChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RVMsgChange(Sender: TObject);
    procedure TabControlChatGetImageIndex(Sender: TObject;
      TabIndex: Integer; var ImageIndex: Integer);
  private
    { Private declarations }
    procedure GetAva;
    procedure LoadProgPosition;
    procedure SaveProgPosition;
    procedure SaveProgSettings;
    procedure LoadProgSettings;
    function GetStyleNo(CommandChar: Char; Color: TColor;
      StyleNo: Integer): Integer;
    procedure ParseString(s: String);
  public
    { Public declarations }
  end;

var
  FormChat: TFormChat;
  DataC: Array of Array of string;
  inifile: tinifile;

implementation

uses Unit1, Unit5;

{$R *.dfm}

{------------------------------------------------------------------------------}
// TColor to RGB string
function GetColorStr(Color: TColor): String;
begin
  Result := IntToHex(ColorToRGB(Color),6);
  Result := Copy(Result,5,2)+Copy(Result,3,2)+Copy(Result,1,2);
end;

// RGB string to TColor
function GetStrColor(ColorValue: String): TColor;
var
i,v: Integer;
begin
  ColorValue := Copy(ColorValue,5,2)+Copy(ColorValue,3,2)+Copy(ColorValue,1,2);
  Result := 0;
  for i := 1 to 6 do begin
    if ColorValue[i] in ['A'..'F'] then
      v := ord(ColorValue[i])-ord('A')+10
    else if ColorValue[i] in ['a'..'f'] then
      v := ord(ColorValue[i])-ord('a')+10
    else
      v := ord(ColorValue[i])-ord('0');
    Result := Result*16+v;
  end;
end;

function TFormChat.GetStyleNo(CommandChar: Char; Color: TColor;
  StyleNo: Integer): Integer;
var
fi: TFontInfo;
begin
  fi := TFontInfo.Create(nil);
  fi.Assign(rvs.TextStyles[StyleNo]);
  case CommandChar of
    'b':
      if fsBold in fi.Style then
        fi.Style := fi.Style-[fsBold]
      else
        fi.Style := fi.Style+[fsBold];
    'i':
      if fsItalic in fi.Style then
        fi.Style := fi.Style-[fsItalic]
      else
        fi.Style := fi.Style+[fsItalic];
    'u':
      if fsUnderline in fi.Style then
        fi.Style := fi.Style-[fsUnderline]
      else
        fi.Style := fi.Style+[fsUnderline];
    'c':
      fi.Color := Color;
    'k':
      fi.BackColor := Color;
  end;
  Result := rvs.TextStyles.FindSuchStyle(StyleNo, fi, RVAllFontInfoProperties);
  if Result<0 then begin
    rvs.TextStyles.Add;
    Result := rvs.TextStyles.Count-1;
    rvs.TextStyles[Result].Assign(fi);
    rvs.TextStyles[Result].Standard := False;
  end;
  fi.Free;
end;

procedure TFormChat.ParseString(s: String);
var
i: Integer;
ParaNo, StyleNo, StartIndex: Integer;
CodeStarted: Boolean;
ColorChar: Char;
ColorValue: String;
{.....................................................}
    procedure AddString(StartIndex, EndIndex: Integer);
    var
    str: String;
    i: Integer;
    BSDeleted: Boolean;
    begin
      if EndIndex>=StartIndex then begin
        str := Copy(s, StartIndex, EndIndex-StartIndex+1);
        BSDeleted := False;
        for i := Length(str) downto 1 do     // replacing '\\' with '\'
          if (str[i]='\') and (i>1) and (str[i-1]='\') and not BSDeleted then begin
            Delete(str, i, 1);
            BSDeleted := True;
            end
          else
            BSDeleted := False;
        RVChat.AddNL(str, StyleNo, ParaNo);
        ParaNo := -1;
      end;
    end;
    {..................................}
begin
  ParaNo := 0;
  CodeStarted := False;
  StyleNo := 0;
  StartIndex := 1;
  ColorChar := #0;
  for i := 1 to Length(s) do begin
    if (ColorChar<>#0) then begin
      if (s[i] in ['0'..'9', 'a'..'f', 'A'..'F']) then begin
        ColorValue := ColorValue + s[i];
        if Length(ColorValue)=6 then begin
          AddString(StartIndex, i-2-6);
          StartIndex := i+1;
          StyleNo := GetStyleNo(ColorChar, GetStrColor(ColorValue), StyleNo);
          ColorChar := #0;
        end;
        continue;
      end;
      ColorChar := #0;
    end;
    case s[i] of
      '\':
        CodeStarted := not CodeStarted;
      'b', 'u', 'i', 'B', 'U', 'I':
        if CodeStarted then begin
          AddString(StartIndex, i-2);
          StartIndex := i+1;
          StyleNo := GetStyleNo(LowerCase(s[i])[1], clNone, StyleNo);
          CodeStarted := False;
        end;
      'c', 'C', 'k', 'K':
        if CodeStarted then begin
          ColorChar := LowerCase(s[i])[1];
          ColorValue := '';
          CodeStarted := False;
        end;
    end;
  end;
  AddString(StartIndex, Length(s));
end;
/////////////////////////////////////// ��������� ����������/�������� �������� begin
procedure TFormChat.SaveProgSettings;
begin
inifile:=tinifile.Create(extractfilepath(application.ExeName)+'Confing.ini');
inifile.WriteBool('Settings Chat', 'visibleuppanel', UpPanel.visible);
inifile.WriteBool('Settings Chat', 'visiblecenterpanel', RightLeftPanel.visible);
inifile.WriteBool('Settings Chat', 'visibledownpanel', Panel1.visible);
inifile.Free;
end;

procedure TFormChat.LoadProgSettings;
var
poscenterpanelchat: integer;
begin
inifile:=tinifile.Create(extractfilepath(application.ExeName)+'Confing.ini');
UpPanel.visible:=inifile.ReadBool('Settings Chat', 'visibleuppanel', true);
RightLeftPanel.visible:=inifile.ReadBool('Settings Chat', 'visiblecenterpanel', true);
Panel1.visible:=inifile.ReadBool('Settings Chat', 'visibledownpanel', true);
poscenterpanelchat:=inifile.ReadInteger('Settings Chat', 'aligncenterpanel', 1);
inifile.Free;
if poscenterpanelchat=1 then
  RightLeftPanel.Align:= alRight;
if poscenterpanelchat=2 then
  RightLeftPanel.Align:= alLeft;
end;
/////////////////////////////////////// ��������� ����������/�������� �������� end
/////////////////////////////////////// ��������� ����������/�������� ������� � �������� ���� ��������� begin
procedure TFormChat.SaveProgPosition;
var
FIniFile: TRegIniFile;
begin
FIniFile := TRegIniFile.Create('MyBOT'); // ������������� ������
FIniFile.OpenKey('MyBOT',true); // �������� ������
FIniFile.OpenKey('MyBOT-PositionChat',true); // �������� ��� ���� ������
if WindowState=wsNormal then
begin
FIniFile.WriteInteger('Option', 'Width', Width);
FIniFile.WriteInteger('Option', 'Heigth', Height);
FIniFile.WriteInteger('Option', 'Left', Left);
FIniFile.WriteInteger('Option', 'Top', Top);
end;
FIniFile.WriteInteger('Option', 'WinState', Integer(WindowState));
FIniFile.Free; //���������� ������
end;

procedure TFormChat.LoadProgPosition;
var
FIniFile: TRegIniFile;
begin
FIniFile := TRegIniFile.Create('MyBOT');
FIniFile.OpenKey('MyBOT',true);
FIniFile.OpenKey('MyBOT-PositionChat',true);
Width:=FIniFile.ReadInteger('Option', 'Width', 220);
Height:=FIniFile.ReadInteger('Option', 'Heigth', 600);
Left:=FIniFile.ReadInteger('Option', 'Left', 10);
Top:=FIniFile.ReadInteger('Option', 'Top', 10);
WindowState:=TWindowState(FIniFile.ReadInteger('Option', 'WinState', 2));
FIniFile.Free;
end;
/////////////////////////////////////// ��������� ����������/�������� ������� � �������� ���� ��������� end
procedure TFormChat.GetAva;
var
  SomeUIN : Cardinal;
  AvatarInfo : TUINInfoAvatar;
begin
mainform.AddLog('���������� ������ �� ��������� ������� - TFormChat.GetAva.');
if mainform.ICQClient.LoggedIn then
  begin
  SomeUIN := StrToInt(DataC[TabControlChat.TabIndex][0]);
    AvatarInfo := GetAvatarInfoFor(SomeUIN);
    if AvatarInfo.Hash = '' then
      mainform.AddLog('� ����������� ' + GetNickFor(SomeUIN) + ' (' + IntToStr(SomeUIN) + ') ����������� �������, ��� � ��� ��� ��� � ��� ����������.')
    else
      begin
        mainform.ICQClient.RequestAvatar(IntToStr(SomeUIN), AvatarInfo.Id, AvatarInfo.Flags, AvatarInfo.Hash);
        mainform.AddLog('� ����������� ' + GetNickFor(SomeUIN) + ' (' + IntToStr(SomeUIN) + ') ��������� �������.');
      end;
  end;
end;

procedure TFormChat.FormShow(Sender: TObject);
{
var
  SomeUIN : Cardinal;
  AvatarInfo : TUINInfoAvatar;}
begin
LoadProgPosition;
LoadProgSettings;
end;

procedure TFormChat.NewTabCreate(UIN: string; nik: string);
var
TabsIsset: boolean;
i, HMT, Tab: integer;
begin
TabsIsset:= false;
HMT:= TabControlChat.Tabs.Count;

if (HMT>0) AND (Length(DataC)>0) then
for i:=0 to Length(DataC)-1 do
begin
  if Length(DataC[i])>0 then
    if DataC[i][0]=UIN then
    begin
    TabsIsset:= true;
    Tab:= i;
    end;
end;

if TabsIsset<>true then
begin
  SetLength(DataC, HMT+1);
  mainform.AddLog('����������� ���������� ����� ��������.');
  TabControlChat.Tabs.Add(nik);
  TabControlChat.TabIndex:= HMT;
  TabControlChat.Images.AddImage(mainform.ImageListStatus, 13);
  // ��������� ������ � ������� ��� ������ ��������.
  SetLength(DataC[HMT], 2);
  DataC[HMT][0]:= UIN;
  DataC[HMT][1]:= nik;
end
else
begin
TabControlChat.TabIndex:= Tab;
end;
GetAva;
end;

procedure TFormChat.ButtonSendClick(Sender: TObject);
var
i: integer;
begin
  if mainform.ICQClient.LoggedIn then
    begin
      //mainform.ICQClient.SendMessage(StrToInt(DataC[TabControlChat.TabIndex][0]), );
      //mainform.AddLog('����������� ' + ' (' + DataC[TabControlChat.TabIndex][0] + ') ���������� ���������.');
      //RVChat.Add(DateToStr(Date) + ' ' + TimeToStr(Time), 0);
      //RVChat.Add(, 0);
      //RVChat.Add('----------------------------', 0);
    end;
ParseString('\cFF0000' + DataC[TabControlChat.TabIndex][1] + ' (' + DateToStr(Date) + TimeToStr(Time) + ') \cFF0000');
for i:= 0 to RVMsg.Lines.Count do
ParseString(RVMsg.Lines.Strings[i]);
RVChat.FormatTail;
RVChat.Update;
RVChat.DeleteUnusedStyles(True, True, True);
end;

procedure TFormChat.TabControlChatChange(Sender: TObject);
begin
mainform.AddLog('������������ UIN = ' + DataC[TabControlChat.TabIndex][0] + '.');
end;

procedure TFormChat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
SaveProgPosition;
SaveProgSettings;
mainform.AddLog('����������� ������� FormClose ��� FormChat.');
end;

procedure TFormChat.RVMsgChange(Sender: TObject);
begin
HowLenMSG.Caption:= IntToStr(Length(RVMsg.Lines.Text));
end;

procedure TFormChat.TabControlChatGetImageIndex(Sender: TObject;
  TabIndex: Integer; var ImageIndex: Integer);
begin
RVMsg.Lines.Add('ID �������� �� �������� - ' + IntToStr(ImageIndex));
end;

end.
