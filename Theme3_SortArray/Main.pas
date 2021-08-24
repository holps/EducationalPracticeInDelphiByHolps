unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TfMain = class(TForm)
    PnlGenArray: TPanel;
    PnlMgmtData: TPanel;
    x: TPanel;
    LblGenArray: TLabel;
    Rbtn10: TRadioButton;
    Rbtn100: TRadioButton;
    Rbtn1000: TRadioButton;
    Rbtn10000: TRadioButton;
    BtnGenArray: TButton;
    BtnBubbleSort: TButton;
    BtnChoiceSort: TButton;
    Button3: TButton;
    Button4: TButton;
    PnlGridArray: TPanel;
    StringGridArray: TStringGrid;
    procedure BtnGenArrayClick(Sender: TObject);
    procedure BtnBubbleSortClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;
  M: Integer;


implementation

{$R *.fmx}

uses Sort;





procedure TfMain.BtnGenArrayClick(Sender: TObject);
var
  Column, I: Integer;

begin
  M:= 3;
  while StringGridArray.ColumnCount < M do
  StringGridArray.AddObject(TStringColumn.Create(StringGridArray));

  CreateArray(M);
  GenRandomArray(M);

  for I := Low(MainArray) to High(MainArray) do
    begin
      StringGridArray.Cells[I,0]:= I.ToString;
      StringGridArray.Cells[I,1]:= MainArray[I].ToString;
    end;
end;

procedure TfMain.BtnBubbleSortClick(Sender: TObject);
var
  I: Integer;
begin
  BubbleSort(MainArray, M);
  for I := 0 to M-1 do
    begin
      StringGridArray.Cells[I,2]:= MainArray[I].ToString;
    end;
end;

end.
