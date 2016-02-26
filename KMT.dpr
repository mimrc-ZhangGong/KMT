program KMT;

uses
  Forms,
  UpdateFilesFrm in 'UpdateFilesFrm.PAS' {FrmUpdateFiles},
  ApConst in '..\..\Public\Common\ApConst.pas',
  DisableFileDlg in 'DisableFileDlg.pas' {DlgDisableFile},
  UserListDlg in 'UserListDlg.pas' {DlgUserList};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmUpdateFiles, FrmUpdateFiles);
  Application.Run;
end.
