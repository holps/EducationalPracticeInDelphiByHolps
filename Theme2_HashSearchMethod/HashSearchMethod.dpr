program HashSearchMethod;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {fMain},
  Hash in 'Hash.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
