unit Sort;

interface

uses
  FMX.Dialogs, SysUtils;

type
  TMainArray = array of Integer;

var
  MainArray: TMainArray;

procedure CreateArray(m: Integer);
procedure GenRandomArray(m: Integer);
procedure BubbleSort(a: TMainArray; n: Integer);


implementation

procedure CreateArray(m: Integer);
begin
  SetLength(MainArray, m);//<<Выделяем необходимую память на куче, инициализация
end;


procedure GenRandomArray(m: Integer);
var
  I: Integer;
begin
  Randomize;
  for I := 0 to m-1 do
    MainArray[I]:= Random(1000)+1;
end;

procedure BubbleSort(a: TMainArray; n: Integer);
var
  temp, i, j: Integer;
  swap, compare: Integer; //Перестановки и сравнения
begin
  swap:= 0;
  compare:= 0;
  for i:= 1 to n do
    begin

      for j:= n-1 downto i do
        begin
          inc(compare);
          if a[j-1] > a[j] then
            begin
              inc(swap);
              temp:= a[j-1];
              a[j-1]:= a[j];
              a[j]:= temp;
            end
        else
        end;
    end;
  ShowMessage('Количество сравнений: ' + compare.ToString + '.' + sLineBreak +
  'Количество перестановок: ' + swap.ToString + '.');
end;


end.
