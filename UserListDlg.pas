unit UserListDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, ZjhCtrls, Grids, DBGrids, StdCtrls, Buttons;

type
  TDlgUserList = class(TForm)
    DBGrid1: TDBGrid;
    cdsUser: TZjhDataSet;
    dsUser: TDataSource;
    cdsUserCode_: TStringField;
    cdsUserName_: TStringField;
    cdsUserPassword_: TStringField;
    cdsUserLevel_: TIntegerField;
    cdsUserRemark_: TStringField;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure cdsUserNewRecord(DataSet: TDataSet);
    procedure cdsUserLevel_GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsUserLevel_SetText(Sender: TField; const Text: String);
  private
    { Private declarations }
    slLevel: TStrings;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TDlgUserList.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  slLevel := nil;
  cdsUser.CreateDataSet;
  with DBGrid1 do
  begin
    for i := 0 to Columns.Count - 1 do
    begin
      if Columns[i].Field = cdsUser.FieldByName('Level_') then
      begin
        Columns[i].PickList.Add('0.管理员');
        Columns[i].PickList.Add('1.读写');
        Columns[i].PickList.Add('2.只读');
        slLevel := Columns[i].PickList;
      end;
    end;
  end;
end;

procedure TDlgUserList.cdsUserNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('Level_').AsInteger := 0;
  end;
end;

procedure TDlgUserList.cdsUserLevel_GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if not Assigned(slLevel) then Exit;
  if cdsUser.RecordCount < 1 then Exit;
  Text := slLevel.Strings[Sender.AsInteger];
end;

procedure TDlgUserList.cdsUserLevel_SetText(Sender: TField;
  const Text: String);
begin
  if not Assigned(slLevel) then Exit;
  if slLevel.IndexOf(Text) > -1 then
    Sender.AsInteger := slLevel.IndexOf(Text)
  else
    Sender.AsInteger := 0;
end;

end.
