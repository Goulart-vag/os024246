unit AgendaFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrls, DB, MemDS, DBAccess, IBC,
  uCopBDFB;

type
  TForm1 = class(TForm)
    pnlFormulario: TPanel;
    lblUF: TLabel;
    lblTelefone: TLabel;
    edtNome: TLabeledEdit;
    edtEndereco: TLabeledEdit;
    edtCidade: TLabeledEdit;
    cmbUf: TComboBox;
    mdtTelefone: TMaskEdit;
    lblCelular: TLabel;
    mdtCelular: TMaskEdit;
    pnlBotoes: TPanel;
    btnAdicionar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    pnlPesquisa: TPanel;
    rgpFiltro: TRadioGroup;
    conection: TIBCConnection;
    srcPessoa: TIBCDataSource;
    qryPessoa: TIBCQuery;
    qryPessoaCD_PESSOA: TIntegerField;
    qryPessoaDS_PESSOA: TStringField;
    qryPessoaDS_ENDERECO: TStringField;
    qryPessoaDS_BAIRRO: TStringField;
    qryPessoaDS_CIDADE: TStringField;
    qryPessoaDS_UF: TStringField;
    qryPessoaDS_TELEFONE: TStringField;
    qryPessoaDS_CELULART: TStringField;
    edtBairro: TLabeledEdit;
    edtPesquisa: TEdit;
    btnBackup: TButton;
    btnRestore: TButton;
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnRestoreClick(Sender: TObject);
    procedure edtPesquisaEnter(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnBackupClick(Sender: TObject);

  private
    procedure ativaBotesDML(value:boolean);
    procedure limparFormulario;
    procedure ativaFormulario(value:boolean);
    procedure ativaBotoesAlteracao(value:boolean);
  public
    { Public declarations }
  end;
  

var
  Form1: TForm1;


implementation

{$R *.dfm}

uses
  ShellAPI, uRestoreBackup, BackupModal, restoreModal;


procedure TForm1.ativaBotesDML(value:boolean);
begin
  if value = true then
  begin
    btnAdicionar.Enabled := true;
    btnEditar.Enabled := true;
    btnExcluir.Enabled := true;
  end
  else
  begin
    btnAdicionar.Enabled := false;
    btnEditar.Enabled := false;
    btnExcluir.Enabled := false;
  end;
end;

procedure TForm1.ativaBotoesAlteracao(value:boolean);
begin
      btnSalvar.Enabled := value;
      btnCancelar.Enabled := value;
end;

procedure TForm1.ativaFormulario(value:boolean);
begin
    edtNome.Enabled := value;
    edtEndereco.Enabled := value;
    edtBairro.Enabled := value;
    edtCidade.Enabled := value;
    mdtTelefone.Enabled := value;
    mdtCelular.Enabled := value;
    cmbUF.Enabled := value;
end;

procedure TForm1.limparFormulario;
begin
  edtNome.Text := '';
  edtEndereco.text := '';
  edtCidade.text := '';
  edtBairro.text := '';
  mdtTelefone.Text := '';
  mdtCelular.Text := '';
  cmbUF.ItemIndex := -1;
end;

procedure TForm1.btnAdicionarClick(Sender: TObject);
begin
  ativaFormulario(true);
  ativaBotesDML(false);
  ativaBotoesAlteracao(true);
end;
procedure TForm1.btnSalvarClick(Sender: TObject);
var
nome,endereco,bairro,cidade,telefone,celular,uf:string;
begin
  nome      := edtNome.Text;
  endereco  := edtEndereco.text;
  bairro    := edtBairro.Text;
  cidade    := edtCidade.text;
  telefone  := mdtTelefone.Text;
  celular   := mdtCelular.Text;
  uf        := cmbUF.Text;

  qryPessoa.Open;
  try
    qryPessoa.Insert;
    qryPessoaDS_PESSOA.AsString   := UpperCase(nome);
    qryPessoaDS_ENDERECO.AsString := UpperCase(endereco);
    qryPessoaDS_BAIRRO.AsString   := UpperCase(bairro);
    qryPessoaDS_CIDADE.AsString   := UpperCase(cidade);
    qryPessoaDS_TELEFONE.AsString := UpperCase(telefone);
    qryPessoaDS_CELULART.AsString := UpperCase(celular);
    qryPessoaDS_UF.AsString       := UpperCase(uf);
    qryPessoa.Post;
    qryPessoa.Transaction.CommitRetaining;
  except
    qryPessoa.Transaction.RollbackRetaining;
  end;
  ativaBotesDML(true);
  limparFormulario;
  ativaBotoesAlteracao(false);
end;


procedure TForm1.btnCancelarClick(Sender: TObject);
begin
  limparFormulario;
  ativaBotesDML(true);
  ativaBotoesAlteracao(false);
  edtPesquisa.clear;
end;

procedure TForm1.btnRestoreClick(Sender: TObject);
var
  retorno:integer;
begin

{
  conection.Connected := false;
  conection.close;
  //retorno:=winExec('del C:\Users\Desenv4.SEO\Desktop\trabalhos de pesquisa\os024246\AGENDA.FDB', SW_SHOW);
  retorno:=WinExec('"C:\Program Files\Firebird\Firebird_2_5\bin\gbak.exe" -c -user "SYSDBA" -pas "19983101" "C:\Users\Desenv4.SEO\Desktop\trabalhos de pesquisa\os024246\backupDB\backup.FDK" "C:\Users\Desenv4.SEO\Desktop\trabalhos de pesquisa\os024246\AGENDA_RESTORE.FDB" -REP',SW_SHOW );
  if retorno >= 33 then
  begin
    showmessage('Bakcup realizado com sucesso.' + inttostr(retorno));

    end
  else
    showmessage('Não foi possivel fazer backup');
  conection.Database := 'C:\Users\Desenv4.SEO\Desktop\trabalhos de pesquisa\os024246\AGENDA_RESTORE.FDB';
  conection.open;
  conection.Connected := true;
 }
end;

procedure TForm1.edtPesquisaEnter(Sender: TObject);
begin
  edtPesquisa.Clear

end;



procedure TForm1.edtPesquisaChange(Sender: TObject);
var
  pesquisa:string;
begin
   pesquisa := UpperCase(edtPesquisa.Text);
   try
    qryPessoa.Open;
    if rgpFiltro.ItemIndex = 0 then
    begin
      qryPessoa.SQL.Text := 'Select * from pessoa where DS_TELEFONE CONTAINING :telefone ';
      qryPessoa.ParamByName('telefone').AsString := pesquisa;
    end
    else
    begin
      qryPessoa.SQL.Text := 'Select * from pessoa where DS_PESSOA  STARTING :nome';
      qryPessoa.Params.ParamByName('nome').AsString := pesquisa;
    end;
    qryPessoa.ExecSQL;

    edtNome.text := qryPessoaDS_PESSOA.value;
    edtEndereco.text := qryPessoaDS_ENDERECO.value;
    edtBairro.text := qryPessoaDS_BAIRRO.value;
    edtCidade.text := qryPessoaDS_CIDADE.value;
    mdtTelefone.Text := qryPessoaDS_TELEFONE.value;
    mdtCelular.text := qryPessoaDS_CELULART.value;
    cmbUf.Text := qryPessoaDS_UF.value;


   except
      showmessage('não encontrado');
   end;
end;

procedure TForm1.btnEditarClick(Sender: TObject);
begin
  ativaFormulario(true);
  ativaBotesDML(false);
  ativaBotoesAlteracao(true);
end;

procedure TForm1.btnExcluirClick(Sender: TObject);
var
resposta:integer;
begin
  resposta := MessageDlg('Deseja excluir as informações?', mtConfirmation, [mbYes, mbNo], 0);
  if resposta = mrYes then
  begin
    try
      qryPessoa.Open;
      qryPessoa.Delete;
      qryPessoa.Execute;
      qryPessoa.Transaction.CommitRetaining;
    except
      qryPessoa.Transaction.RollbackRetaining;
    end;
  end;
end;



procedure TForm1.btnBackupClick(Sender: TObject);
var
  retorno:string;
  RestoreBackup:TRestoreBackup;
begin
  Application.CreateForm(TmdlBackup, mdlBackup);
  mdlBackup.ShowModal;
{
  try
    RestoreBackup := TRestoreBackup.create('"C:\Program Files\Firebird\Firebird_2_5\bin\gbak.exe"');
    retorno := RestoreBackup.doBackup('"C:\Users\Desenv4.SEO\Desktop\trabalhos de pesquisa\os024246\AGENDA.FDB"', '"C:\Users\Desenv4.SEO\Desktop\trabalhos de pesquisa\os024246\backupDB\backup.fbk"');
    ShowMessage(retorno);
  finally
    // Certifique-se de liberar a instância após o uso.
    FreeAndNil(RestoreBackup);
  end;
}
end;

end.
