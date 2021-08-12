//������ ������ � ��������� �������
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

//�������� ������ ����
procedure CreateNode(var pNewNode: pTreeNode; dataField: TData; keyField: Integer);

//��������� ����
procedure AddNode(var pNewNode: pTreeNode; dataField: TData; keyField: Integer);

implementation

//�������� ������ ����

procedure CreateNode(var pNewNode: pTreeNode; dataField: TData; keyField: Integer);
begin
  New(pNewNode);
  pNewNode^.data := dataField;
  pNewNode^.key := keyField;
  pNewNode^.Left := nil;
  pNewNode^.Right := nil;
end;

//���������� ����
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
                ShowMessage('���� ����������. ���������� �����.');

end;

end.
