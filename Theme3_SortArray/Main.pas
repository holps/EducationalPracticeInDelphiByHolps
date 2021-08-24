unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, FMX.StdCtrls, System.Diagnostics,
  FMX.Controls.Presentation, FMX.Memo.Types, FMX.Memo;

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
    BtnQuickSort: TButton;
    Button4: TButton;
    PnlGridArray: TPanel;
    StringGridArray: TStringGrid;
    MemoLog: TMemo;
    procedure BtnGenArrayClick(Sender: TObject);
    procedure BtnBubbleSortClick(Sender: TObject);
    procedure BtnChoiceSortClick(Sender: TObject);
    procedure BtnQuickSortClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Show(const Msg: string);
  end;

var
  fMain: TfMain;
  M: Integer;


implementation

{$R *.fmx}

uses Sort;

procedure TfMain.Show(const Msg: string);
begin
  MemoLog.Lines.Add(Msg);
end;


//Генерация массива
procedure TfMain.BtnGenArrayClick(Sender: TObject);
var
  I: Integer;

begin
  if Rbtn10.IsChecked then
    M:= 10;
  if Rbtn100.IsChecked then
    M:= 100;
  if Rbtn1000.IsChecked then
    M:= 1000;
  if Rbtn10000.IsChecked then
    M:= 10000;
  while StringGridArray.ColumnCount < M do
    StringGridArray.AddObject(TStringColumn.Create(StringGridArray));
  CreateArray(M);
  GenRandomArray(MainArray, M);
  for I := Low(MainArray) to High(MainArray) do
    begin
      StringGridArray.Cells[I,0]:= I.ToString;
      StringGridArray.Cells[I,1]:= MainArray[I].ToString;
    end;
end;



//Пузырьковая сортировка
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

//Вывод на экран массива. Сортировка методом выбора.
procedure TfMain.BtnChoiceSortClick(Sender: TObject);
var
  Sw: TStopWatch;
  I: Integer;
begin
  Sw := TStopWatch.StartNew;
  SortChoise(MainArray, M);
  Sw.Stop;
  for I := 0 to M-1 do
    begin
      StringGridArray.Cells[I,2]:= MainArray[I].ToString;
    end;
    ShowMessage (Sw.Elapsed.ToString);
end;

//Вывод на экран массива. Метод быстрой сортировки.
procedure TfMain.BtnQuickSortClick(Sender: TObject);
var
  I: Integer;
begin
  QuickSort(MainArray,0,High(MainArray));
  for I := 0 to M-1 do
  begin
    StringGridArray.Cells[I,2]:= MainArray[I].ToString;
  end;
  ShowQuickSort;
end;

end.
