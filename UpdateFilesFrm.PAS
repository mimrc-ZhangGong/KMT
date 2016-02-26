unit UpdateFilesFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, ComCtrls, StdCtrls, Buttons, DB, DateUtils,
  DBClient, ZjhCtrls, DBCtrls, xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TKMTRecord = Record
    Name: String;
    Time: Integer;
    Size: Integer;
  end;
  TFrmUpdateFiles = class(TForm)
    cdsView: TZjhDataSet;
    dsView: TDataSource;
    cdsViewFileName_: TStringField;
    cdsViewFileDateTime_: TDateTimeField;
    cdsViewFileSize_: TFloatField;
    cdsViewType_: TIntegerField;
    cdsViewTag_: TIntegerField;
    cdsViewUP_: TIntegerField;
    cdsViewLocalNo_: TIntegerField;
    cdsViewServerNo_: TIntegerField;
    MainMenu1: TMainMenu;
    O1: TMenuItem;
    popCheck: TMenuItem;
    popBatchUpdate: TMenuItem;
    O2: TMenuItem;
    S1: TMenuItem;
    N1: TMenuItem;
    C2: TMenuItem;
    A2: TMenuItem;
    E1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    T1: TMenuItem;
    pasdfm1: TMenuItem;
    pasdfm2: TMenuItem;
    Delphi1: TMenuItem;
    N6: TMenuItem;
    I1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    O3: TMenuItem;
    N5: TMenuItem;
    popEncryptFile: TMenuItem;
    popNewProject: TMenuItem;
    N7: TMenuItem;
    D1: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    popFastCheck: TMenuItem;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtLocalPath: TEdit;
    edtServerPath: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtLocalTime: TEdit;
    edtLocalSize: TEdit;
    edtServerTime: TEdit;
    edtServerSize: TEdit;
    cboUP: TDBComboBox;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    rbChanged1: TRadioButton;
    rbChanged3: TRadioButton;
    rbChanged2: TRadioButton;
    chkChanged: TCheckBox;
    GroupBox1: TGroupBox;
    rbNewLocal1: TRadioButton;
    rbNewLocal2: TRadioButton;
    GroupBox2: TGroupBox;
    rbNewServer1: TRadioButton;
    rbNewServer2: TRadioButton;
    chkNewServer: TCheckBox;
    chkNewLocal: TCheckBox;
    cdsViewRemark_: TStringField;
    H1: TMenuItem;
    TabSheet3: TTabSheet;
    DBGrid2: TDBGrid;
    cdsHistory: TZjhDataSet;
    dsHistory: TDataSource;
    cdsHistoryIndex_: TStringField;
    cdsHistoryFileTime_: TDateTimeField;
    cdsHistoryFileSize_: TFloatField;
    cdsHistoryRemark_: TStringField;
    pb1: TProgressBar;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label10: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Edit5: TEdit;
    btnCacel: TBitBtn;
    N15: TMenuItem;
    S2: TMenuItem;
    A1: TMenuItem;
    N16: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewType_GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsViewAfterScroll(DataSet: TDataSet);
    procedure cdsViewUP_GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsViewUP_SetText(Sender: TField; const Text: String);
    procedure cdsViewBeforeInsert(DataSet: TDataSet);
    procedure popCheckClick(Sender: TObject);
    procedure popBatchUpdateClick(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure O2Click(Sender: TObject);
    procedure TreeView1Editing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure cdsViewFileDateTime_GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure pasdfm1Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure pasdfm2Click(Sender: TObject);
    procedure chkChangedClick(Sender: TObject);
    procedure popNewProjectClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure N5Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure H1Click(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure btnCacelClick(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure S2Click(Sender: TObject);
  private
    { Private declarations }
    m_Caption: String;
    FkmpFile: TXMLDocument;
    LastFileNo: Integer;
    arLocal, arServer: array of TKMTRecord;
    slDisableFile, slDisableDir, slDisableExt: TStringList;
    procedure DeleteFileOfServer(const ServerFile: String);
    procedure LoadOptionFile(const FileName: String);
    procedure SetkmpFile(const Value: TXMLDocument);
    property kmpFile: TXMLDocument read FkmpFile write SetkmpFile;
    procedure RefreshUPOfView;
    procedure SetViewCurrentRecord;
    function DisplayTotalSize: Double;
  private
    { Private declarations }
    function AllowFileExt(const FileName: String): Boolean;
    function AllowFilePath(const FileName: String): Boolean;
    procedure GetLocalFiles(Files: TStrings; const strPath: String);
    procedure GetServerFiles(Files: TStrings; const strPath: String);
    procedure CopyFileToServer(Root: IXMLNode; const LocalFile,
      ServerFile, Remark: String; sr: TKMTRecord);
  public
    { Public declarations }
  end;

var
  FrmUpdateFiles: TFrmUpdateFiles;

implementation

uses ApConst, DisableFileDlg, UserListDlg;

{$R *.dfm}

procedure CreateFixedPath(const strPath: String);
var
  str: String;
begin
  if Copy(strPath, Length(strPath), 1) = '\' then
    str := Copy(strPath, 1, Length(strPath)-1)
  else
    str := strPath;
  if not DirectoryExists(str) then
  begin
    if DirectoryExists(ExtractFilePath(str)) then
      begin
        if not CreateDir(str) then
          raise Exception.CreateFmt('Cannot create %s', [str]);
      end
    else
      CreateFixedPath(ExtractFilePath(str));
  end;
end;

function GetXMLNode(Root: IXMLNode; const Key: String): IXMLNode;
begin
  Result := Root.ChildNodes.FindNode(Key);
  if not Assigned(Result) then
    Result := Root.AddChild(Key);
end;

procedure TFrmUpdateFiles.cdsViewType_GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  case Sender.AsInteger of
  0: Text := '查看';
  1: Text := '变更';
  2: Text := '增加';
  3: Text := '遗失';
  end;
end;

procedure TFrmUpdateFiles.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  LastFileNo := 1;
  m_Caption := Self.Caption;
  popBatchUpdate.Enabled := False;
  Application.Title := Self.Caption;
  with cboUP.Items do
  begin
    Add('不处理');
    Add('=>主机');
    Add('本地<=');
    Add('从主机移除');
    Add('从本地移除');
  end;
  for i := 0 to DBGrid1.Columns.Count - 1 do
  begin
    if DBGrid1.Columns[i].Field = cdsView.FieldByName('UP_') then
    begin
      DBGrid1.Columns[i].PickList.Assign(cboUP.Items);
      Break;
    end;
  end;
  PageControl1.ActivePageIndex := 0;
  slDisableExt := TStringList.Create;
  slDisableDir := TStringList.Create;
  slDisableFile := TStringList.Create;
  cdsHistory.CreateDataSet;
  cdsView.CreateDataSet;
  if (ParamCount > 0) and FileExists(ParamStr(1)) and
    (UpperCase(ExtractFileExt(ParamStr(1))) = UpperCase('.kmp')) then
    LoadOptionFile(ParamStr(1));
end;

procedure TFrmUpdateFiles.GetLocalFiles(Files: TStrings;
  const strPath: String);
var
  sr: TSearchRec;
  strFile: String;
begin
  //将 strPath 指定路径下所有的文件及子目录存入到 Files 中。
  Application.ProcessMessages;
  if FindFirst(strpath + '\*.*', faAnyFile, sr) = 0 then
  begin
    repeat
      if not ((sr.Name = '.') or (sr.Name = '..')) then
      begin
        strFile := Copy(strPath,Length(edtLocalPath.Text)+1,Length(strPath)) + '\' + sr.Name;
        if DirectoryExists(strPath + '\' + sr.Name) then
          GetLocalFiles(Files, strPath + '\' + sr.Name)
        else if FileExists(strPath + '\' + sr.Name)
          and AllowFileExt(strPath + '\' + sr.Name) and AllowFilePath(strFile) then
          begin
            Files.Add(strFile);
            SetLength(arLocal,High(arLocal)+2);
            with arLocal[High(arLocal)] do
            begin
              Name := strPath + '\' + sr.Name;
              Time := sr.Time;
              Size := sr.Size;
            end;
          end;
      end;
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
end;

procedure TFrmUpdateFiles.GetServerFiles(Files: TStrings;
  const strPath: String);
var
  i: Integer;
  sl: TStringList;
  sr: TSearchRec;
  xml: TXMLDocument;
  PathName, strFile: String;
  Root, Child, Item: IXMLNode;
begin
  if popEncryptFile.Checked then
    begin
      sl := TStringlist.Create;
      xml := TXMLDocument.Create(Self);
      try
        if not FileExists(edtServerPath.Text + '\Index.km') then Exit;
        xml.LoadFromFile(edtServerPath.Text + '\Index.km');
        if xml.DocumentElement = nil then Exit;
        Root := xml.DocumentElement.ChildNodes.FindNode('Files');
        if Root = nil then Exit;
        Child := Root.ChildNodes.First;
        while Child <> nil do
        begin
          Item := Child.ChildNodes.FindNode('Name');
          PathName := ExtractFilePath(Item.NodeValue);
          if FindFirst(edtServerPath.Text + '\' + Child.NodeName + '.kmd', faAnyFile, sr) = 0 then
          begin
            strFile := Copy(PathName,Length(edtServerPath.Text)+1,Length(PathName))
              + ExtractFileName(Item.NodeValue);
            if AllowFileExt(Item.NodeValue) and AllowFilePath(strFile) then
            begin
              if Files.IndexOf(strFile) = - 1 then
                begin
                  Files.Add(strFile);
                  SetLength(arServer,High(arServer)+2);
                  with arServer[High(arServer)] do
                  begin
                    Name := Child.NodeName + '.kmd';
                    Time := sr.Time;
                    Size := sr.Size;
                  end;
                end
              else //发现重复的文件
                begin
                  DeleteFile(edtServerPath.Text + '\' + Child.NodeName + '.kmd');
                  sl.Add(Item.NodeName);
                end;
            end;
            FindClose(sr);
          end;
          Child := Child.NextSibling;
        end;
        if sl.Count > 0 then
        begin
          for i := 0 to sl.Count - 1 do
            Root.ChildNodes.Delete(sl.Strings[i]);
          xml.SaveToFile;
        end;
      finally
        FreeAndNil(xml);
        FreeAndNil(sl);
      end;
    end
  else
    begin
      if FindFirst(strpath + '\*.*', faAnyFile, sr) = 0 then
      begin
        repeat
          if not ((sr.Name = '.') or (sr.Name = '..')) then
          begin
            strFile := Copy(strPath,Length(edtServerPath.Text)+1,Length(strPath)) + '\' + sr.Name;
            if DirectoryExists(strPath + '\' + sr.Name) then
              GetServerFiles(Files, strPath + '\' + sr.Name)
            else if FileExists(strPath + '\' + sr.Name)
              and AllowFileExt(strPath + '\' + sr.Name) and AllowFilePath(strFile) then
              begin
                Files.Add(strFile);
                SetLength(arServer,High(arServer)+2);
                with arServer[High(arServer)] do
                begin
                  Name := strPath + '\' + sr.Name;
                  Time := sr.Time;
                  Size := sr.Size;
                end;
              end;
          end;
        until FindNext(sr) <> 0;
        FindClose(sr);
      end;
    end;
end;

procedure TFrmUpdateFiles.cdsViewAfterScroll(DataSet: TDataSet);
var
  FileNo: Integer;
begin
  with DataSet do
  begin
    if ControlsDisabled then Exit;
    edtLocalTime.Text := '';
    edtLocalSize.Text := '';
    edtServerTime.Text := '';
    edtServerSize.Text := '';
    case FieldByName('Type_').AsInteger of
    1: //变更
      begin
        FileNo := FieldByName('LocalNo_').AsInteger;
        edtLocalTime.Text := DateTimeToStr(FileDateToDateTime(arLocal[FileNo].Time));
        edtLocalSize.Text := FloatToStr(arLocal[FileNo].Size);
        FileNo := FieldByName('ServerNo_').AsInteger;
        edtServerTime.Text := DateTimeToStr(FileDateToDateTime(arServer[FileNo].Time));
        edtServerSize.Text := FloatToStr(arServer[FileNo].Size);
      end;
    2: //本地有，主机无
      begin
        FileNo := FieldByName('LocalNo_').AsInteger;
        edtLocalTime.Text := DateTimeToStr(FileDateToDateTime(arLocal[FileNo].Time));
        edtLocalSize.Text := FloatToStr(arLocal[FileNo].Size);
      end;
    3: //本地无，主机有
      begin
        FileNo := FieldByName('ServerNo_').AsInteger;
        edtServerTime.Text := DateTimeToStr(FileDateToDateTime(arServer[FileNo].Time));
        edtServerSize.Text := FloatToStr(arServer[FileNo].Size);
      end;
    end;
  end;
  if Assigned(PageControl1.ActivePage.OnShow) then
    PageControl1.ActivePage.OnShow(PageControl1.ActivePage);
end;

procedure TFrmUpdateFiles.cdsViewUP_GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if cdsView.RecordCount > 0 then
  begin
    if Sender.AsInteger in [0..(cboUP.Items.Count - 1)] then
      Text := cboUP.Items[Sender.AsInteger]
    else if -Sender.AsInteger in [0..(cboUP.Items.Count - 1)] then
      Text := cboUP.Items[-Sender.AsInteger] + ', ok!';
  end;
end;

procedure TFrmUpdateFiles.cdsViewUP_SetText(Sender: TField;
  const Text: String);
begin
  if cboUP.Items.IndexOf(Text) > -1 then
    Sender.AsInteger := cboUP.Items.IndexOf(Text)
  else
    Sender.AsInteger := 0;
end;

procedure TFrmUpdateFiles.cdsViewBeforeInsert(DataSet: TDataSet);
begin
  if DataSet.Tag = 0 then Abort;
end;

procedure TFrmUpdateFiles.popCheckClick(Sender: TObject);
var
  i, k: Integer;
  slLocal, slServer: TStringList;
begin
  //执行检测
  if (edtLocalPath.Text = '') or (edtServerPath.Text = '') then
  begin
    MsgBox('本地目录以及主机目录均不可为空！');
    Exit;
  end;
  slLocal := TStringList.Create;
  slServer := TStringList.Create;
  try
    cdsView.EmptyDataSet;
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;
    arLocal := nil; arServer := nil;
    pb1.Max := 2;
    if chkChanged.Checked then pb1.Max := pb1.Max + 1;
    if chkNewLocal.Checked then pb1.Max := pb1.Max + 1;
    if chkNewServer.Checked then pb1.Max := pb1.Max + 1;
    if Sender = popFastCheck then cdsView.DisableControls;
    //
    pb1.Position := 1; //取得所有本地文件清单
    GetLocalFiles(slLocal, edtLocalPath.Text);
    //showmessage(slLocal.text);
    pb1.Position := 2; //取得所有主机文件清单
    GetServerFiles(slServer, edtServerPath.Text);
    //showmessage(slserver.text);
    if chkChanged.Checked then //进行差异性比对
    begin
      pb1.Max := slLocal.Count;
      for i := 0 to slLocal.Count - 1 do
      begin
        pb1.Position := i + 1;
        Application.ProcessMessages;
        k := slServer.IndexOf(slLocal.Strings[i]);
        if (k > -1) and
          (
            (arLocal[i].Size <> arServer[k].Size) or
            (arLocal[i].Time <> arServer[k].Time)
          ) then
          begin
            with cdsView do
            try
              Tag := 1;
              Append;
              FieldByName('Type_').AsInteger := 1;
              FieldByName('LocalNo_').AsInteger := i;
              FieldByName('ServerNo_').AsInteger := k;
              FieldByName('FileName_').AsString := slLocal.Strings[i];
              FieldByName('FileDateTime_').AsDateTime := FileDateToDateTime(arLocal[i].Time);
              FieldByName('FileSize_').AsFloat := arLocal[i].Size;
              SetViewCurrentRecord;
              Post;
            finally
              Tag := 0;
            end;
          end
        else if (k = -1) and chkNewLocal.Checked then //检测本地有, 主机无
          begin
            with cdsView do
            try
              Tag := 1;
              Append;
              FieldByName('Type_').AsInteger := 2;
              FieldByName('LocalNo_').AsInteger := i;
              FieldByName('ServerNo_').AsInteger := -1;
              FieldByName('FileName_').AsString := slLocal.Strings[i];
              FieldByName('FileDateTime_').AsDateTime := FileDateToDateTime(arLocal[i].Time);
              FieldByName('FileSize_').AsFloat := arLocal[i].Size;
              SetViewCurrentRecord;
              Post;
            finally
              Tag := 0;
            end;
          end;
      end;
    end;
    if chkNewServer.Checked then //检测本地无, 主机有
    begin
      pb1.Max := slServer.Count;
      for i := 0 to slServer.Count - 1 do
      begin
        pb1.Position := i + 1;
        Application.ProcessMessages;
        if (slLocal.IndexOf(slServer.Strings[i]) = -1) then
        begin
          with cdsView do
          try
            Tag := 1;
            Append;
            FieldByName('Type_').AsInteger := 3;
            FieldByName('LocalNo_').AsInteger := - 1;
            FieldByName('ServerNo_').AsInteger := i;
            FieldByName('FileName_').AsString := slServer.Strings[i];
            FieldByName('FileDateTime_').AsDateTime := FileDateToDateTime(arServer[i].Time);
            FieldByName('FileSize_').AsFloat := arServer[i].Size;
            SetViewCurrentRecord;
            Post;
          finally
            Tag := 0;
          end;
        end;
      end;
    end;
    DisplayTotalSize;
    cdsView.EnableControls;
    cdsView.First;
    Screen.Cursor := crDefault;
    MsgBox('本地目录与主机目录文件检测完成，差异文件数：%d', [cdsView.RecordCount]);
    popBatchUpdate.Enabled := True;
  finally
    FreeAndNil(slLocal); FreeAndNil(slServer);
    Screen.Cursor := crDefault;
  end;
end;

function TFrmUpdateFiles.DisplayTotalSize: Double;
var
  k: Integer;
  TotalSize: Double;
begin
  k := 0;
  with cdsView do
  begin
    First;
    TotalSize := 0;
    while not Eof do
    begin
      if FieldByName('UP_').AsINteger > 0 then
      begin
        Inc(k);
        TotalSize := TotalSize + FieldByName('FileSize_').AsFloat;
      end;
      Next;
    end;
  end;
  Edit1.Text := IntToStr(k) + ' 文件';
  if TotalSize > (1024 * 1024) then
    Edit2.Text := FormatFloat('###,###,###,### MB',TotalSize / 1024 / 1024)
  else if TotalSize > 1024 then
    Edit2.Text := FormatFloat('###,###,###,### KB',TotalSize / 1024)
  else
    Edit2.Text := FloatToStr(TotalSize);
  Result := TotalSize;
end;

procedure TFrmUpdateFiles.popBatchUpdateClick(Sender: TObject);
var
  Root: IXMLNode;
  xml: TXMLDocument;
  i, FileNo: Integer;
  LocalFile, ServerFile: String;
  StartTime, OldTime, EndTime: TDateTime;
  TotalSize, FinalSize, nn1: Double;
begin
  //更新
  if MessageDlg('您确认要全部更新吗？', mtConfirmation,
    [mbYes, mbNo], 0) <> mrYes then Exit;
  xml := TXMLDocument.Create(Self);
  with cdsView do
  try
    btnCacel.Tag := 1;
    btnCacel.Visible := True;
    Screen.Cursor := crHourGlass;
    CreateFixedPath(edtServerPath.Text + '\');
    if popEncryptFile.Checked then
    begin
      if not FileExists(edtServerPath.Text + '\Index.km') then
        begin
          xml.Active := True;
          xml.FileName := edtServerPath.Text + '\Index.km';
        end
      else
        xml.LoadFromFile(edtServerPath.Text + '\Index.km');
      if xml.DocumentElement = nil then xml.AddChild('Database');
      Root := GetXMLNode(xml.DocumentElement, 'Files');
    end;
    //
    StartTime := Now();
    OldTime := StartTime;
    Edit5.Text := '';
    FinalSize := 0;
    DisableControls;
    TotalSize := DisplayTotalSize;
    EnableControls;
    First;
    pb1.Max := RecordCount;
    for i := 1 to RecordCount do
    begin
      pb1.Position := i;
      Application.ProcessMessages;
      RecNo := i;
      if btnCacel.Tag = 0 then Abort;
      if FieldByName('Type_').AsInteger > 0 then
      begin
        if (i > 1) and (FieldByName('UP_').AsInteger > 0) then
        begin
          FinalSize := FinalSize + FieldByName('FileSize_').AsFloat;
          nn1 := (TotalSize / FinalSize) * SecondsBetween(Now(), StartTime);
          EndTime := IncSecond(StartTime, StrToIntDef(FormatFloat('##########',nn1),0));
          Edit3.Text := FormatdateTime('HH:MM:SS', StartTime);
          if (Edit5.Text = '') or (ABS(SecondsBetween(EndTime, OldTime)) > 30) then
          begin
            Edit4.Text := FormatdateTime('HH:MM:SS', EndTime);
            Edit5.Text := FormatdateTime('HH:MM:SS', EndTime - StartTime);
            OldTime := EndTime;
          end;
          Application.ProcessMessages;
        end;
        //
        if FieldByName('UP_').AsInteger = 1 then // =>主机
          begin
            LocalFile := edtLocalPath.Text + FieldByName('FileName_').AsString;
            ServerFile := edtServerPath.Text + FieldByName('FileName_').AsString;
            if popEncryptFile.Checked then
              begin
                FileNo := FieldByName('LocalNo_').AsInteger;
                CopyFileToServer(Root, LocalFile, ServerFile,
                  FieldByName('Remark_').AsString, arLocal[FileNo]);
                xml.SaveToFile;
              end
            else
              begin
                if FileExists(ServerFile) then DeleteFile(ServerFile);
                CreateFixedPath(ExtractFilePath(ServerFile));
                CopyFile(PChar(LocalFile), PChar(ServerFile), False);
              end;
            Edit;
            FieldByName('UP_').AsInteger := - FieldByName('UP_').AsInteger;
            Post;
          end
        else if FieldByName('UP_').AsInteger = 2 then // 本地<=
          begin
            LocalFile := edtLocalPath.Text + FieldByName('FileName_').AsString;
            ServerFile := edtServerPath.Text + FieldByName('FileName_').AsString;
            if popEncryptFile.Checked then
            begin
              FileNo := FieldByName('ServerNo_').AsInteger;
              ServerFile := edtServerPath.Text + '\' + arServer[FileNo].Name;
            end;
            if FileExists(LocalFile) then DeleteFile(LocalFile);
            CreateFixedPath(ExtractFilePath(LocalFile));
            CopyFile(PChar(ServerFile), PChar(LocalFile), False);
            Edit;
            FieldByName('UP_').AsInteger := - FieldByName('UP_').AsInteger;
            Post;
          end
        else if FieldByName('UP_').AsInteger = 3 then //从主机删除
          begin
            ServerFile := edtServerPath.Text + FieldByName('FileName_').AsString;
            if popEncryptFile.Checked then
              DeleteFileOfServer(ServerFile)
            else if FileExists(ServerFile) then
              DeleteFile(ServerFile);
            Edit;
            FieldByName('UP_').AsInteger := - FieldByName('UP_').AsInteger;
            Post;
          end
        else if FieldByName('UP_').AsInteger = 4 then //从本地删除
          begin
            LocalFile := edtLocalPath.Text + FieldByName('FileName_').AsString;
            if FileExists(LocalFile) then DeleteFile(LocalFile);
            Edit;
            FieldByName('UP_').AsInteger := - FieldByName('UP_').AsInteger;
            Post;
          end;
      end;
    end;
    Screen.Cursor := crDefault;
    MsgBox('本地目录与主机目录文件同步完成！');
  finally
    btnCacel.Visible := False;
    Screen.Cursor := crDefault;
    FreeAndNil(xml);
  end;
end;

procedure TFrmUpdateFiles.CopyFileToServer(Root: IXMLNode;
  const LocalFile, ServerFile, Remark: String; sr: TKMTRecord);
var
  i: Integer;
  FileName, NewExt, NewFile: String;
  Child, Item, Node: IXMLNode;
begin
  if cdsView.FieldByName('Type_').AsInteger = 1 then //变更
    begin
      Child := Root.ChildNodes.First;
      while Child <> nil do
      begin
        Item := Child.ChildNodes.FindNode('Name');
        if (Item <> nil) and (UpperCase(Item.NodeValue) = UpperCase(ServerFile)) then Break;
        Child := Child.NextSibling;
      end;
    end
  else
    Child := nil;
  if Child = nil then
  begin
    for i := LastFileNo to 1000000 do
    begin
      FileName := edtServerPath.Text + '\F' + IntToStr(i) + '.kmd'; 
      if not FileExists(FileName) then
      begin
        Child := GetXMLNode(Root, 'F' + IntToStr(i));
        LastFileNo := i;
        Break;
      end;
    end;
  end;
  //
  Item := GetXMLNode(Child, 'Name');
  Item.NodeValue := ServerFile;
  FileName := edtServerPath.Text + '\' + Child.NodeName + '.kmd';
  if FileExists(FileName) then //有历史版本
  begin
    Item := GetXMLNode(Child, 'History');
    for i := 1 to 999 do //最大拥有999个历史版本
    begin
      NewExt := '000' + IntToStr(i);
      NewExt := Copy(NewExt, Length(NewExt)-2,3);
      NewFile := ChangeFileExt(FileName,'.' + NewExt);
      Node := Item.ChildNodes.FindNode('H' + NewExt);
      if (Node = nil) and (not FileExists(NewFile)) then
      begin
        Node := Item.AddChild('H' + NewExt);
        Node.AddChild('Name').NodeValue := NewFile;
        Node.AddChild('Remark').NodeValue := GetXMLNode(Child, 'Remark').NodeValue;
        CopyFile(PChar(FileName), PChar(NewFile), False);
        DeleteFile(FileName);
        Break;
      end;
    end;
    if FileExists(FileName) then
    begin
      MsgBox('%s 的更新次数已超过 999 次, 不能再记录历史版本!',[FileName]);
      DeleteFile(FileName);
    end;
  end;
  GetXMLNode(Child, 'Remark').NodeValue := Remark;
  CopyFile(PChar(LocalFile), PChar(FileName), False);
end;

procedure TFrmUpdateFiles.C2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmUpdateFiles.N2Click(Sender: TObject);
begin
  rbNewLocal1.Checked := True;
  rbNewServer2.Checked := True;
end;

procedure TFrmUpdateFiles.N3Click(Sender: TObject);
begin
  rbNewLocal1.Checked := True;
  rbNewServer1.Checked := True;
end;

procedure TFrmUpdateFiles.N4Click(Sender: TObject);
begin
  rbNewLocal2.Checked := True;
  rbNewServer2.Checked := True;
end;

procedure TFrmUpdateFiles.S1Click(Sender: TObject);
var
  xmlFile: String;
  Root, Child, Node: IXMLNode;
begin
  //保存
  if not Assigned(kmpFile) then
  begin
    if not SaveDialog1.Execute then Exit;
    xmlFile := SaveDialog1.FileName;
    if FileExists(xmlFile) then DeleteFile(xmlFile);
    kmpFile := TXMLDocument.Create(Self);
    kmpFile.Active := True;
    kmpFile.FileName := xmlFile;
    kmpFile.AddChild('kmp');
  end;
  //
  Child := GetXMLNode(kmpFile.DocumentElement, 'Options');
  Node := GetXMLNode(Child,'Changed');
  Node.Attributes['Checked'] := chkChanged.Checked;
  Node.Attributes['Selected'] := iif(rbChanged1.Checked,1,iif(rbChanged2.Checked,2,3));
  Node := GetXMLNode(Child,'NewLocal');
  Node.Attributes['Checked'] := chkNewLocal.Checked;
  Node.Attributes['Selected'] := iif(rbNewLocal1.Checked,1,2);
  Node := GetXMLNode(Child,'NewServer');
  Node.Attributes['Checked'] := chkNewServer.Checked;
  Node.Attributes['Selected'] := iif(rbNewServer1.Checked,1,2);
  Node := GetXMLNode(Child,'EncryptFile');
  Node.NodeValue := popEncryptFile.Checked;
  //
  Root := GetXMLNode(kmpFile.DocumentElement,'RootPath');
  GetXMLNode(Root,'LocalPath').Text := edtLocalPath.Text;
  GetXMLNode(Root,'ServerPath').Text := edtServerPath.Text;
  //
  kmpFile.SaveToFile;
  MsgBox('Save to file: %s, ok!',[kmpFile.FileName]);
end;

procedure TFrmUpdateFiles.O2Click(Sender: TObject);
begin
  //打开
  if OpenDialog1.Execute then
    LoadOptionFile(OpenDialog1.FileName);
end;

procedure TFrmUpdateFiles.LoadOptionFile(const FileName: String);
var
  Root, Child, Item, Node: IXMLNode;
begin
  if not FileExists(FileName) then
  begin
    MsgBox('file not exists: %s',[FileName]);
    Exit;
  end;
  if Assigned(kmpFile) then kmpFile.Free;
  //
  kmpFile := TXMLDocument.Create(Self);
  kmpFile.LoadFromFile(FileName);
  Root := kmpFile.DocumentElement.ChildNodes.FindNode('Options');
  //
  Root := kmpFile.DocumentElement.ChildNodes.FindNode('RootPath');
  Child := Root.ChildNodes.FindNode('LocalPath');
  edtLocalPath.Text := Child.Text;
  Child := Root.ChildNodes.FindNode('ServerPath');
  edtServerPath.Text := Child.Text;
  //
  Root := kmpFile.DocumentElement.ChildNodes.FindNode('Options');
  Child := Root.ChildNodes.FindNode('EncryptFile');
  popEncryptFile.Checked := Child.NodeValue;
  Child := Root.ChildNodes.FindNode('Changed');
  chkChanged.Checked := Child.Attributes['Checked'];
  rbChanged1.Checked := Child.Attributes['Selected'] = 1;
  rbChanged2.Checked := Child.Attributes['Selected'] = 2;
  rbChanged3.Checked := Child.Attributes['Selected'] = 3;
  Child := Root.ChildNodes.FindNode('NewLocal');
  chkNewLocal.Checked := Child.Attributes['Checked'];
  rbNewLocal1.Checked := Child.Attributes['Selected'] = 1;
  rbNewLocal2.Checked := Child.Attributes['Selected'] = 2;
  Child := Root.ChildNodes.FindNode('NewServer');
  chkNewServer.Checked := Child.Attributes['Checked'];
  rbNewServer1.Checked := Child.Attributes['Selected'] = 1;
  rbNewServer2.Checked := Child.Attributes['Selected'] = 2;
  if popEncryptFile.Checked and FileExists(edtServerPath.Text + '\Index.km') then
    popEncryptFile.Enabled := False;
  //
  slDisableFile.Clear;
  slDisableDir.Clear;
  slDisableExt.Clear;
  Root := GetXMLNode(kmpFile.DocumentElement,'Disable');
  Item := Root.ChildNodes.First;
  while Item <> nil do
  begin
    Node := Item.ChildNodes.FindNode('Type_');
    if Node <> nil then
    begin
      if Node.NodeValue = 1 then
        slDisableFile.Add(Item.ChildNodes.FindNode('Name_').NodeValue)
      else if Node.NodeValue = 2 then
        slDisableDir.Add(Item.ChildNodes.FindNode('Name_').NodeValue)
      else if Node.NodeValue = 3 then
        slDisableExt.Add(Item.ChildNodes.FindNode('Name_').NodeValue)
    end;
    Item := Item.NextSibling;
  end;
  //
  Caption := m_Caption + Format('[%s]',[kmpFile.FileName])
end;

procedure TFrmUpdateFiles.TreeView1Editing(Sender: TObject;
  Node: TTreeNode; var AllowEdit: Boolean);
begin
  AllowEdit := False;
end;

procedure TFrmUpdateFiles.DeleteFileOfServer(const ServerFile: String);
var
  xml: TXMLDocument;
  Root, Child, Item: IXMLNode;
begin
  xml := TXMLDocument.Create(Self);
  try
    if not FileExists(edtServerPath.Text + '\Index.km') then
      begin
        xml.Active := True;
        xml.FileName := edtServerPath.Text + '\Index.km';
      end
    else
      xml.LoadFromFile(edtServerPath.Text + '\Index.km');
    if xml.DocumentElement = nil then xml.AddChild('Database');
    Root := GetXMLNode(xml.DocumentElement, 'Files');
    //
    Child := Root.ChildNodes.First;
    while Child <> nil do
    begin
      Item := Child.ChildNodes.FindNode('Name');
      if (Item <> nil) and (Item.NodeValue = ServerFile) then
      begin
        DeleteFile(edtServerPath.Text + '\' + Child.NodeName + '.kmd');
        Root.ChildNodes.Delete(Child.NodeName);
        Break;
      end;
      Child := Child.NextSibling;
    end;
    xml.SaveToFile;
  finally
    FreeAndNil(xml);
  end;
end;

procedure TFrmUpdateFiles.cdsViewFileDateTime_GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if cdsView.RecordCount > 0 then
    Text := FormatDateTime('YYYY/MM/DD HH:MM:SS',Sender.AsDateTime);
end;

procedure TFrmUpdateFiles.N12Click(Sender: TObject);
begin
  if not (Sender is TMenuItem) then Exit;
  case TMenuItem(Sender).Tag of
  1: cdsView.IndexFieldNames := 'Type_';
  2: cdsView.IndexFieldNames := 'FileName_';
  3: cdsView.IndexFieldNames := 'FileTime_';
  4: cdsView.IndexFieldNames := 'FileSize_';
  5: cdsView.IndexFieldNames := 'UP_';
  end;
end;

procedure TFrmUpdateFiles.pasdfm1Click(Sender: TObject);
var
  ExtName: String;
begin
  //仅将除(pas,dfm)外的文件上传至主机
  with cdsView do
  begin
    First;
    while not Eof do
    begin
      if ((FieldByName('Type_').AsInteger in [1,2])
        and (FieldByName('UP_').AsInteger = 1)) then
      begin
        ExtName := UpperCase(ExtractFileExt(FieldByName('FileName_').AsString));
        if (ExtName = UpperCase('.pas')) or (ExtName = UpperCase('.dfm')) then
        begin
          Edit;
          FieldByName('UP_').AsInteger := 0;
          Post;
        end;
      end;
      Next;
    end;
  end;
end;

procedure TFrmUpdateFiles.pasdfm2Click(Sender: TObject);
var
  sl: TStringList;
  SavePath, ExtName: String;
  procedure CopyDelphiFile(const SourceFile: String);
  var
    NewFile: String;
    pasFile, dfmFile: String;
  begin
    pasFile := ChangeFileExt(SourceFile,'.pas');
    if (sl.IndexOf(pasFile) = -1) and FileExists(pasFile) then
    begin
      sl.Add(pasFile);
      NewFile := SavePath + '\' + ExtractFileName(pasFile);
      if FileExists(NewFile) then DeleteFile(NewFile);
      CopyFile(PChar(pasFile), PChar(NewFile), False);
    end;
    dfmFile := ChangeFileExt(SourceFile,'.dfm');
    if (sl.IndexOf(dfmFile) = -1) and FileExists(dfmFile) then
    begin
      sl.Add(dfmFile);
      NewFile := SavePath + '\' + ExtractFileName(dfmFile);
      if FileExists(NewFile) then DeleteFile(NewFile);
      CopyFile(PChar(dfmFile), PChar(NewFile),False);
    end;
  end;
begin
  //将(pas,dfm)的文件另存至指定目录
  if not Assigned(kmpFile) then Exit;
  SavePath := ExtractFilePath(kmpFile.FileName) + 'UpdateOfDelphi';
  CreateFixedPath(SavePath);
  sl := TStringList.Create;
  try
    with cdsView do
    begin
      First;
      while not Eof do
      begin
        if ((FieldByName('Type_').AsInteger in [1,2])
          and (FieldByName('UP_').AsInteger = 1)) then
        begin
          ExtName := UpperCase(ExtractFileExt(FieldByName('FileName_').AsString));
          if (ExtName = UpperCase('.pas')) or (ExtName = UpperCase('.dfm')) then
            CopyDelphiFile(edtLocalPath.Text + FieldByName('FileName_').AsString);
        end;
        Next;
      end;
    end;
    MsgBox('已将所有(pas,dfm)文件保存至目录：%s',[SavePath]);
  finally
    FreeAndNil(sl);
  end;
end;

procedure TFrmUpdateFiles.chkChangedClick(Sender: TObject);
begin
  RefreshUPOfView;
end;

procedure TFrmUpdateFiles.SetkmpFile(const Value: TXMLDocument);
begin
  FkmpFile := Value;
  edtLocalPath.ReadOnly := Assigned(Value);
  if edtLocalPath.ReadOnly then
    edtLocalPath.Color := clBtnFace
  else
    edtLocalPath.Color := clWindow;
  if not Assigned(Value) then Caption := m_Caption;
end;

procedure TFrmUpdateFiles.popNewProjectClick(Sender: TObject);
begin
  if Assigned(FkmpFile) then FkmpFile.Free;
  kmpFile := nil;
  cdsView.EmptyDataSet;
  edtLocalPath.Text := '';
  edtServerPath.Text := '';
  popEncryptFile.Checked := False;
  popEncryptFile.Enabled := True;
  popBatchUpdate.Enabled := False;
  arLocal := nil; arServer := nil;
end;

procedure TFrmUpdateFiles.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if cdsView.RecordCount > 0 then
  begin
    case cdsView.FieldByName('UP_').AsInteger of
    0: DBGrid1.Canvas.Font.Color := clGray;
    //1: DBGrid1.Canvas.Brush.Color := clGreen;  //上传
    2: DBGrid1.Canvas.Font.Color := clGreen;     //下载
    3: DBGrid1.Canvas.Font.Color := clRed;       //从主机移除
    4: DBGrid1.Canvas.Font.Color := clRed;       //从本地移除
    end;
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFrmUpdateFiles.N5Click(Sender: TObject);
var
  i: Integer;
  Root, Item: IXMLNode;
  Dlg: TDlgDisableFile;
begin
  if not Assigned(kmpFile) then
  begin
    MsgBox('请先开启项目文件！');
    Exit;
  end;
  Dlg := TDlgDisableFile.Create(Self);
  try
    Root := GetXMLNode(kmpFile.DocumentElement,'Disable');
    Item := Root.ChildNodes.First;
    while Item <> nil do
    begin
      with Dlg.cdsList do
      begin
        Append;
        FieldByName('Type_').Value := Item.ChildNodes.FindNode('Type_').NodeValue;
        FieldByName('Name_').Value := Item.ChildNodes.FindNode('Name_').NodeValue;
        Post;
      end;
      Item := Item.NextSibling;
    end;
    Dlg.cdsList.First;
    with cdsView do
    begin
      Dlg.edtFileName.Text := FieldByName('FileName_').AsString;
      Dlg.edtDirName.Text := ExtractFilePath(FieldByName('FileName_').AsString);
      Dlg.edtExtName.Text := ExtractFileExt(FieldByName('FileName_').AsString);
      Dlg.rbFile.Checked := True;
    end;
    if Dlg.ShowModal() = mrOk then
    begin
      kmpFile.DocumentElement.ChildNodes.Delete('Disable');
      slDisableFile.Clear; slDisableDir.Clear;
      Root := GetXMLNode(kmpFile.DocumentElement,'Disable');
      with Dlg.cdsList do
      for i := 1 to RecordCount do
      begin
        RecNo := i;
        Item := GetXMLNode(Root, 'R' + IntToStr(RecNo));
        Item.AddChild('Type_').NodeValue := FieldByName('Type_').Value;
        Item.AddChild('Name_').NodeValue := FieldByName('Name_').Value;
        if FieldByName('Type_').Value = 1 then
          slDisableFile.Add(Item.ChildNodes.FindNode('Name_').NodeValue)
        else if FieldByName('Type_').Value = 2 then
          slDisableDir.Add(Item.ChildNodes.FindNode('Name_').NodeValue)
        else if FieldByName('Type_').Value = 3 then
          slDisableExt.Add(Item.ChildNodes.FindNode('Name_').NodeValue)
      end;
      kmpFile.SaveToFile;
      RefreshUPOfView;
    end;
  finally
    FreeAndNil(Dlg);
  end;
end;

procedure TFrmUpdateFiles.FormDestroy(Sender: TObject);
begin
  arLocal := nil; arServer := nil;
  FreeAndNil(slDisableFile);
  FreeAndNil(slDisableDir);
  FreeAndNil(slDisableExt);
  FreeAndNil(FkmpFile);
end;

procedure TFrmUpdateFiles.RefreshUPOfView;
var
  i: Integer;
begin
  //开关选项
  with cdsView do
  try
    DisableControls;
    Screen.Cursor := crHourGlass;
    pb1.Max := RecordCount;
    i := RecNo;
    First;
    while not Eof do
    begin
      pb1.Position := RecNo;
      SetViewCurrentRecord;
      Next;
    end;
    EnableControls;
    if i in [1..RecordCount] then RecNo := i;
  finally
    Screen.Cursor := crDefault;
    EnableControls;
  end;
end;

procedure TFrmUpdateFiles.SetViewCurrentRecord;
var
  strFile, strExt: String;
  NewUP, LocalNo, ServerNo: Integer;
begin
  with cdsView do
  begin
    NewUP := FieldByName('UP_').AsInteger;
    strFile := FieldByName('FileName_').AsString;
    strExt := UpperCase(ExtractFileExt(strFile));
    if (slDisableFile.IndexOf(strFile) = -1)
      and (Pos(strExt, UpperCase(slDisableExt.Text)) = 0) then
      case FieldByName('Type_').AsInteger of
      1: //异动
        begin
          if chkChanged.Checked then
            begin
              if rbChanged1.Checked then      // 以日期为主，本地<=>主机
                begin
                  LocalNo := FieldByName('LocalNo_').AsInteger;
                  ServerNo := FieldByName('ServerNo_').AsInteger;
                  NewUP := iif(arLocal[LocalNo].Time > arServer[ServerNo].Time, 1, 2)
                end
              else if rbChanged2.Checked then //以本地为主，本地=>主机
                NewUP := 1
              else if rbChanged3.Checked then //以主机为主，本地<=主机
                NewUP := 2;
            end
          else
            NewUP := 0;
        end;
      2: //新增
        begin
          if chkNewLocal.Checked then
            NewUP := iif(rbNewLocal1.Checked, 1, 4)
          else
            NewUP := 0;
        end;
      3: //移除
        begin
          if chkNewServer.Checked then
            NewUP := iif(rbNewServer1.Checked, 3, 2)
          else
            NewUP := 0;
        end;
      end
    else
      NewUP := 0;
    if NewUP <> FieldByName('UP_').AsInteger then
    begin
      Edit;
      FieldByName('UP_').AsInteger := NewUP;
      //Post;
    end;
  end;
end;

procedure TFrmUpdateFiles.H1Click(Sender: TObject);
var
  i: Integer;
begin
  if High(arServer) = -1 then Exit;
  pb1.Max := High(arServer) + 1;
  for i := Low(arServer) to High(arServer) do
  begin
    pb1.Position := i + 1;
    with cdsView do
    try
      Tag := 1;
      Append;
      FieldByName('Type_').AsInteger := 0;
      FieldByName('LocalNo_').AsInteger := -i;
      FieldByName('ServerNo_').AsInteger := i;
      FieldByName('FileName_').AsString := arServer[i].Name;
      FieldByName('FileDateTime_').AsDateTime := FileDateToDateTime(arServer[i].Time);
      FieldByName('FileSize_').AsFloat := arServer[i].Size;
      FieldByName('UP_').AsInteger := 0;
      Post;
    finally
      Tag := 0;
    end;
  end;
end;

procedure TFrmUpdateFiles.TabSheet3Show(Sender: TObject);
var
  FileNo: Integer;
  sr: TSearchRec;
  xml: TXMLDocument;
  strFile, NewFile: String;
  Root, Child, Node, Item: IXMLNode;
begin
  cdsHistory.EmptyDataSet;
  if not cdsView.Active then Exit;
  if cdsView.RecordCount < 1 then Exit;
  FileNo := cdsView.FieldByName('ServerNo_').AsInteger;
  if FileNo < 0 then Exit;
  strFile := edtServerPath.Text + '\Index.km';
  NewFile := edtServerPath.Text + '\' + ChangeFileExt(arServer[FileNo].Name,'.001');
  if FileExists(strFile) and FileExists(NewFile) then
  begin
    xml := TXMLDocument.Create(Self);
    try
      xml.LoadFromFile(strFile);
      Root := xml.DocumentElement.ChildNodes.FindNode('Files');
      strFile := Copy(arServer[FileNo].Name, 1, Length(arServer[FileNo].Name)-4);
      Child := Root.ChildNodes.FindNode(strFile);
      if Child <> nil then
      begin
        Node := Child.ChildNodes.FindNode('History');
        if Node <> nil then
        begin
          Item := Node.ChildNodes.First;
          while Item <> nil do
          begin
            strFile :=  Item.ChildNodes.FindNode('Name').NodeValue;
            if FindFirst(strFile, faAnyFile, sr) = 0 then
            begin
              with cdsHistory do
              begin
                Append;
                FieldByName('Index_').AsString := Item.NodeName;
                FieldByName('FileTime_').AsDateTime := FileDateToDateTime(sr.Time);
                FieldByName('FileSize_').AsFloat := sr.Size;
                FieldByName('Remark_').Value := Item.ChildNodes.FindNode('Remark').NodeValue;
                Post;
              end;
              FindClose(sr);
            end;
            Item := Item.NextSibling;
          end;
        end;
      end;
    finally
      FreeAndNil(xml);
    end;
  end;
end;

procedure TFrmUpdateFiles.btnCacelClick(Sender: TObject);
begin
  if btnCacel.Tag = 0 then Abort;
  if MessageDlg('您确定要中止吗？',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    btnCacel.Tag := 0;
end;

function TFrmUpdateFiles.AllowFileExt(const FileName: String): Boolean;
var
  Ext: String;
begin
  Result := True;
  Ext := UpperCase(ExtractFileExt(FileName));
  if Ext <> '' then
    Result := Pos(Ext, UpperCase(slDisableExt.Text)) = 0;
end;

function TFrmUpdateFiles.AllowFilePath(const FileName: String): Boolean;
var
  i: Integer;
begin
  Result := True;
  for i := 0 to slDisableDir.Count - 1 do
  begin
    if UpperCase(Copy(FileName,1,Length(slDisableDir.Strings[i])))
      = UpperCase(slDisableDir.Strings[i]) then
    begin
      Result := False;
      Break;
    end;
  end;
end;

procedure TFrmUpdateFiles.A1Click(Sender: TObject);
begin
  if Assigned(kmpFile) then
    MsgBox(kmpFile.FileName + vbCrLf + vbCrLf + m_Caption + vbCrLf
      + Application.ExeName + vbCrLf
      + 'Author:Jason, Email: 3024@vip.sina.com')
  else
    MsgBox(m_Caption + vbCrLf + Application.ExeName + vbCrLf
      + 'Author:Jason, Email: 3024@vip.sina.com');
end;

procedure TFrmUpdateFiles.N16Click(Sender: TObject);
begin
  MsgBox('若有任何意见或问题, %s请访问华软论坛: %s',
    [vbCrLf, 'http://support.cerc.cn']);
end;

procedure TFrmUpdateFiles.S2Click(Sender: TObject);
var
  Child: TDlgUserList;
begin
  if not Assigned(kmpFile) then
  begin
    MsgBox('请先开启项目文件！');
    Exit;
  end;
  Child := TDlgUserList.Create(Self);
  try
    if Child.ShowModal() = mrOk then
    begin
    end;
  finally
    FreeAndNil(Child);
  end;
end;

end.
