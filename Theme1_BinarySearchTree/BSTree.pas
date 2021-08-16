//Модуль работы с поисковым деревом

unit BSTree;

interface

uses
    FMX.Dialogs, SysUtils;

type

  pTreeNode = ^TNode;
  TNode = record
      key: Integer;
      counterKey: Integer;
      Left: pTreeNode;
      Right: pTreeNode;
  end;

  procedure CreateNode(var pNewNode: pTreeNode; keyField: Integer);
  procedure AddNode(var pNewNode: pTreeNode; keyField: Integer);
  function SearchKey(workKey: Integer): pTreeNode;
  procedure PreOrder(pTemp: pTreeNode; LvlNode: Integer; var str: string);
  procedure InOrder(pTemp: pTreeNode; LvlNode: Integer);
  procedure FreeBSTree (var pTemp: pTreeNode);

var
  WorkTree: pTreeNode;

implementation

//Существует ли вообще дерево
function EmptyTree(BSTree: pTreeNode): boolean;
begin
  Result := BSTree = nil;
end;

//Создание нового узла
procedure CreateNode(var pNewNode: pTreeNode; keyField: Integer);
begin
  New(pNewNode);
  pNewNode^.key := keyField;
  pNewNode^.counterKey := 1;
  pNewNode^.Left := nil;
  pNewNode^.Right := nil;
end;

//Рекурсивное добавление узла
procedure AddNode(var pNewNode: pTreeNode; keyField: Integer);

begin
  if pNewNode = nil then
    begin
      CreateNode(pNewNode, keyField);
    end
    else
      if (keyField < pNewNode^.key) then
        begin
          AddNode(pNewNode^.left, keyField);
        end
        else
          if (keyField > pNewNode^.key) then
            begin
              AddNode(pNewNode^.right, keyField);
            end
             else
               begin
                 Inc(pNewNode^.counterKey); //<<Увеличиваем счетчик числа появления ключа
                 ShowMessage('Число появлений ключа: '+ IntToStr(pNewNode^.key) + ' равно: ' + IntToStr(pNewNode^.counterKey));
               end;

end;

//Циклический поиск заданной вершины
 function SearchKey(workKey: Integer): pTreeNode;
 var pTemp: pTreeNode;
 begin
   pTemp := WorkTree;
   if EmptyTree(pTemp) then  //<<Если дерева нет
     begin
       ShowMessage('Дерево не построено');
       Result := nil;
       exit;
     end;
   result := nil;
   while pTemp<>nil do
     if(workKey = pTemp^.key) then
       begin
         result := pTemp;
         ShowMessage('Вершина с ключом ' + IntToStr(pTemp^.key) + ' найдена в дереве. Число появлений: ' + IntToStr(pTemp^.counterKey) + '.');
         break;
       end
    else
      if (workKey < pTemp^.key) then
        begin
          pTemp := pTemp^.left
        end
      else
        if (workKey > pTemp^.key) then
          begin
            pTemp := pTemp^.right;
          end;
    if (result = nil) then ShowMessage('Такого ключа в дереве нет');

 end;

//Дополнение слева строки пробелами
{
function SpaceLeftString(src: string; colSpace: Integer): string;
begin
  Result := Src;
  while Length(Result) < colSpace do
    Result := ' ' + Result;
end;
}
function CorrectString ({SrcString: string; }ColSpace: Integer): string;
begin
  Result := '';//SrcString;
  while ColSpace > 0 do
    begin
      Result := ' ' + Result;
      Dec(ColSpace);
    end;
end;

//Рекурсивная реализация обхода дерева в прямом направлении
procedure PreOrder(pTemp: pTreeNode; LvlNode: Integer; var str: string);
var
  Spaces: Integer;
begin
  if pTemp <> nil then
    begin
      //ShowMessage(IntToStr(pTemp^.key) + 'Уровень вершины: ' + IntToStr(LvlNode));//<<Обработка текущей вершины
      //str := str + IntToStr(pTemp^.key)+ #13#10;
      Spaces := (LvlNode - 0) * 5;
      //ShowMessage('Количество пробелов:' + IntToStr(Spaces));
      str := str + CorrectString({str, }Spaces)+ IntToStr(pTemp^.key) + #13#10;
      //ShowMessage(str);
      Inc(LvlNode);
      PreOrder(pTemp^.left, LvlNode, str);
      PreOrder(pTemp^.right, LvlNode, str);
    end;

end;

//Рекурсивная реализация обхода дерева в симметричном направлении
procedure InOrder(pTemp: pTreeNode; LvlNode: Integer);
begin
  if pTemp <> nil then
    begin
      Inc(LvlNode);
      InOrder(pTemp^.left, LvlNode);
      ShowMessage(IntToStr(pTemp^.key) + 'Уровень вершины: ' + IntToStr(LvlNode));//<<Обработка текущей вершины
      InOrder(pTemp^.right,LvlNode);
    end;

end;

//Рекурсивная процедура освобождения памяти, занятой деревом. Удаление дерева
procedure FreeBSTree (var pTemp: pTreeNode);
begin
if pTemp = nil then
  Exit;
  FreeBSTree(pTemp^.left);
  FreeBSTree(pTemp^.right);
  Dispose(pTemp);
  pTemp := nil;
end;

end.
