//Модуль работы с поисковым деревом
unit BSTree;

interface
  uses
    FMX.Dialogs;
type
  TData = ShortString;

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

//Добавлени узла
procedure AddNode(var pNewNode: pTreeNode; dataField: TData; keyField: Integer);

implementation

//создание нового узла

procedure CreateNode(var pNewNode: pTreeNode; dataField: TData; keyField: Integer);
begin
  New(pNewNode);
  pNewNode^.data := dataField;
  pNewNode^.key := keyField;
  pNewNode^.Left := nil;
  pNewNode^.Right := nil;
end;

//Добавление узла
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

end.
