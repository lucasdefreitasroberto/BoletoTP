program TesteBoleto;

uses
  Vcl.Forms,
  TesteProjetoBoleto in '..\TesteProjetoBoleto.pas' {frmPrincipal},
  Boleto.Interfaces in 'Interface\Boleto.Interfaces.pas',
  Boleto.Classes in 'classe\Boleto.Classes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.