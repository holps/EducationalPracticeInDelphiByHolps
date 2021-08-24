unit Sort;

interface

uses
  FMX.Dialogs, SysUtils, System.Diagnostics;

type
  TMainArray = array of Integer;

var
  MainArray: TMainArray;
  swap2, compare2: Integer;

procedure CreateArray(m: Integer);
procedure GenRandomArray(a: TMainArray; m: Integer);
procedure BubbleSort(a: TMainArray; n: Integer);
procedure SortChoise(a: TMainArray; n: Integer);
//procedure QuickSort(mas: TMainArray; left, right: Integer);
procedure QuickSort(A: TMainArray; min, max: Integer);
procedure ShowQuickSort;


implementation


//Создание массива
procedure CreateArray(m: Integer);
begin
  SetLength(MainArray, m);//<<Выделяем необходимую память на куче, инициализация
end;

//Заполнение массива случайными числами
procedure GenRandomArray(a: TMainArray; m: Integer);
var
  I: Integer;
begin
  Randomize;
  for I := 0 to m-1 do
    a[I]:= Random(1000)+1;
end;

//Пузырьковая сортировка
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
          inc(compare); //Подсчитываем сравнения
          if a[j-1] > a[j] then
            begin
              inc(swap);//Подсчитываем перестановки
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

//Сортровка методом выбора
procedure SortChoise(a: TMainArray; n: Integer);
var
  i,j,k,temp: Integer;
  compare, swap: Integer;
begin
  swap:= 0;
  compare:= 0;
  for i := 0 to n-2 do
    begin
      k:= i;
      temp:= a[i];
      for j := i+1 to n-1 do
        begin
          inc(compare);
          if a[j]<temp then
            begin
              inc(swap);
              k:= j;
              temp:= a[j];
            end;
        end;
        a[k]:= a[i];
        a[i]:= temp;
    end;
  ShowMessage('Количество сравнений: ' + compare.ToString + '.' + sLineBreak +
  'Количество перестановок: ' + swap.ToString + '.');
end;

//Метод быстрой сортировки
procedure QuickSort(A: TMainArray; min, max: Integer);  //процедура быстрой сортировки по возрастанию
var i, j, supp, tmp: Integer;
begin
  supp:=A[max-((max-min) div 2)];
  i:=min; j:=max;
  while i<j do
    begin
      while A[i]<supp do
        begin
          inc(i);
          inc(compare2);
        end;
      while A[j]>supp do
        begin
          dec(j);
          inc(compare2);
        end;
      inc(compare2);
      if i<=j then
        begin
          inc(swap2);
          tmp:=A[i]; A[i]:=A[j]; A[j]:=tmp;
          i:=i+1; j:=j-1;
        end;
      inc(compare2);
    end;
  if min<j then QuickSort(A, min, j);
  if i<max then QuickSort(A, i, max);

end;

procedure ShowQuickSort;
begin
    ShowMessage('Количество сравнений: ' + compare2.ToString + '.' + sLineBreak +
  'Количество перестановок: ' + swap2.ToString + '.');
end;

end.
