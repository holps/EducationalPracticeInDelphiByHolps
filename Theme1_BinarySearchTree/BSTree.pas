//������ ������ � ��������� �������
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

//�������� ������ ����
procedure CreateNode(var pNewNode: pTreeNode; dataField: TData; keyField: Integer);

//���������� ����
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

//����������� ���������� ����
procedure AddNode(var pNewNode: pTreeNode; dataField: TData; keyField: Integer);

begin
  if pNewNode = nil then
    begin
      CreateNode(pNewNode, dataField, keyField);
      ShowMessage('�������� ����' + IntToStr(pNewNode^.key));
    end
    else
      if (keyField < pNewNode^.key) then
        begin
        AddNode(pNewNode^.left, dataField, keyField);
        ShowMessage('�������� ����' + IntToStr(pNewNode^.key));
        end
        else
          if (keyField > pNewNode^.key) then
           begin
            AddNode(pNewNode^.right, dataField, keyField);
            ShowMessage('�������� ����' + IntToStr(pNewNode^.key));
           end
              else
                ShowMessage('���� ����������. ���������� �����.');

end;

end.
