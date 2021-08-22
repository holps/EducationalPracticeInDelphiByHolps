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
  y:= 0;//<<Счетчик числа сравнений
  if MainArray[KeyIndex(Words)].IsNullOrEmpty(MainArray[KeyIndex(Words)]) then //<<Проверка ячейки на пустоту. Костыль. Пока ничего подходящего не нашел.
    begin
      inc(y);
      //ShowMessage(MainArray[KeyIndex(Words)]);
      MainArray[KeyIndex(Words)] := Words;
      ShowMessage(IntToStr(KeyIndex(Words)) + ' : ' + Words + '. Число сравнений: ' + y.ToString);
    end
    else
      begin

        ShowMessage('ячейка не пуста');

        //поиск свободного места
        //подсчет сравнений
      end;


      //ShowMessage(MainArray[KeyIndex(Words)]);
      //MainArray[KeyIndex(Words)] := Words;

      //ShowMessage(IntToStr(KeyIndex(Words)) + ' : ' + Words);//<<Заглушки для проверки
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
  //ShowMessage(IntToStr(x));//<<Заглушки для проверки
  Result := x mod m;
end;

//Поиск свободной ячейки линейное сканирование
function SearchFreeIndex(KI: Integer): Integer;
var i: Integer;
begin
        for i := 0 to m-2 do
          begin
            Result :=  ((KI + i) mod m)+ 1;
            ShowMessage(Result.ToString);
            //AddKeyMainArray(Words);
          end;
end;



//Проверка количества добавленных ключей



end.
