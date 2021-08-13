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
    begin
      CreateNode(pNewNode, dataField, keyField);
      ShowMessage('Добавлен узел' + IntToStr(pNewNode^.key));
    end
    else
      if (keyField < pNewNode^.key) then
        begin
        AddNode(pNewNode^.left, dataField, keyField);
        ShowMessage('Добавлен узел' + IntToStr(pNewNode^.key));
        end
        else
          if (keyField > pNewNode^.key) then
           begin
            AddNode(pNewNode^.right, dataField, keyField);
            ShowMessage('Добавлен узел' + IntToStr(pNewNode^.key));
           end
              else
                ShowMessage('Ключ неуникален. Попробуйте снова.');

end;

end.
