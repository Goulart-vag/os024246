unit BackupModal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TmdlBackup = class(TForm)
    edtBD: TEdit;
    OpenDialog: TOpenDialog;
    btnSearchBD: TButton;
    edtBackup: TEdit;
    Button2: TButton;
    SaveDialog: TSaveDialog;
    Label1: TLabel;
    Label2: TLabel;
    btnBackup: TButton;
    btnCancelar: TButton;
    procedure btnSearchBDClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mdlBackup: TmdlBackup;

implementation

{$R *.dfm}

procedure TmdlBackup.btnSearchBDClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    edtBD.Text := OpenDialog.FileName;
  end;
end;

procedure TmdlBackup.Button2Click(Sender: TObject);
begin
  if SaveDialog.Execute then
    edtBackup.Text := SaveDialog.FileName;
end;

end.
