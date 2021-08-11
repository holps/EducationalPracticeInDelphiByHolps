program BinarySearchTree;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {fMain},
  BinarySearchTree in 'BinarySearchTree.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
