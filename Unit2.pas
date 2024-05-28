unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, inifiles, ImgList, ExtCtrls;

type
  TFormSettings = class(TForm)
    Settings: TPageControl;
    SettingsPage1: TTabSheet;
    SettingsPage3: TTabSheet;
    SettingsPage4: TTabSheet;
    SettingsPage5: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    EditLogin: TEdit;
    EditPassword: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EditSettingsPage4Server: TEdit;
    EditSettingsPage4Port: TEdit;
    GroupBox1: TGroupBox;
    EditSettingsPage4Timeaut: TEdit;
    Label7: TLabel;
    ImageListSettingsMenu: TImageList;
    PasswordVisible: TCheckBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    TransparentCheckBox: TCheckBox;
    TransparentCheckBoxNotActive: TCheckBox;
    TransparentTrackBar: TTrackBar;
    ButtonSettingsPageCancel: TButton;
    ButtonSettingsPagePrimenit: TButton;
    ButtonSettingsPageOk: TButton;
    SettingsPage2: TTabSheet;
    GroupBox5: TGroupBox;
    UPPanelOnChatWindow: TCheckBox;
    DownPanelOnChatWindow: TCheckBox;
    CenterPanelOnChatWindow: TCheckBox;
    Label5: TLabel;
    AlignCenterPanelRight: TRadioButton;
    AlignCenterPanelLeft: TRadioButton;
    GroupBox4: TGroupBox;
    VisUpToolBarCL: TCheckBox;
    VisDownToolBarCL: TCheckBox;
    ButtomPanel: TPanel;
    GroupBox6: TGroupBox;
    CheckBoxMainFormOnTop: TCheckBox;
    SettingsPage6: TTabSheet;
    procedure EditSettingsPage4ServerChange(Sender: TObject);
    procedure EditSettingsPage4PortChange(Sender: TObject);
    procedure EditSettingsPage4TimeautChange(Sender: TObject);
    procedure EditSettingsPage4HTTPServerChange(Sender: TObject);
    procedure EditSettingsPage4HTTPPortChange(Sender: TObject);
    procedure EditSettingsPage4HTTPTimeautChange(Sender: TObject);
    procedure EditLoginChange(Sender: TObject);
    procedure EditPasswordChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SettingsLoad;
    procedure SettingsSave;
    procedure PasswordVisibleClick(Sender: TObject);
    procedure TransparentTrackBarChange(Sender: TObject);
    procedure TransparentCheckBoxClick(Sender: TObject);
    procedure TransparentCheckBoxNotActiveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UPPanelOnChatWindowClick(Sender: TObject);
    procedure CenterPanelOnChatWindowClick(Sender: TObject);
    procedure DownPanelOnChatWindowClick(Sender: TObject);
    procedure AlignCenterPanelRightClick(Sender: TObject);
    procedure AlignCenterPanelLeftClick(Sender: TObject);
    procedure VisUpToolBarCLClick(Sender: TObject);
    procedure VisDownToolBarCLClick(Sender: TObject);
    procedure ButtonSettingsPagePrimenitClick(Sender: TObject);
    procedure ButtonSettingsPageCancelClick(Sender: TObject);
    procedure ButtonSettingsPageOkClick(Sender: TObject);
    procedure CheckBoxMainFormOnTopClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSettings: TFormSettings;
  inifile: tinifile;
  IssetUIN, IssetPassword: boolean;

implementation

uses Unit1, Unit5, Unit3;

{$R *.dfm}
/////////////////////////////////////////////////////////////////////// активация кнопки "применить" begin
procedure TFormSettings.EditSettingsPage4ServerChange(Sender: TObject);
begin
ButtonSettingsPagePrimenit.Enabled:=True;
end;

procedure TFormSettings.EditSettingsPage4PortChange(Sender: TObject);
begin
ButtonSettingsPagePrimenit.Enabled:=True;
end;

procedure TFormSettings.EditSettingsPage4TimeautChange(Sender: TObject);
begin
ButtonSettingsPagePrimenit.Enabled:=True;
end;

procedure TFormSettings.EditSettingsPage4HTTPServerChange(Sender: TObject);
begin
ButtonSettingsPagePrimenit.Enabled:=True;
end;

procedure TFormSettings.EditSettingsPage4HTTPPortChange(Sender: TObject);
begin
ButtonSettingsPagePrimenit.Enabled:=True;
end;

procedure TFormSettings.EditSettingsPage4HTTPTimeautChange(
  Sender: TObject);
begin
ButtonSettingsPagePrimenit.Enabled:=True;
end;

procedure TFormSettings.EditLoginChange(Sender: TObject);
begin
ButtonSettingsPagePrimenit.Enabled:=True;
end;

procedure TFormSettings.EditPasswordChange(Sender: TObject);
begin
ButtonSettingsPagePrimenit.Enabled:=True;
end;
/////////////////////////////////////////////////////////////////////// активация кнопки "применить" end

procedure TFormSettings.FormCreate(Sender: TObject);
begin
SettingsLoad;
if mainform.ICQClient.LoggedIn then
  GroupBox2.Enabled:= false;
end;
//////////////////////// процедуры сохранения/загрузки настроек из файла настроек begin
procedure TFormSettings.SettingsLoad;
var
poscenterpanelchat: integer;
begin
inifile:= tinifile.Create(extractfilepath(application.ExeName)+'Confing.ini');
EditLogin.Text:= inifile.ReadString('Settings Account', 'uin', '');
EditPassword.Text:= inifile.ReadString('Settings Account', 'password', '');
if Length(EditLogin.Text)<1 then
  IssetUIN:=false;
if Length(EditPassword.Text)<1 then
  IssetPassword:=false;
PasswordVisible.Checked:= inifile.ReadBool('Settings Account', 'passwordvisible', false);
EditSettingsPage4Server.Text:= inifile.ReadString('Settings Connect', 'simplserver', 'login.icq.com');
EditSettingsPage4Port.Text:= IntToStr(inifile.ReadInteger('Settings Connect', 'simpleport', 5190));
EditSettingsPage4Timeaut.Text:= IntToStr(inifile.ReadInteger('Settings Connect', 'simpletimeaut', 0));
VisUpToolBarCL.Checked:= inifile.ReadBool('Settings CL', 'visibleuptoolbar', true);
VisDownToolBarCL.Checked:= inifile.ReadBool('Settings CL', 'visibledowntoolbar', true);
TransparentCheckBox.Checked:= inifile.ReadBool('Settings CL', 'transparentkey', false);
TransparentCheckBoxNotActive.Checked:= inifile.ReadBool('Settings CL', 'transparentnotactive', true);
TransparentTrackBar.Position:= inifile.ReadInteger('Settings CL', 'transparentvalue', 255);
CheckBoxMainFormOnTop.Checked:= inifile.ReadBool('Settings Chat', 'mainontop', false);
if PasswordVisible.Checked then
  EditPassword.PasswordChar:= Char(#0);
if PasswordVisible.Checked<>true then
  EditPassword.PasswordChar:= Char('*');
poscenterpanelchat:= inifile.ReadInteger('Settings Chat', 'aligncenterpanel', 1);
if poscenterpanelchat=1 then
   AlignCenterPanelRight.Checked:=true;
if poscenterpanelchat=2 then
   AlignCenterPanelLeft.Checked:=true;
UPPanelOnChatWindow.Checked:= inifile.ReadBool('Settings Chat', 'visibleuppanel', true);
CenterPanelOnChatWindow.Checked:= inifile.ReadBool('Settings Chat', 'visiblecenterpanel', true);
DownPanelOnChatWindow.Checked:= inifile.ReadBool('Settings Chat', 'visibledownpanel', true);
inifile.Free;
end;

procedure TFormSettings.SettingsSave;
begin
inifile:=tinifile.Create(extractfilepath(application.ExeName)+'Confing.ini');
// страница 1
    inifile.WriteBool('Settings CL', 'transparentkey', TransparentCheckBox.Checked);
    inifile.WriteBool('Settings CL', 'transparentnotactive', TransparentCheckBoxNotActive.Checked);
    inifile.WriteInteger('Settings CL', 'transparentvalue', TransparentTrackBar.Position);
    inifile.WriteBool('Settings CL', 'visibleuptoolbar', VisUpToolBarCL.Checked);
    inifile.WriteBool('Settings CL', 'visibledowntoolbar', VisDownToolBarCL.Checked);
    inifile.WriteBool('Settings CL', 'mainontop', CheckBoxMainFormOnTop.Checked);
// страница 3
    inifile.WriteBool('Settings Chat', 'visibleuppanel', UPPanelOnChatWindow.Checked);
    inifile.WriteBool('Settings Chat', 'visiblecenterpanel', CenterPanelOnChatWindow.Checked);
    inifile.WriteBool('Settings Chat', 'visibledownpanel', DownPanelOnChatWindow.Checked);
    if AlignCenterPanelRight.Checked then
      inifile.WriteInteger('Settings Chat', 'aligncenterpanel', 1);
    if AlignCenterPanelLeft.Checked then
      inifile.WriteInteger('Settings Chat', 'aligncenterpanel', 2);
// страница 4
    inifile.WriteString('Settings Connect', 'simplserver', EditSettingsPage4Server.Text);
    inifile.WriteInteger('Settings Connect', 'simpleport', StrToInt(EditSettingsPage4Port.Text));
    inifile.WriteInteger('Settings Connect', 'simpletimeaut', StrToInt(EditSettingsPage4Timeaut.Text));
// страница 5
    inifile.WriteString('Settings Account', 'uin', EditLogin.Text);
    inifile.WriteString('Settings Account', 'password', EditPassword.Text);
    inifile.WriteBool('Settings Account', 'passwordvisible', PasswordVisible.Checked);
    mainform.ICQClient.UIN:= StrToInt(EditLogin.Text);
    mainform.ICQClient.Password:= EditPassword.Text;
inifile.Free;
end;
//////////////////////// процедуры сохранения/загрузки настроек из файла настроек end

procedure TFormSettings.PasswordVisibleClick(Sender: TObject);
begin
if PasswordVisible.Checked then
begin
EditPassword.PasswordChar:= Char(#0);
end
else
begin
EditPassword.PasswordChar:= Char('*');
end;
ButtonSettingsPagePrimenit.Enabled:=true;
end;

procedure TFormSettings.TransparentTrackBarChange(Sender: TObject);
begin
mainform.AlphaBlendValue:= TransparentTrackBar.Position;
ButtonSettingsPagePrimenit.Enabled:=true;
end;

procedure TFormSettings.TransparentCheckBoxClick(Sender: TObject);
begin
mainform.AlphaBlend:= TransparentCheckBox.Checked;
ButtonSettingsPagePrimenit.Enabled:=true;
end;

procedure TFormSettings.TransparentCheckBoxNotActiveClick(Sender: TObject);
begin
ButtonSettingsPagePrimenit.Enabled:=true;
end;

procedure TFormSettings.FormShow(Sender: TObject);
begin
ButtonSettingsPagePrimenit.Enabled:=false;
end;

procedure TFormSettings.UPPanelOnChatWindowClick(Sender: TObject);
begin
if FormChat.Showing then
  FormChat.UpPanel.Visible:= UPPanelOnChatWindow.Checked;
ButtonSettingsPagePrimenit.Enabled:=true;
end;

procedure TFormSettings.CenterPanelOnChatWindowClick(Sender: TObject);
begin
if FormChat.Showing then
  FormChat.RightLeftPanel.Visible:= CenterPanelOnChatWindow.Checked;
ButtonSettingsPagePrimenit.Enabled:=true;
end;

procedure TFormSettings.DownPanelOnChatWindowClick(Sender: TObject);
begin
if FormChat.Showing then
  FormChat.Panel1.Visible:= DownPanelOnChatWindow.Checked;
ButtonSettingsPagePrimenit.Enabled:=true;
end;

procedure TFormSettings.AlignCenterPanelRightClick(Sender: TObject);
begin
FormChat.RightLeftPanel.Align:= alRight;
ButtonSettingsPagePrimenit.Enabled:=true;
end;

procedure TFormSettings.AlignCenterPanelLeftClick(Sender: TObject);
begin
FormChat.RightLeftPanel.Align:= alLeft;
ButtonSettingsPagePrimenit.Enabled:=true;
end;

procedure TFormSettings.VisUpToolBarCLClick(Sender: TObject);
begin
mainform.UpToolBar.Visible:= VisUpToolBarCL.Checked;
ButtonSettingsPagePrimenit.Enabled:=true;
end;

procedure TFormSettings.VisDownToolBarCLClick(Sender: TObject);
begin
mainform.DownToolBar.Visible:= VisDownToolBarCL.Checked;
ButtonSettingsPagePrimenit.Enabled:=true;
end;

procedure TFormSettings.ButtonSettingsPagePrimenitClick(Sender: TObject);
begin
SettingsSave;
ButtonSettingsPagePrimenit.Enabled:= false;
end;

procedure TFormSettings.ButtonSettingsPageCancelClick(Sender: TObject);
begin
Close;
end;

procedure TFormSettings.ButtonSettingsPageOkClick(Sender: TObject);
begin
SettingsSave;
Close;
end;

procedure TFormSettings.CheckBoxMainFormOnTopClick(Sender: TObject);
begin
if CheckBoxMainFormOnTop.Checked then
  mainform.FormStyle:= fsStayOnTop;
if CheckBoxMainFormOnTop.Checked<>true then
  mainform.FormStyle:= fsnormal;
ButtonSettingsPagePrimenit.Enabled:= true;
end;

end.
