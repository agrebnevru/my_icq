unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ICQClient, ICQWorks, XPMan, ImgList, Menus, StdCtrls,
  ExtCtrls, inifiles, registry, VirtualTrees, CoolTrayIcon, TextTrayIcon, GetUserInfo,
  Unit6;

type
  PCLNode = ^TCLNode;

  TCLNode = record
    Nik, UIN: WideString;
    IMGStatus, IMGXStatus, IMGClient: integer;
  end;

  Tmainform = class(TForm)
    UpToolBar: TToolBar;
    DownToolBar: TToolBar;
    ToolButtonSwithCOntacts: TToolButton;
    ToolButtonSwitchSound: TToolButton;
    ToolButtonSwitchGroup: TToolButton;
    ToolButtonHistory: TToolButton;
    ToolButtonSettings: TToolButton;
    ImageListMenu: TImageList;
    ToolButtonStatus: TToolButton;
    ToolButtonXStatus: TToolButton;
    ImageListStatus: TImageList;
    PopupMenuStatus: TPopupMenu;
    PopupMenuXStatus: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N51: TMenuItem;
    N61: TMenuItem;
    N71: TMenuItem;
    N81: TMenuItem;
    N91: TMenuItem;
    N101: TMenuItem;
    N111: TMenuItem;
    N121: TMenuItem;
    N131: TMenuItem;
    N141: TMenuItem;
    N151: TMenuItem;
    N161: TMenuItem;
    N171: TMenuItem;
    N181: TMenuItem;
    N191: TMenuItem;
    N201: TMenuItem;
    N211: TMenuItem;
    N221: TMenuItem;
    N231: TMenuItem;
    N241: TMenuItem;
    N251: TMenuItem;
    N261: TMenuItem;
    N271: TMenuItem;
    N281: TMenuItem;
    N291: TMenuItem;
    N301: TMenuItem;
    N311: TMenuItem;
    N321: TMenuItem;
    N331: TMenuItem;
    N341: TMenuItem;
    N351: TMenuItem;
    N01: TMenuItem;
    ICQClient: TICQClient;
    XPManifest1: TXPManifest;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    ImageListClientsIcon: TImageList;
    ImageListXStatus: TImageList;
    ContactListLoad: TTimer;
    Edit1: TEdit;
    Edit2: TEdit;
    TreeViewContactList: TVirtualStringTree;
    Button1: TButton;
    Edit3: TEdit;
    PanelOtladka: TPanel;
    TrayIcon: TCoolTrayIcon;
    PopupMenuTray: TPopupMenu;
    N20: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    CheckBox1: TCheckBox;
    ImageListTrayMenu: TImageList;
    N21: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N42: TMenuItem;
    Edit5: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    Edit6: TEdit;
    Edit7: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Button3: TButton;
    ComboBox1: TComboBox;
    Label5: TLabel;
    Edit8: TEdit;
    procedure AddLog(msg: string);
    procedure StatusSend(id, img: integer; status: string);
    function IdIMGStatusSend(status: string): integer;
    procedure ConnectionToICQ(id: integer);
    function GetStatusFromCmbStatus : Cardinal;
    procedure XStatusSend(id, img: integer; xstatus: string);
    procedure ContactListLoadTimer(Sender: TObject);
    procedure ICQClientServerListRecv(Sender: TObject;
  SrvContactList: TList);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N01Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N111Click(Sender: TObject);
    procedure N171Click(Sender: TObject);
    procedure N231Click(Sender: TObject);
    procedure N291Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N121Click(Sender: TObject);
    procedure N181Click(Sender: TObject);
    procedure N241Click(Sender: TObject);
    procedure N301Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N71Click(Sender: TObject);
    procedure N131Click(Sender: TObject);
    procedure N191Click(Sender: TObject);
    procedure N251Click(Sender: TObject);
    procedure N311Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N81Click(Sender: TObject);
    procedure N141Click(Sender: TObject);
    procedure N201Click(Sender: TObject);
    procedure N261Click(Sender: TObject);
    procedure N321Click(Sender: TObject);
    procedure N281Click(Sender: TObject);
    procedure N91Click(Sender: TObject);
    procedure N151Click(Sender: TObject);
    procedure N211Click(Sender: TObject);
    procedure N271Click(Sender: TObject);
    procedure N331Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N101Click(Sender: TObject);
    procedure N351Click(Sender: TObject);
    procedure N221Click(Sender: TObject);
    procedure ToolButtonSettingsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ICQClientLogOff(Sender: TObject);
    procedure ICQClientLogin(Sender: TObject);
    procedure ICQClientTypingNotification(Sender: TObject; UIN: String;
      NotificationType: Word);
    procedure ICQClientConnectionFailed(Sender: TObject);
    procedure ICQClientAddedYou(Sender: TObject; UIN: String);
    procedure ICQClientError(Sender: TObject; ErrorType: TErrorType;
      ErrorMsg: String);
    procedure TreeViewContactListDblClick(Sender: TObject);
    procedure ICQClientMessageRecv(Sender: TObject; Msg, UIN: String);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeViewContactListGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure TreeViewContactListGetImageIndexEx(
      Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind;
      Column: TColumnIndex; var Ghosted: Boolean; var IMGStatus: Integer;
      var ImageListStatus: TCustomImageList);
    procedure FormDestroy(Sender: TObject);
    procedure ICQClientOfflineMsgRecv(Sender: TObject; DateTime: TDateTime;
      Msg, UIN: String);
    procedure ICQClientOnlineInfo(Sender: TObject; UIN: String; Port: Word;
      InternalIP, ExternalIP: String; OnlineTime: TDateTime;
      IdleTime: Word; ICQVersion, MirandaVersion: Cardinal; ProtoVer: Byte;
      UserCaps: String; AvatarId: Word; AvatarFlags: Byte;
      AvatarHash: String; NewXStatusSet: Boolean; NewXStatusMoodNum: Byte;
      NewXStatusNote: String);
    procedure N20Click(Sender: TObject);
    procedure TrayIconDblClick(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N25Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure TrayIconMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenuTrayPopup(Sender: TObject);
    procedure ICQClientAvatarReceive(Sender: TObject; UIN: String;
      AvatarId: Word; AvatarFlags: Byte; AvatarHash, AvatarData,
      AvatarExt: String);
   // procedure ICQClientStatusChange(Sender: TObject; UIN: String;
   //   Status: Cardinal);
    procedure Button2Click(Sender: TObject);
    procedure FindOfUINNode(ui: integer);
    procedure Button3Click(Sender: TObject);
    procedure ToolButtonSwithCOntactsClick(Sender: TObject);
    procedure ToolButtonSwitchSoundClick(Sender: TObject);
    procedure ToolButtonSwitchGroupClick(Sender: TObject);
    procedure CreateGeneralGroup;
    procedure TreeViewContactListCollapsed(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure TreeViewContactListExpanded(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure MusicPlay;
    procedure MusicStop;
    procedure ICQClientStatusChange(Sender: TObject; UIN: String;
      Status: Cardinal);
  private
    { Private declarations }
    co:music;
    procedure LoadProgPosition;
    procedure SaveProgPosition;
    procedure SaveProgSettings;
    procedure LoadProgSettings;
    procedure LoadNode(ANode: PVirtualNode);
  public
    { Public declarations }
  end;

var
  mainform: Tmainform;
  inifile: tinifile;
  IssetUIN, IssetPassword, TransparentKey, TransparentNotActive, FullReloadContactList, NeedToConnectAgain, KeyClose, GeneralGroupOlreadyCreated: boolean;
  UIN, Password: string;
  ConnectSwitch, TransparentValue: integer;

implementation

uses Unit2, Unit3, Unit4, Unit5;

{$R *.dfm}

procedure Tmainform.AddLog(msg: string);
begin
msg := DateToStr(Date) + ' ' + TimeToStr(Time) + ' | ' + msg;
if FormLog.Showing<>true then
  FormLog.Show;
FormLog.Memo1.Lines.Add(msg);
end;

function Tmainform.IdIMGStatusSend(status : string): integer;
var
  Rs : integer;
begin
  Rs:= 0;
  if status = 'Online' then Rs:= 13;       //в сети
  if status = 'INVISIBLE' then Rs:= 0;     //невидимый
  if status = 'AWAY' then Rs:= 7;          //отошел
  if status = 'NA' then Rs:= 8;            //недоступен
  if status = 'OCCUPIED' then Rs:= 9;      //занят
  if status = 'DND' then Rs:= 10;          //не беспокоить
  if status = 'FFC' then Rs:= 1;           //готов поболтать
  if status = 'HOME' then Rs:= 4;          //дома
  if status = 'ANGRY' then Rs:= 2;         //злой
  if status = 'DEPRESSION' then Rs:= 3;    //депрессия
  if status = 'WORK' then Rs:= 5;          //на работе
  if status = 'EATING' then Rs:= 6;        //кушаю
  if status = 'DND' then Rs:= 0;           //не в сети
AddLog('Функция статус id картинки узнаем = ' + IntToStr(Rs));
Result:= Rs;
end;

procedure Tmainform.TreeViewContactListGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var
  CLNode: PCLNode;
begin
  CLNode := Sender.GetNodeData(Node);
  if Assigned(CLNode) then
    case Column of
      0: CellText := CLNode^.Nik;
      1: CellText := CLNode^.UIN;
    end;
end;

procedure Tmainform.TreeViewContactListGetImageIndexEx(
  Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind;
  Column: TColumnIndex; var Ghosted: Boolean; var IMGStatus: Integer;
  var ImageListStatus: TCustomImageList);
var
  CLNode: PCLNode;
begin
  if Column > 0 then
    Exit;
  //IMGStatus := IdIMGStatusSend('S_DND');
  CLNode := TreeViewContactList.GetNodeData(Node);
  if Assigned(CLNode) then
  begin
    ImageListStatus := Self.ImageListStatus;
    IMGStatus := CLNode^.IMGStatus;
  end;
end;

procedure Tmainform.Button1Click(Sender: TObject);
var
  NewNode: PVirtualNode;
  NewCL: PCLNode;
  ISt: integer;
begin
ISt:= IdIMGStatusSend(ComboBox1.Items[ComboBox1.ItemIndex]);
Edit8.Text:= 'ISt=' + IntToStr(ISt) + ' (Edit2.Text=' + Edit2.Text + ')';
if GeneralGroupOlreadyCreated<>true then
  begin
    CreateGeneralGroup;
    GeneralGroupOlreadyCreated:= true;
  end;
if ISt<>0 then FindOfUINNode(-1) else FindOfUINNode(-2);
NewNode:= TreeViewContactList.AddChild(TreeViewContactList.FocusedNode);
NewCL:= TreeViewContactList.GetNodeData(NewNode);
if Assigned(NewCL) then
  with NewCL^ do
  begin
    Nik:= Edit1.Text;
    UIN:= Edit2.Text;
    IMGStatus := IdIMGStatusSend(ComboBox1.Items[ComboBox1.ItemIndex]);
  end;
end;
/////////////////////////////////////// процедуры работы с ICQ протоколом begin
function Tmainform.GetStatusFromCmbStatus : Cardinal;
var
  Rs : Cardinal;
begin
  Rs := S_ONLINE;
  case ToolButtonStatus.ImageIndex of
    1: Rs := S_FFC;         //готов поболтать
    2: Rs := S_ANGRY;       //злой
    3: Rs := S_DEPRESSION;  //депрессия
    4: Rs := S_HOME;        //дома
    5: Rs := S_WORK;        //на работе
    6: Rs := S_EATING;      //кушаю
    7: Rs := S_AWAY;        //отошел
    8: Rs := S_NA;          //недоступен
    9: Rs := S_OCCUPIED;    //занят
    10: Rs := S_DND;        //не беспокоить
    11: Rs := S_INVISIBLE;  //невидимый
  end;
  Result := Rs;
end;

procedure Tmainform.ConnectionToICQ(id: integer);
begin
ICQClient.ConvertToPlaintext := True;
  try
      ICQClient.Login(GetStatusFromCmbStatus + S_ALLOWDAUTH);
  except
    ShowMessage('Невозможно установить соединение, проверьте настройки файерволла и подключения к интернету!');
    AddLog('Невозможно установить соединение с сервером.');
  end;
end;

procedure Tmainform.StatusSend(id, img: integer; status: string);
begin
if (ICQClient.LoggedIn = false) AND (id<>100) then
  begin
    ConnectionToICQ(id);
  end;
if (ICQClient.LoggedIn = true) AND (id=100) then
  begin
    NeedToConnectAgain := False;
    ICQClient.LogOff;
  end;
ICQClient.Status := GetStatusFromCmbStatus + S_ALLOWDAUTH;
ICQClient.Status := GetStatusFromCmbStatus + S_ALLOWDAUTH;
ToolButtonStatus.Caption:= status;
ToolButtonStatus.ImageIndex:= img;
AddLog('Меняем статус.');
end;

procedure Tmainform.XStatusSend(id, img: integer; xstatus: string);
begin
ICQClient.XStatus := id;
ToolButtonXStatus.Caption:= xstatus;
ToolButtonXStatus.ImageIndex:= img;
AddLog('Меняем х-статус.');
end;

procedure Tmainform.ContactListLoadTimer(Sender: TObject);
begin
  ContactListLoad.Enabled:= False;
  FullReloadContactList:= False;
  ICQClient.RequestContactList;
  AddLog('Запрос КЛ по таймеру.');
end;
/////////////////////// создание групп "В сети" и "Не в сети" begin
procedure Tmainform.CreateGeneralGroup;
var
  NewNode: PVirtualNode;
  NewCL: PCLNode;
begin
NewNode := TreeViewContactList.AddChild(TreeViewContactList.FocusedNode);
NewCL := TreeViewContactList.GetNodeData(NewNode);
if Assigned(NewCL) then
  with NewCL^ do
    begin
      Nik:= 'В сети';
      UIN:= '-1';
      IMGStatus:= 50;
    end; 
NewNode := TreeViewContactList.AddChild(TreeViewContactList.FocusedNode);
NewCL := TreeViewContactList.GetNodeData(NewNode);
if Assigned(NewCL) then
  with NewCL^ do
    begin
      Nik := 'Не в сети';
      UIN := '-2';
      IMGStatus:= 50;
    end;
end;
/////////////////////// создание групп "В сети" и "Не в сети" end
procedure Tmainform.ICQClientServerListRecv(Sender: TObject;
  SrvContactList: TList);
var
  i : LongInt;
  UserInfo: TUINEntry;
  UINNickItem : PUINNickItem;
  NewNode: PVirtualNode;
  NewCL: PCLNode;
  StatusGetting: string;
  ISt: integer;
begin
AddLog('Запрос списка контактов из функции.');
  if FullReloadContactList then
    begin
      FullReloadContactList := False;
      TreeViewContactList.Clear;
      UINNickList.Clear;
      AddLog('Очищаем контакт лист и дерево TreeView.');
    end;
  if SrvContactList.Count > 0 then
    for i:= 0 to SrvContactList.Count-1 do
      begin
        UserInfo := PUINEntry(SrvContactList.Items[i])^;
        if UserInfo.CType = 0 then  //если это пользователь (CType = 0), то добавляем в список
          begin
          	StatusGetting:= GetStatusFor(UserInfo.UIN);
          	ISt:= IdIMGStatusSend(StatusGetting);
				if ISt<>0 then FindOfUINNode(-1) else FindOfUINNode(-2);
            NewNode := TreeViewContactList.AddChild(TreeViewContactList.FocusedNode);
            NewCL := TreeViewContactList.GetNodeData(NewNode);
            if Assigned(NewCL) then
              with NewCL^ do
                begin
                Nik := UserInfo.Nick + ' (' + StatusGetting + ')' + BoolToStr(UserInfo.Authorized);
                UIN := IntToStr(UserInfo.UIN);
                AddLog('Запрашиваем статус для ' + IntToStr(UserInfo.UIN) + ' [Статус - ' + StatusGetting + ']');
                IMGStatus:= ISt;
                GetMem(UINNickItem, SizeOf(UINNickItem^));
                UINNickItem^.UIN := UserInfo.UIN;
                UINNickItem^.Nick := UserInfo.Nick;
                UINNickList.Add(UINNickItem);
                end;
          end;
      end;
  Edit3.Text:= 'SrvContactList.Count-1 = ' + IntToStr(SrvContactList.Count-1);
  AddLog('Кол-во count в списке контактов = ' + IntToStr(SrvContactList.Count-1));
  AddLog('Получен список контактов');
  ICQClient.DestroyUINList(SrvContactList);
end;
/////////////////////////////////////// процедуры работы с ICQ протоколом end
/////////////////////////////////////// процедура сохранения/загрузки настроек begin
procedure Tmainform.SaveProgSettings;
begin
inifile:=tinifile.Create(extractfilepath(application.ExeName)+'Confing.ini');
inifile.WriteBool('Main window', 'visibleuptoolbar', Uptoolbar.Visible);
inifile.WriteBool('Main window', 'visibleofflinecontacts', ToolButtonSwithCOntacts.Down);
inifile.WriteBool('Main window', 'visiblegroup', ToolButtonSwitchGroup.Down);
inifile.WriteBool('Main window', 'offmusic', ToolButtonSwitchSound.Down);
inifile.WriteBool('Main window', 'visibledowntoolbar', DownToolBar.Visible);
inifile.Free;
end;

procedure Tmainform.LoadProgSettings;
var
mainontop: boolean;
begin
//AddLog('Считываем настройки из файла настроек.');
inifile:= tinifile.Create(extractfilepath(application.ExeName)+'Confing.ini');
UIN:=inifile.ReadString('Settings Account', 'uin', '');
Password:=inifile.ReadString('Settings Account', 'password', '');
if (UIN='') OR (Password='') then
  begin
    IssetUIN:=false;
    IssetPassword:=false;
    FormEnter.Show;
    //AddLog('Поля логин/пароль не заполнены, вызываем окно заполнения.');
  end
  else
  begin
    ICQClient.UIN:=StrToInt(UIN);
    ICQClient.Password:=Password;
    //AddLog('Поля логин/пароль заполнены, не вызываем окно заполнения.');
  end;
ICQClient.ICQServer:=inifile.ReadString('Settings Connect', 'simplserver', 'login.icq.com');
ICQClient.ICQPort:=inifile.ReadInteger('Settings Connect', 'simpleport', 5190);
ICQClient.ConnectionTimeout:=inifile.ReadInteger('Settings Connect', 'simpletimeaut', 0);
TransparentKey:=inifile.ReadBool('Settings CL', 'transparentkey', false);
TransparentNotActive:=inifile.ReadBool('Settings CL', 'transparentnotactive', true);
TransparentValue:=inifile.ReadInteger('Settings CL', 'transparentvalue', 255);
if TransparentKey = true then
  mainform.AlphaBlendValue:=TransparentValue;
UpToolBar.Visible:= inifile.ReadBool('Settings CL', 'visibleuptoolbar', true);
ToolButtonSwithCOntacts.Down:= inifile.ReadBool('Main window', 'visibleofflinecontacts', true);
ToolButtonSwitchGroup.Down:= inifile.ReadBool('Main window', 'visiblegroup', false);
ToolButtonSwitchSound.Down:= inifile.ReadBool('Main window', 'offmusic', false);
DownToolBar.Visible:= inifile.ReadBool('Settings CL', 'visibledowntoolbar', true);
mainontop:= inifile.ReadBool('Settings CL', 'mainontop', false);
if mainontop then
  FormStyle:= fsStayOnTop;
if mainontop<>true then
  FormStyle:= fsnormal;
inifile.Free;
end;
/////////////////////////////////////// процедура сохранения/загрузки настроек end
/////////////////////////////////////// процедура сохранения/загрузки позиции и размеров окна программы begin
procedure Tmainform.SaveProgPosition;
var
FIniFile: TRegIniFile;
begin
AddLog('Сохранение размеров окна и положения в реестр.');
FIniFile := TRegIniFile.Create('MyBOT'); // Инициализирую реестр
FIniFile.OpenKey('MyBOT',true); // Открываю раздел
FIniFile.OpenKey('MyBOT-PositionMain',true); // Открываю ещё один раздел
if WindowState=wsNormal then
begin
FIniFile.WriteInteger('Option', 'Width', Width);
FIniFile.WriteInteger('Option', 'Heigth', Height);
FIniFile.WriteInteger('Option', 'Left', Left);
FIniFile.WriteInteger('Option', 'Top', Top);
end;
FIniFile.WriteInteger('Option', 'WinState', Integer(WindowState));
FIniFile.Free; //Освобождаю реестр
end;

procedure Tmainform.LoadProgPosition;
var
FIniFile: TRegIniFile;
begin
AddLog('Загрузка размеров окна и положения из реестра.');
FIniFile := TRegIniFile.Create('MyBOT');
FIniFile.OpenKey('MyBOT',true);
FIniFile.OpenKey('MyBOT-PositionMain',true);
Width:=FIniFile.ReadInteger('Option', 'Width', 600);
Height:=FIniFile.ReadInteger('Option', 'Heigth', 400);
Left:=FIniFile.ReadInteger('Option', 'Left', 10);
Top:=FIniFile.ReadInteger('Option', 'Top', 10);
WindowState:=TWindowState(FIniFile.ReadInteger('Option', 'WinState', 2));
FIniFile.Free;
end;
/////////////////////////////////////// процедура сохранения/загрузки позиции и размеров окна программы end

///////////////////////////////////////////// Меню главного статуса begin
procedure Tmainform.N13Click(Sender: TObject);
begin
StatusSend(2, N13.ImageIndex, N13.Caption);
end;

procedure Tmainform.N14Click(Sender: TObject);
begin
StatusSend(3, N14.ImageIndex, N14.Caption);
end;

procedure Tmainform.N12Click(Sender: TObject);
begin
StatusSend(4, N12.ImageIndex, N12.Caption);
end;

procedure Tmainform.N11Click(Sender: TObject);
begin
StatusSend(2, N11.ImageIndex, N11.Caption);
end;

procedure Tmainform.N6Click(Sender: TObject);
begin
StatusSend(7, N6.ImageIndex, N6.Caption);
end;

procedure Tmainform.N4Click(Sender: TObject);
begin
StatusSend(8, N4.ImageIndex, N4.Caption);
end;

procedure Tmainform.N5Click(Sender: TObject);
begin
StatusSend(9, N5.ImageIndex, N5.Caption);
end;

procedure Tmainform.N7Click(Sender: TObject);
begin
StatusSend(10, N7.ImageIndex, N7.Caption);
end;

procedure Tmainform.N10Click(Sender: TObject);
begin
StatusSend(11, N10.ImageIndex, N10.Caption);
end;

procedure Tmainform.N3Click(Sender: TObject);
begin
StatusSend(6, N3.ImageIndex, N3.Caption);
end;

procedure Tmainform.N15Click(Sender: TObject);
begin
StatusSend(1, N15.ImageIndex, N15.Caption);
end;

procedure Tmainform.N1Click(Sender: TObject);
begin
StatusSend(101, N1.ImageIndex, N1.Caption);
end;

procedure Tmainform.N2Click(Sender: TObject);
begin
StatusSend(100, N2.ImageIndex, N2.Caption);
end;
///////////////////////////////////////////// Меню главного статуса end

///////////////////////////////////////////// Меню x-статуса begin
procedure Tmainform.N01Click(Sender: TObject);
begin
XStatusSend(0, N01.ImageIndex, N01.Caption);
end;

procedure Tmainform.N51Click(Sender: TObject);
begin
XStatusSend(1, N51.ImageIndex, N51.Caption);
end;

procedure Tmainform.N111Click(Sender: TObject);
begin
XStatusSend(2, N111.ImageIndex, N111.Caption);
end;

procedure Tmainform.N171Click(Sender: TObject);
begin
XStatusSend(3, N171.ImageIndex, N171.Caption);
end;

procedure Tmainform.N231Click(Sender: TObject);
begin
XStatusSend(4, N231.ImageIndex, N231.Caption);
end;

procedure Tmainform.N291Click(Sender: TObject);
begin
XStatusSend(5, N291.ImageIndex, N291.Caption);
end;

procedure Tmainform.N17Click(Sender: TObject);
begin
XStatusSend(6, N17.ImageIndex, N17.Caption);
end;

procedure Tmainform.N61Click(Sender: TObject);
begin
XStatusSend(7, N61.ImageIndex, N61.Caption);
end;

procedure Tmainform.N121Click(Sender: TObject);
begin
XStatusSend(8, N121.ImageIndex, N121.Caption);
end;

procedure Tmainform.N181Click(Sender: TObject);
begin
XStatusSend(9, N181.ImageIndex, N181.Caption);
end;

procedure Tmainform.N241Click(Sender: TObject);
begin
XStatusSend(10, N241.ImageIndex, N241.Caption);
end;

procedure Tmainform.N301Click(Sender: TObject);
begin
XStatusSend(11, N301.ImageIndex, N301.Caption);
end;

procedure Tmainform.N18Click(Sender: TObject);
begin
XStatusSend(12, N18.ImageIndex, N18.Caption);
end;

procedure Tmainform.N71Click(Sender: TObject);
begin
XStatusSend(13, N71.ImageIndex, N71.Caption);
end;

procedure Tmainform.N131Click(Sender: TObject);
begin
XStatusSend(14, N131.ImageIndex, N131.Caption);
end;

procedure Tmainform.N191Click(Sender: TObject);
begin
XStatusSend(15, N191.ImageIndex, N191.Caption);
end;

procedure Tmainform.N251Click(Sender: TObject);
begin
XStatusSend(16, N251.ImageIndex, N251.Caption);
end;

procedure Tmainform.N311Click(Sender: TObject);
begin
XStatusSend(17, N311.ImageIndex, N311.Caption);
end;

procedure Tmainform.N19Click(Sender: TObject);
begin
XStatusSend(18, N19.ImageIndex, N19.Caption);
end;

procedure Tmainform.N81Click(Sender: TObject);
begin
XStatusSend(19, N81.ImageIndex, N81.Caption);
end;

procedure Tmainform.N141Click(Sender: TObject);
begin
XStatusSend(20, N141.ImageIndex, N141.Caption);
end;

procedure Tmainform.N201Click(Sender: TObject);
begin
XStatusSend(21, N201.ImageIndex, N201.Caption);
end;

procedure Tmainform.N261Click(Sender: TObject);
begin
XStatusSend(22, N261.ImageIndex, N261.Caption);
end;

procedure Tmainform.N321Click(Sender: TObject);
begin
XStatusSend(23, N321.ImageIndex, N321.Caption);
end;

procedure Tmainform.N281Click(Sender: TObject);
begin
XStatusSend(24, N281.ImageIndex, N281.Caption);
end;

procedure Tmainform.N91Click(Sender: TObject);
begin
XStatusSend(25, N91.ImageIndex, N91.Caption);
end;

procedure Tmainform.N151Click(Sender: TObject);
begin
XStatusSend(26, N151.ImageIndex, N151.Caption);
end;

procedure Tmainform.N211Click(Sender: TObject);
begin
XStatusSend(27, N211.ImageIndex, N211.Caption);
end;

procedure Tmainform.N271Click(Sender: TObject);
begin
XStatusSend(28, N271.ImageIndex, N271.Caption);
end;

procedure Tmainform.N331Click(Sender: TObject);
begin
XStatusSend(29, N331.ImageIndex, N331.Caption);
end;

procedure Tmainform.N41Click(Sender: TObject);
begin
XStatusSend(30, N41.ImageIndex, N41.Caption);
end;

procedure Tmainform.N101Click(Sender: TObject);
begin
XStatusSend(31, N101.ImageIndex, N101.Caption);
end;

procedure Tmainform.N351Click(Sender: TObject);
begin
XStatusSend(32, N351.ImageIndex, N351.Caption);
end;

procedure Tmainform.N221Click(Sender: TObject);
begin
XStatusSend(33, N221.ImageIndex, N221.Caption);
end;
///////////////////////////////////////////// Меню x-статуса end

procedure Tmainform.ToolButtonSettingsClick(Sender: TObject);
begin
FormSettings.Show;
AddLog('Вызываем окно настроек.');
end;

procedure Tmainform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
SaveProgPosition;
SaveProgSettings;
if ICQClient.LoggedIn then
ICQClient.LogOff;
end;

procedure Tmainform.FormShow(Sender: TObject);
begin
LoadProgPosition;
//MusicPlay;
end;

///////////////////////// потоковые процедуры(music) begin
procedure Tmainform.MusicPlay;
begin
 co:=music.Create(true);
 co.Resume;
 co.Priority:=tpLower;
 AddLog('Запустили поток с проигрыванием музыки.');
end;

procedure Tmainform.MusicStop;
begin
 co.Terminate;
 AddLog('Вырубили поток с проигрыванием музыки.');
end;
///////////////////////// потоковые процедуры(music) end

procedure Tmainform.ICQClientLogOff(Sender: TObject);
begin
AddLog('Успешно отключились');
end;

procedure Tmainform.ICQClientLogin(Sender: TObject);
begin
AddLog('Успешно подключились по логином: ' + IntToStr(ICQClient.UIN));
NeedToConnectAgain := True;
ContactListLoad.Enabled:= true;
if GeneralGroupOlreadyCreated<>true then
  begin
    CreateGeneralGroup;
    GeneralGroupOlreadyCreated:= true;
  end;
end;

procedure Tmainform.ICQClientTypingNotification(Sender: TObject;
  UIN: String; NotificationType: Word);
begin
  case NotificationType of
    0: AddLog(GetNickFor(StrToInt(UIN)) + ' (' + UIN + ') закончил печатать вам сообщение.');
    1: AddLog(GetNickFor(StrToInt(UIN)) + ' (' + UIN + ') закончил печатать вам сообщение.');
    2: AddLog(GetNickFor(StrToInt(UIN)) + ' (' + UIN + ') печатает вам сообщение.');
  end;
end;

procedure Tmainform.ICQClientConnectionFailed(Sender: TObject);
begin
  if NeedToConnectAgain then
    begin
      AddLog('Подключение сорвалось! Переподключаемся...');
    end;
end;

procedure Tmainform.ICQClientAddedYou(Sender: TObject; UIN: String);
begin
  AddLog('Меня добавил UIN ' + UIN + '.');
end;

procedure Tmainform.ICQClientError(Sender: TObject; ErrorType: TErrorType;
  ErrorMsg: String);
begin
AddLog('Ошибка! ' + ErrorMsg);
end;

procedure Tmainform.TreeViewContactListDblClick(Sender: TObject);
var
NewCL: PCLNode;
begin
NewCL := TreeViewContactList.GetNodeData(TreeViewContactList.FocusedNode);
if (TreeViewContactList.FocusedNode<>nil) AND (Length(NewCL.UIN)>3) then
  begin
  AddLog('Произведен двойной клик по КЛ, вызываем окно чата. ------- [' + NewCL.UIN + ']');
  FormChat.Show;
  FormChat.NewTabCreate(NewCL.UIN, NewCL.Nik);
  end
  else
  begin
  AddLog('Произведен двойной клик по КЛ, НЕ вызываем окно чата.');
  end;
end;

procedure Tmainform.ICQClientMessageRecv(Sender: TObject; Msg,
  UIN: String);
begin
AddLog('От собеседника ' + ' (' + UIN + ') принято сообщение.');
FormChat.RVChat.Add(DateToStr(Date) + ' ' + TimeToStr(Time), 0);
FormChat.RVChat.Add(Msg, 0);
FormChat.RVChat.Add('----------------------------', 0);
end;

procedure Tmainform.ICQClientOfflineMsgRecv(Sender: TObject;
  DateTime: TDateTime; Msg, UIN: String);
begin
  AddLog('От ' + GetNickFor(StrToInt(UIN)) + ' (' + UIN + ') принято сообщение в оффлайн в {' + DateTimeToStr(DateTime) + '}: [' + Msg + ']');
end;

procedure Tmainform.ICQClientOnlineInfo(Sender: TObject; UIN: String;
  Port: Word; InternalIP, ExternalIP: String; OnlineTime: TDateTime;
  IdleTime: Word; ICQVersion, MirandaVersion: Cardinal; ProtoVer: Byte;
  UserCaps: String; AvatarId: Word; AvatarFlags: Byte; AvatarHash: String;
  NewXStatusSet: Boolean; NewXStatusMoodNum: Byte; NewXStatusNote: String);
begin
if NewXStatusSet then
  AddLog('Пришла информация о ' + GetNickFor(StrToInt(UIN)) + ' (' + UIN + ') и его NewXStatus (icqmood' + IntToStr(NewXStatusMoodNum) + '): [' + NewXStatusNote + '].')
else
  AddLog('Пришла информация о ' + GetNickFor(StrToInt(UIN)) + ' (' + UIN + ').');
end;

////////////////////////////////////////////////////// процедуры для иконки в трее begin
procedure Tmainform.N20Click(Sender: TObject);
begin
if mainform.Showing then
begin
  Application.Minimize;
  TrayIcon.HideMainForm;
  AddLog('Скрываем окно по двойному клику на иконку в трее.');
end
else
begin
  TrayIcon.ShowMainForm;
  AddLog('Показываем окно по двойному клику на иконку в трее.');
end;
end;

procedure Tmainform.TrayIconDblClick(Sender: TObject);
begin
if mainform.Showing then
begin
  Application.Minimize;
  TrayIcon.HideMainForm;
end
else
begin
  TrayIcon.ShowMainForm;
  AddLog('Показываем окно по двойному клику на иконку в трее.');
end;
end;

procedure Tmainform.N23Click(Sender: TObject);
begin
KeyClose:= true;
if ICQClient.LoggedIn then
  ICQClient.LogOff;
if FormLog.Showing then
  FormLog.Close;
if FormEnter.Showing then
  FormEnter.Close;
if FormSettings.Showing then
  FormSettings.Close;
if FormChat.Showing then
  FormChat.Close;
mainform.Close;
end;

procedure Tmainform.N24Click(Sender: TObject);
begin
FormSettings.Show;
AddLog('Вызываем окно настроек из меню иконки в трее.');
end;

procedure Tmainform.CheckBox1Click(Sender: TObject);
begin
  TrayIcon.MinimizeToTray:= CheckBox1.Checked;
end;

procedure Tmainform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:= KeyClose;
  if not CanClose then
  begin
    TrayIcon.HideMainForm;
  end;
end;

procedure Tmainform.N25Click(Sender: TObject);
begin
StatusSend(100, N2.ImageIndex, N2.Caption);
end;

procedure Tmainform.N26Click(Sender: TObject);
begin
StatusSend(101, N1.ImageIndex, N1.Caption);
end;

procedure Tmainform.N27Click(Sender: TObject);
begin
StatusSend(6, N3.ImageIndex, N3.Caption);
end;

procedure Tmainform.N28Click(Sender: TObject);
begin
StatusSend(8, N4.ImageIndex, N4.Caption);
end;

procedure Tmainform.N29Click(Sender: TObject);
begin
StatusSend(9, N5.ImageIndex, N5.Caption);
end;

procedure Tmainform.N30Click(Sender: TObject);
begin
StatusSend(7, N6.ImageIndex, N6.Caption);
end;

procedure Tmainform.N32Click(Sender: TObject);
begin
StatusSend(10, N7.ImageIndex, N7.Caption);
end;

procedure Tmainform.N33Click(Sender: TObject);
begin
StatusSend(11, N10.ImageIndex, N10.Caption);
end;

procedure Tmainform.N34Click(Sender: TObject);
begin
StatusSend(2, N11.ImageIndex, N11.Caption);
end;

procedure Tmainform.N35Click(Sender: TObject);
begin
StatusSend(3, N14.ImageIndex, N14.Caption);
end;

procedure Tmainform.N36Click(Sender: TObject);
begin
StatusSend(4, N12.ImageIndex, N12.Caption);
end;

procedure Tmainform.N37Click(Sender: TObject);
begin
StatusSend(2, N13.ImageIndex, N13.Caption);
end;

procedure Tmainform.N38Click(Sender: TObject);
begin
StatusSend(1, N15.ImageIndex, N15.Caption);
end;
////////////////////////////////////////////////////// процедуры для иконки в трее end

procedure Tmainform.TrayIconMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Pt: TPoint;
begin
  Pt := TrayIcon.GetClientIconPos(X, Y);
end;

procedure Tmainform.PopupMenuTrayPopup(Sender: TObject);
begin
if mainform.Showing then
begin
  N20.Caption:= 'Скрыть';
end
else
begin
  N20.Caption:= 'Показать';
end;
end;

{
procedure Tmainform.ICQClientStatusChange(Sender: TObject; UIN: String;
  Status: Cardinal);
var
i: LongInt;
begin
  SetStatusToStatusList(UIN, Status);
  AddLog(GetNickFor(StrToInt(UIN)) + ' (' + UIN + ') сменил статус на ' + StatusToStr(Status));
end;
}
procedure Tmainform.LoadNode(ANode: PVirtualNode);
var
  CLNode: PCLNode;
begin
  if Assigned(ANode) then
  begin
    CLNode := TreeViewContactList.GetNodeData(ANode);
    with CLNode^ do
    begin
      Edit6.text:= Nik;
      Edit7.text:= UIN;
    end;
  end;
end;
 {
procedure Tmainform.ICQClientStatusChange(Sender: TObject; UIN: String;
  Status: Cardinal);

  function FindNode(ANode: PVirtualNode;
    const APattern: WideString): PVirtualNode;
  var
    NextNode: PVirtualNode;
    CLNode: PCLNode;
  begin
    Result := nil;
    NextNode := ANode.FirstChild;
    if Assigned(NextNode) then
      repeat
        CLNode := TreeViewContactList.GetNodeData(NextNode);
        if Assigned(CLNode) then
          if Length(UIN)>0 then
            if CLNode^.nik = APattern then
            begin
              Result := NextNode;
              Exit;
            end;
        // Ищем в дочерних ветках
        Result := FindNode(NextNode, APattern);
        // Переходим на соседнюю ветку...
        NextNode := NextNode.NextSibling;
      until
        //...пока не вмажемся лбом в стену :)
        NextNode = nil;
  end;

var
  FoundNode: PVirtualNode;
begin
  if TreeViewContactList.RootNodeCount > 0 then
  begin
    FoundNode := FindNode(TreeViewContactList.RootNode, UIN);
    LoadNode(FoundNode);
    if Assigned(FoundNode) then
    begin
      TreeViewContactList.ClearSelection;
      TreeViewContactList.FocusedNode := FoundNode;
      Include(TreeViewContactList.FocusedNode.States, vsSelected);
    end;
  end;
  SetStatusToStatusList(UIN, Status);
end;
}
procedure Tmainform.ICQClientAvatarReceive(Sender: TObject; UIN: String;
  AvatarId: Word; AvatarFlags: Byte; AvatarHash, AvatarData,
  AvatarExt: String);
var
  AvatarFile : TextFile;
begin
  if AvatarData = '' then
    AddLog('У собеседника ' + GetNickFor(StrToInt(UIN)) + ' (' + UIN + ') не поставлена аватара.')
  else
    begin
      AssignFile(AvatarFile, 'contacts\' + UIN + '\' + 'ava' + AvatarExt);
      Rewrite(AvatarFile);
      Write(AvatarFile, AvatarData);
      CloseFile(AvatarFile);
      FormChat.ImageAvatar.Picture.LoadFromFile('contacts\' + UIN + '\' + 'ava' + AvatarExt);
      AddLog('Получена аватара собеседника ' + GetNickFor(StrToInt(UIN)) + ' (' + UIN + ').');
    end;
end;

procedure Tmainform.Button2Click(Sender: TObject);

  function FindNode(ANode: PVirtualNode;
    const APattern: WideString): PVirtualNode;
  var
    NextNode: PVirtualNode;
    CLNode: PCLNode;
  begin
    Result := nil;
    NextNode := ANode.FirstChild;
    if Assigned(NextNode) then
      repeat
        CLNode := TreeViewContactList.GetNodeData(NextNode);
        if Assigned(CLNode) then
          if Length(UIN)>0 then
            if CLNode^.UIN = APattern then
            begin
              Result := NextNode;
              Exit;
            end;
        Result := FindNode(NextNode, APattern); // Ищем в дочерних ветках
        NextNode := NextNode.NextSibling; // Переходим на соседнюю ветку...
      until
        NextNode = nil; //...пока не вмажемся лбом в стену :)
  end;

var
  FoundNode: PVirtualNode;
begin
  if TreeViewContactList.RootNodeCount > 0 then
  begin
    FoundNode := FindNode(TreeViewContactList.RootNode, Edit4.Text);
    LoadNode(FoundNode);
    if Assigned(FoundNode) then
    begin
      TreeViewContactList.ClearSelection;
      TreeViewContactList.FocusedNode := FoundNode;
      Include(TreeViewContactList.FocusedNode.States, vsSelected);
    end;
  end;
end;

procedure Tmainform.FindOfUINNode(ui: integer);

  function FindNode(ANode: PVirtualNode;
    const APattern: WideString): PVirtualNode;
  var
    NextNode: PVirtualNode;
    CLNode: PCLNode;
  begin
    Result := nil;
    NextNode := ANode.FirstChild;
    if Assigned(NextNode) then
      repeat
        CLNode := TreeViewContactList.GetNodeData(NextNode);
        if Assigned(CLNode) then
          if Length(UIN)>0 then
            if CLNode^.UIN = APattern then
            begin
              Result := NextNode;
              Exit;
            end;
        Result := FindNode(NextNode, APattern); // Ищем в дочерних ветках
        NextNode := NextNode.NextSibling; // Переходим на соседнюю ветку...
      until
        NextNode = nil; //...пока не вмажемся лбом в стену :)
  end;

var
  FoundNode: PVirtualNode;
begin
  if TreeViewContactList.RootNodeCount > 0 then
  begin
    FoundNode := FindNode(TreeViewContactList.RootNode, IntToStr(ui));
    if Assigned(FoundNode) then
    begin
      TreeViewContactList.ClearSelection;
      TreeViewContactList.FocusedNode := FoundNode;
      Include(TreeViewContactList.FocusedNode.States, vsSelected);
    end;
  end;
end;

procedure Tmainform.Button3Click(Sender: TObject);
var
  CLNode: PCLNode;
begin
  CLNode := TreeViewContactList.GetNodeData(TreeViewContactList.FocusedNode);
  if Assigned(CLNode) then
    with CLNode^ do
    begin
      Nik := Edit6.Text;
      UIN := Edit7.Text;
      IMGStatus:= 13;
      TreeViewContactList.Invalidate;
    end;
end;

procedure Tmainform.ToolButtonSwithCOntactsClick(Sender: TObject);
begin
inifile:=tinifile.Create(extractfilepath(application.ExeName)+'Confing.ini');
inifile.WriteBool('Main window', 'visibleofflinecontacts', ToolButtonSwithCOntacts.Down);
inifile.Free;
end;

procedure Tmainform.ToolButtonSwitchSoundClick(Sender: TObject);
begin
inifile:=tinifile.Create(extractfilepath(application.ExeName)+'Confing.ini');
inifile.WriteBool('Main window', 'onmusic', ToolButtonSwitchSound.Down);
inifile.Free;
end;

procedure Tmainform.ToolButtonSwitchGroupClick(Sender: TObject);
begin
inifile:=tinifile.Create(extractfilepath(application.ExeName)+'Confing.ini');
inifile.WriteBool('Main window', 'visiblegroup', ToolButtonSwitchGroup.Down);
inifile.Free;
end;

procedure Tmainform.FormCreate(Sender: TObject);
begin
LoadProgSettings;
KeyClose:= false;
GeneralGroupOlreadyCreated:= false;
TreeViewContactList.NodeDataSize := SizeOf(TCLNode);
  UINNickList := TList.Create;
  UINStatusList := TList.Create;
  UINInfoList := TList.Create;
  UINForAvatarsToBeLoadedList := TList.Create;
  TrayIcon.HideTaskbarIcon;
  TrayIcon.MinimizeToTray:=true;
end;

procedure Tmainform.FormDestroy(Sender: TObject);
begin
  UINNickList.Destroy;
  UINStatusList.Destroy;
  UINInfoList.Destroy;
  UINForAvatarsToBeLoadedList.Destroy;
end;

procedure Tmainform.TreeViewContactListCollapsed(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  NewCL: PCLNode;
begin
  NewCL := TreeViewContactList.GetNodeData(Node);
  if Assigned(NewCL) then
    with NewCL^ do
    begin
      IMGStatus:= 50;
      TreeViewContactList.Invalidate;
    end;
end;

procedure Tmainform.TreeViewContactListExpanded(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  NewCL: PCLNode;
begin
  NewCL := TreeViewContactList.GetNodeData(Node);
  if Assigned(NewCL) then
    with NewCL^ do
    begin
      IMGStatus:= 51;
      TreeViewContactList.Invalidate;
    end;
end;

procedure Tmainform.ICQClientStatusChange(Sender: TObject; UIN: String;
  Status: Cardinal);

  function FindNode(ANode: PVirtualNode;
    const APattern: WideString): PVirtualNode;
  var
    NextNode: PVirtualNode;
    CLNode: PCLNode;
  begin
    Result := nil;
    NextNode := ANode.FirstChild;
    if Assigned(NextNode) then
      repeat
        CLNode := TreeViewContactList.GetNodeData(NextNode);
        if Assigned(CLNode) then
          if Length(UIN)>0 then
            if CLNode^.UIN = APattern then
            begin
              Result := NextNode;
              Exit;
            end;
        Result := FindNode(NextNode, APattern); // Ищем в дочерних ветках
        NextNode := NextNode.NextSibling; // Переходим на соседнюю ветку...
      until
        NextNode = nil; //...пока не вмажемся лбом в стену :)
  end;

var
  FoundNode: PVirtualNode;
  CLNode: PCLNode;
  StatusGetting: string;
  ISt: integer;
begin
AddLog(GetNickFor(StrToInt(UIN)) + ' (' + UIN + ') сменил статус на ' + StatusToStr(Status) + ': ' + IntToStr(Status));
SetStatusToStatusList(UIN, Status);
///////// выделяем контакт, которые с енил статус
if TreeViewContactList.RootNodeCount > 0 then
  begin
    FoundNode := FindNode(TreeViewContactList.RootNode, UIN);
    LoadNode(FoundNode);
    if Assigned(FoundNode) then
    begin
      TreeViewContactList.ClearSelection;
      TreeViewContactList.FocusedNode := FoundNode;
      Include(TreeViewContactList.FocusedNode.States, vsSelected);
    end;
  end;
///////// меняем иконку статуса, у контакта, сменившего статус
          	StatusGetting:= GetStatusFor(StrToInt(UIN));
          	ISt:= IdIMGStatusSend(StatusGetting);
  CLNode := TreeViewContactList.GetNodeData(TreeViewContactList.FocusedNode);
  if Assigned(CLNode) then
    with CLNode^ do
    begin
      Nik := Edit6.Text;
      UIN := Edit7.Text;
      IMGStatus:= ISt;
      TreeViewContactList.Invalidate;
    end;
end;

end.


