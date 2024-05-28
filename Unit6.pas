unit Unit6;

interface

uses
  Classes, mmsystem;

type
  music = class(TThread)
  private
    { Private declarations }
    //procedure MusicPlay(IDEvent: integer);
    procedure MusicPlay;
  protected
    procedure Execute; override;
  end;

implementation

uses Unit1;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure music.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ music }

procedure music.Execute;
begin
  { Place thread code here }
  Synchronize(MusicPlay);
end;

//procedure music.MusicPlay(IDEvent: integer);
procedure music.MusicPlay;
begin
  { Place thread code here }
  {
  case IDEvent of
  1: sndplaysound('Sound/startup.wav', SND_ASYNC);
  2: sndplaysound('Sound/online.wav', SND_ASYNC);
  end;
  }
  sndplaysound('Sound/startup.wav', SND_ASYNC);
  while sndplaysound('Sound/startup.wav', SND_ASYNC) do
    if sndplaysound('Sound/startup.wav', SND_ASYNC)<>true then
      mainform.MusicStop;
end;

end.
 