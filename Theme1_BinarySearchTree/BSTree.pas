//Модуль работы с поисковым деревом
unit BSTree;

interface
  uses
    FMX.Dialogs, SysUtils;
type
  TData = string;

  pTreeNode = ^TNode;
  TNode = record
      data: TData;
      key: Integer;
      Left: pTreeNode;
      Right: pTreeNode;
  end;

var
  WorkTree: pTreeNode;

//Создание нового узла
procedure CreateNode(var pNewNode: pTreeNode; dataField: TData; keyField: Integer);

//Добавление узла
procedure AddNode(var pNewNode: pTreeNode; dataField: TData; keyField: Integer);

implementation

//Создание нового узла
procedure CreateNode(var pNewNode: pTreeNode; dataField: TData; keyField: Integer);

begin
  New(pNewNode);
  pNewNode^.data := dataField;
  pNewNode^.key := keyField;
  pNewNode^.Left := nil;
  pNewNode^.Right := nil;
end;

//Рекурсивное добавление узла
procedure AddNode(var pNewNode: pTreeNode; dataField: TData; keyField: Integer);

begin
  if pNewNode = nil then
    CreateNode(pNewNode, dataField, keyField)
    else
      if (keyField < pNewNode^.key) then
        AddNode(pNewNode^.left, dataField, keyField)
        else
          if (keyField > pNewNode^.key) then
            AddNode(pNewNode^.right, dataField, keyField)
              else
                ShowMessage('Ключ неуникален. Попробуйте снова.');

end;

//Дополнение слева строки пробелами
function SpaceLeftString(src: string; colSpace: Integer): string;
begin
  Result := Src;
  while Length(Result) < colSpace do
    Result := ' ' + Result;
end;

//Рекурсивная реализация обхода в прямом направлении
procedure PreOrder(pTemp: pTreeNode; var lvl: Integer);
begin
  if pTemp <> nil then
    begin
      inc (lvl,5);
      ShowMessage(IntToStr(lvl));
      //вывод pTemp^.keyField
      //воспользоваться функцией добавления пробелов
      //и вывод на экран

      PreOrder(pTemp^.left, lvl);
      PreOrder(pTemp^.right, lvl);
    end;

end;



end.
