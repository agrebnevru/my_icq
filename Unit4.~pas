unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, inifiles;

type
  TFormEnter = class(TForm)
    ButtonEnter: TBitBtn;
    ButtonExit: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    EnterUin: TEdit;
    EnterPass: TEdit;
    PasswordVisibleOnEnter: TCheckBox;
    procedure EnterUinChange(Sender: TObject);
    procedure EnterPassChange(Sender: TObject);
    procedure ButtonEnterClick(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEnter: TFormEnter;
  inifile: tinifile;
  PasswordVisible: boolean;

implementation

{$R *.dfm}

procedure TFormEnter.EnterUinChange(Sender: TObject);
begin
ButtonEnter.Enabled:=true;
ButtonExit.Enabled:=true;
end;

procedure TFormEnter.EnterPassChange(Sender: TObject);
begin
ButtonEnter.Enabled:=true;
ButtonExit.Enabled:=true;
end;

procedure TFormEnter.ButtonEnterClick(Sender: TObject);
begin
inifile:=tinifile.Create(extractfilepath(application.ExeName)+'Confing.ini');
inifile.WriteString('Settings Account', 'uin', PChar(FormEnter.EnterUin.Text));
inifile.WriteString('Settings Account', 'password', PChar(FormEnter.EnterPass.Text));
     if PasswordVisibleOnEnter.Checked then
      begin
        inifile.WriteBool('Settings Account', 'passwordvisible', true);
      end
      else
      begin
        inifile.WriteBool('Settings Account', 'passwordvisible', false);
      end;
inifile.Free;
Close;
end;

procedure TFormEnter.ButtonExitClick(Sender: TObject);
begin
close;
end;

procedure TFormEnter.FormCreate(Sender: TObject);
begin
inifile:=tinifile.Create(extractfilepath(application.ExeName)+'Confing.ini');
PasswordVisible:=inifile.ReadBool('Settings Account', 'passwordvisible', false);
inifile.Free;
if PasswordVisible = true then
  begin
  PasswordVisibleOnEnter.Checked:= true;
  EnterPass.PasswordChar:= Char(#0);
end
else
begin
  PasswordVisibleOnEnter.Checked:= false;
  EnterPass.PasswordChar:= Char('*');
end;
end;

end.
