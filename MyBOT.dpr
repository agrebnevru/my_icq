program MyBOT;

uses
  Forms,
  Unit1 in 'Unit1.pas' {mainform},
  Unit2 in 'Unit2.pas' {FormSettings},
  Unit3 in 'Unit3.pas' {FormChat},
  Unit4 in 'Unit4.pas' {FormEnter},
  Unit5 in 'Unit5.pas' {FormLog},
  Unit6 in 'Unit6.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tmainform, mainform);
  Application.CreateForm(TFormChat, FormChat);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.CreateForm(TFormEnter, FormEnter);
  Application.CreateForm(TFormLog, FormLog);
  Application.Run;
end.
