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
//procedure ExistArray(MainArray);//Проверка существования массива
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
begin
  MainArray[KeyIndex(Words)] := Words;
  ShowMessage(IntToStr(KeyIndex(Words)) + ' : ' + Words);//<<Заглушки для проверки
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
  ShowMessage(IntToStr(x));//<<Заглушки для проверки
  Result := x mod m;
end;

//Поиск


//Проверка количества добавленных ключей

{
//Вывод индексов массива
procedure IndexPassArray; //Проход по массиву
var
  I: Integer;
begin
  for I in MainArray do
      begin

      end;
end;

//Вывод ключей массива
procedure KeyPassArray;

begin

end;
}


end.
