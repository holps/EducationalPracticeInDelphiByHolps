//Модуль работы с массивом

unit Hash;

interface

uses
    FMX.Dialogs, SysUtils;

type

  TMainArray = array of string;//<<Объявление массива

const
  m = 11;
var
  MainArray: TMainArray;

procedure AddKeyMainArray(Words: string);//Добавление в массив ключа
procedure CreateArray; //Создание массива
//Размер массива
function KeyConversion(KeyWord: string): Integer;//Вычисление значения хэш-функции для заданного ключа
//Вычисление веса слов в символах
function KeyIndex(Words: string): Integer;//Возвращаем значение вычисляемое хэш-функцией для заданного ключа
function SearchFreeIndex(KI: Integer; z: Integer): Integer;
function EmptyIndexArray(KI: Integer): boolean;
function SummArray(MainArray: TMainArray): boolean;
implementation

//Создание массива
procedure CreateArray;
begin
  SetLength(MainArray, m);//<<Выделяем необходимую память на куче, инициализация
end;

//Добавление в массив ключа
procedure AddKeyMainArray(Words: string);
var
  y: Integer;
begin
  if SummArray(MainArray) then
    begin
      ShowMessage('Немозможно добавить! Использовано максимальное количество ключей: 10!');
    end
  else
    begin
      y:= 1;//<<Счетчик числа сравнений
      if EmptyIndexArray(KeyIndex(Words)) then
        begin
          //inc(y);
          MainArray[KeyIndex(Words)] := Words;
          ShowMessage('Выполнено!' + sLineBreak +'Ключ '+IntToStr(KeyIndex(Words)) + ' : ' + Words + '. Число сравнений: ' + y.ToString);
        end
      else
        begin
        ShowMessage('Ячейка ' + KeyIndex(Words).ToString + ' занята!');
          for var z := 0 to m-2 do
            begin
              inc(y);
              var x:= SearchFreeIndex(KeyIndex(Words), z);
              if EmptyIndexArray(x) then
                begin
                  MainArray[x] := Words;
                  ShowMessage('Выполнено!' + sLineBreak +'Ключ '+IntToStr(KeyIndex(Words)) + ' : ' + Words + '. Число сравнений: ' + y.ToString);
                  Exit;
                end
              else
                ShowMessage('Ячейка ' + x.ToString + ' занята!');
              end;

          end;
    end;

end;

//Проверка ячейки на пустоту
function EmptyIndexArray(KI: Integer): boolean;
begin
  Result:= MainArray[KI] = '';
end;

//Преобразование в целочисленный эквивалент
function KeyConversion(KeyWord: string): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := Low (KeyWord) to High (KeyWord) do
    Result := Result + Ord(KeyWord[I]);//<<Суммируем коды конвертируемых символов
end;

//Возвращаем значение вычисляемое хэш-функцией для заданного ключа
function KeyIndex(Words: string): Integer;
var
  x: Integer;
begin
  x := KeyConversion(Words);
  Result := x mod m;
end;

//Поиск свободной ячейки линейное сканирование
function SearchFreeIndex(KI: Integer; z: Integer): Integer;
begin
  Result :=  ((KI + z) mod m)+ 1;
  ShowMessage('Пробуем записать в ячейку № ' + Result.ToString);
end;



//Проверка количества добавленных ключей
function SummArray(MainArray: TMainArray): boolean;
var
  I,Total: Integer;
begin
  Total:= 0;
  for I := Low(MainArray) to High(MainArray) do
    begin
      if not EmptyIndexArray(I) then
        inc(Total);
    end;
  Result:= Total >= 10;
end;

end.
