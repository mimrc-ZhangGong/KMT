unit DisableFileDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBClient, ZjhCtrls;

type
  TDlgDisableFile = class(TForm)
    rbFile: TRadioButton;
    rbDir: TRadioButton;
    edtFileName: TEdit;
    edtDirName: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cdsList: TZjhDataSet;
    dsList: TDataSource;
    cdsListType_: TIntegerField;
    cdsListName_: TStringField;
    DBGrid1: TDBGrid;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    rbExt: TRadioButton;
    edtExtName: TEdit;
    procedure cdsListType_GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure cdsListAfterScroll(DataSet: TDataSet);
    procedure edtDirNameChange(Sender: TObject);
    procedure edtFileNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses ApConst;

{$R *.dfm}

procedure TDlgDisableFile.cdsListType_GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if cdsList.RecordCount > 0 then
  begin
    case Sender.AsInteger of
    1: Text := '文件';
    2: Text := '目录';
    3: Text := '类别';
    end;
  end;
end;

procedure TDlgDisableFile.FormCreate(Sender: TObject);
begin
  cdsList.CreateDataSet;
end;

procedure TDlgDisableFile.BitBtn1Click(Sender: TObject);
begin
  with cdsList do
  begin
    if rbFile.Checked then
      begin
        if not cdsList.Locate('Type_;Name_',VarArrayOf([1,edtFileName.Text]),[loCaseInsensitive]) then
        begin
          Append;
          FieldByName('Type_').AsInteger := 1;
          FieldByName('Name_').AsString := edtFileName.Text;
          Post;
        end;
      end
    else if rbDir.Checked then
      begin
        if not cdsList.Locate('Type_;Name_',VarArrayOf([2,edtDirName.Text]),[loCaseInsensitive]) then
        begin
          Append;
          FieldByName('Type_').AsInteger := 2;
          FieldByName('Name_').AsString := edtDirName.Text;
          Post;
        end;
      end
    else if rbExt.Checked then
      begin
        if not cdsList.Locate('Type_;Name_',VarArrayOf([2,edtDirName.Text]),[loCaseInsensitive]) then
        begin
          Append;
          FieldByName('Type_').AsInteger := 3;
          FieldByName('Name_').AsString := edtExtName.Text;
          Post;
        end;
      end;
  end;
end;

procedure TDlgDisableFile.BitBtn2Click(Sender: TObject);
begin
  with cdsList do
  begin
    if rbFile.Checked then
      begin
        if cdsList.Locate('Type_;Name_',VarArrayOf([1,edtFileName.Text]),[loCaseInsensitive]) then
          Delete;
      end
    else if rbDir.Checked then
      begin
        if cdsList.Locate('Type_;Name_',VarArrayOf([2,edtDirName.Text]),[loCaseInsensitive]) then
          Delete;
      end
    else if rbExt.Checked then
      begin
        if cdsList.Locate('Type_;Name_',VarArrayOf([3,edtExtName.Text]),[loCaseInsensitive]) then
          Delete;
      end;
  end;
end;

procedure TDlgDisableFile.cdsListAfterScroll(DataSet: TDataSet);
begin
  with DataSet do
  begin
    case FieldByName('Type_').AsInteger of
    1:
      begin
        edtFileName.Text := FieldByName('Name_').AsString;
        rbFile.Checked := True;
      end;
    2:
      begin
        edtDirName.Text := FieldByName('Name_').AsString;
        rbDir.Checked := True;
      end;
    3:
      begin
        edtExtName.Text := FieldByName('Name_').AsString;
        rbExt.Checked := True;
      end;
    end;
  end;
end;

procedure TDlgDisableFile.edtDirNameChange(Sender: TObject);
begin
  rbDir.Checked := True;
end;

procedure TDlgDisableFile.edtFileNameChange(Sender: TObject);
begin
  rbFile.Checked := True;
end;

end.
