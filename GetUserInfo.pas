{��������� ������������ ��������� �������� � ��������� ������}
unit GetUserInfo;

interface

uses Classes;

type
  PUINNickItem = ^TUINNickItem;
  TUINNickItem = record
    UIN : LongWord;
    Nick : ShortString;
  end;

  PUINStatusItem = ^TUINStatusItem;
  TUINStatusItem = record
    UIN, Status : LongWord;
  end;

  TUINInfoCaps = record
    serverrelay,
    xtarz,
    filetransfer,
    rtf,
    typingnots,
    utf8 : 0..1;
  end;

  TUINInfoAvatar = record
    Id : Word;
    Flags : Byte;
    Hash : ShortString;
  end;

  PUINInfoItem = ^TUINInfoItem;
  TUINInfoItem = record
    UIN : LongWord;
    Caps : TUINInfoCaps;
    Avatar : TUINInfoAvatar;
  end;

  {PUINForAvatarsToBeLoadedItem = ^TUINForAvatarsToBeLoadedItem;
  TUINForAvatarsToBeLoadedItem = Cardinal;}

function GetNickFor(UIN : Cardinal) : ShortString;
function GetStatusFor(UIN : Cardinal) : String;
function GetCapsFor(UIN : Cardinal) : TUINInfoCaps;
function GetAvatarInfoFor(UIN : Cardinal) : TUINInfoAvatar;
//function IsThereUINForNextAvatarToBeLoaded : Boolean;
//function GetUINForNextAvatarToBeLoaded : Cardinal;

procedure SetStatusToStatusList(UIN: String; Status: Cardinal);
procedure SetInfoToInfoList(UIN, Caps : String; AvatarId: Word; AvatarFlags: Byte; AvatarHash: String);
//procedure AddUINForAvatarToBeLoaded(UIN : String);
//procedure DeleteUINForAvatarToBeLoaded(UIN : String);

var
  UINNickList, UINStatusList, UINInfoList, UINForAvatarsToBeLoadedList : TList;

implementation

uses ICQWorks;

function GetNickFor(UIN : Cardinal) : ShortString;
var
  Rs : ShortString;
  i : LongInt;
begin
  Rs := '<������������ �� � ������>';
  if UINNickList.Count > 0 then
    for i := 0 to UINNickList.Count - 1 do
      if PUINNickItem(UINNickList.Items[i])^.UIN = UIN then
        Rs := PUINNickItem(UINNickList.Items[i])^.Nick;
  Result := Rs;
end;

function GetStatusFor(UIN : Cardinal) : String;
var
  Rs : String;
  i : LongInt;
begin
  Rs := StatusToStr(S_OFFLINE);
  if UINStatusList.Count > 0 then
    for i := 0 to UINStatusList.Count - 1 do
      if PUINStatusItem(UINStatusList.Items[i])^.UIN = UIN then
        Rs := StatusToStr(PUINStatusItem(UINStatusList.Items[i])^.Status);
  Result := Rs;
end;

function GetCapsFor(UIN : Cardinal) : TUINInfoCaps;
var
  Rs : TUINInfoCaps;
  i : LongInt;
begin
  Rs.serverrelay := 0;
  Rs.xtarz := 0;
  Rs.filetransfer := 0;
  Rs.rtf := 0;
  Rs.typingnots := 0;
  Rs.utf8 := 0;
  if UINInfoList.Count > 0 then
    for i := 0 to UINInfoList.Count - 1 do
      if PUINInfoItem(UINInfoList.Items[i])^.UIN = UIN then
        Rs := PUINInfoItem(UINInfoList.Items[i])^.Caps;
  Result := Rs;
end;

function GetAvatarInfoFor(UIN : Cardinal) : TUINInfoAvatar;
var
  Rs : TUINInfoAvatar;
  i : LongInt;
begin
  Rs.Id := 0;
  Rs.Flags := 0;
  Rs.Hash := '';
  if UINInfoList.Count > 0 then
    for i := 0 to UINInfoList.Count - 1 do
      if PUINInfoItem(UINInfoList.Items[i])^.UIN = UIN then
        Rs := PUINInfoItem(UINInfoList.Items[i])^.Avatar;
  Result := Rs;
end;

{function IsThereUINForNextAvatarToBeLoaded : Boolean;
begin
  if UINForAvatarsToBeLoadedList.Count > 0 then
    Result := True
  else
    Result := False;
end;

function GetUINForNextAvatarToBeLoaded : Cardinal;
var
  Rs : Cardinal;
begin
  Rs := 0;
  if UINForAvatarsToBeLoadedList.Count > 0 then
    begin
      Rs := PUINForAvatarsToBeLoadedItem(UINForAvatarsToBeLoadedList.First)^;
      UINForAvatarsToBeLoadedList.Delete(0);
    end;
  Result := Rs;
end;}


procedure SetStatusToStatusList(UIN: String; Status: Cardinal);
var
  UINStatusItem : PUINStatusItem;
  i : LongInt;
  InListAlready : Boolean;
begin
  InListAlready := False;
  if UINStatusList.Count > 0 then
    for i := 0 to UINStatusList.Count - 1 do
      if PUINStatusItem(UINStatusList.Items[i])^.UIN = StrToInt(UIN) then
        begin
          InListAlready := True;
          PUINStatusItem(UINStatusList.Items[i])^.Status := Status;
        end;
  if InListAlready = False then
    begin
      GetMem(UINStatusItem, SizeOf(UINStatusItem^));
      UINStatusItem^.UIN := StrToInt(UIN);
      UINStatusItem^.Status := Status;
      UINStatusList.Add(UINStatusItem);
    end;
end;

procedure SetCapsInCaps(Caps : String; var DestCaps : TUINInfoCaps);
begin
  DestCaps.serverrelay := 0;
  DestCaps.xtarz := 0;
  DestCaps.filetransfer := 0;
  DestCaps.rtf := 0;
  DestCaps.typingnots := 0;
  DestCaps.utf8 := 0;
  if Pos(caps_aim_server_relay, Caps) > 0 then DestCaps.serverrelay := 1;
  if Pos(caps_xtraz, Caps) > 0 then DestCaps.xtarz := 1;
  if Pos(caps_file_transfer, Caps) > 0 then DestCaps.filetransfer := 1;
  if Pos(caps_rtf_messages, Caps) > 0 then DestCaps.rtf := 1;
  if Pos(caps_typing_notifications, Caps) > 0 then DestCaps.typingnots := 1;
  if Pos(caps_utf8, Caps) > 0 then DestCaps.utf8 := 1;
end;

procedure SetAvatarInAvatar(AvatarId: Word; AvatarFlags: Byte; AvatarHash: String; var DestAvatar : TUINInfoAvatar);
begin
  DestAvatar.Id := AvatarId;
  DestAvatar.Flags := AvatarFlags;
  DestAvatar.Hash := AvatarHash;
end;

procedure SetInfoToInfoList(UIN, Caps : String; AvatarId: Word; AvatarFlags: Byte; AvatarHash: String);
var
  UINInfoItem : PUINInfoItem;
  i : LongInt;
  InListAlready : Boolean;
begin
  InListAlready := False;
  if UINInfoList.Count > 0 then
    for i := 0 to UINInfoList.Count - 1 do
      if PUINInfoItem(UINInfoList.Items[i])^.UIN = StrToInt(UIN) then
        begin
          InListAlready := True;
          SetCapsInCaps(Caps, PUINInfoItem(UINInfoList.Items[i])^.Caps);
          SetAvatarInAvatar(AvatarId, AvatarFlags, AvatarHash, PUINInfoItem(UINInfoList.Items[i])^.Avatar);
        end;
  if InListAlready = False then
    begin
      GetMem(UINInfoItem, SizeOf(UINInfoItem^));
      UINInfoItem^.UIN := StrToInt(UIN);
      SetCapsInCaps(Caps, UINInfoItem^.Caps);
      SetAvatarInAvatar(AvatarId, AvatarFlags, AvatarHash, UINInfoItem^.Avatar);
      UINInfoList.Add(UINInfoItem);
    end;
end;

{procedure AddUINForAvatarToBeLoaded(UIN : String);
var
  UINForAvatarsToBeLoadedItem : PUINForAvatarsToBeLoadedItem;
  i : LongInt;
  InListAlready : Boolean;
begin
  InListAlready := False;
  if UINForAvatarsToBeLoadedList.Count > 0 then
    for i := 0 to UINForAvatarsToBeLoadedList.Count - 1 do
      if PUINForAvatarsToBeLoadedItem(UINForAvatarsToBeLoadedList.Items[i])^ = StrToInt(UIN) then
        InListAlready := True;
  if InListAlready = False then
    begin
      GetMem(UINForAvatarsToBeLoadedItem, SizeOf(UINForAvatarsToBeLoadedItem^));
      UINForAvatarsToBeLoadedItem^ := StrToInt(UIN);
      UINForAvatarsToBeLoadedList.Add(UINForAvatarsToBeLoadedItem);
    end;
end;

procedure DeleteUINForAvatarToBeLoaded(UIN : String);
var
  i : LongInt;
begin
  //���� � ������, �� �������
  if UINForAvatarsToBeLoadedList.Count > 0 then
    for i := 0 to UINForAvatarsToBeLoadedList.Count - 1 do
      if PUINForAvatarsToBeLoadedItem(UINForAvatarsToBeLoadedList.Items[i])^ = StrToInt(UIN) then
        UINForAvatarsToBeLoadedList.Delete(i);
end;}

end.
