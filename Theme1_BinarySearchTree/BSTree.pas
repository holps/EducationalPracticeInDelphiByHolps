//������ ������ � ��������� �������

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
  procedure PreOrder(pTemp: pTreeNode);
  procedure InOrder(pTemp: pTreeNode);

var
  WorkTree: pTreeNode;

implementation

//���������� �� ������ ������
function EmptyTree(BSTree: pTreeNode): boolean;
begin
  Result := BSTree = nil;
end;

//�������� ������ ����
procedure CreateNode(var pNewNode: pTreeNode; keyField: Integer);
begin
  New(pNewNode);
  pNewNode^.key := keyField;
  pNewNode^.counterKey := 1;
  pNewNode^.Left := nil;
  pNewNode^.Right := nil;
end;

//����������� ���������� ����
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
                 Inc(pNewNode^.counterKey); //<<����������� ������� ����� ��������� �����
                 ShowMessage('����� ��������� �����: '+ IntToStr(pNewNode^.key) + ' �����: ' + IntToStr(pNewNode^.counterKey));
               end;

end;

//����������� ����� �������� �������
 function SearchKey(workKey: Integer): pTreeNode;
 var pTemp: pTreeNode;
 begin
   pTemp := WorkTree;
   if EmptyTree(pTemp) then  //<<���� ������ ���
     begin
       ShowMessage('������ �� ���������');
       Result := nil;
       exit;
     end;
   result := nil;
   while pTemp<>nil do
     if(workKey = pTemp^.key) then
       begin
         result := pTemp;
         ShowMessage('������� � ������ ' + IntToStr(pTemp^.key) + ' ������� � ������. ����� ���������: ' + IntToStr(pTemp^.counterKey) + '.');
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
    if (result = nil) then ShowMessage('������ ����� � ������ ���');

 end;

//���������� ����� ������ ���������
function SpaceLeftString(src: string; colSpace: Integer): string;
begin
  Result := Src;
  while Length(Result) < colSpace do
    Result := ' ' + Result;
end;

//����������� ���������� ������ ������ � ������ �����������
procedure PreOrder(pTemp: pTreeNode);
begin
  if pTemp <> nil then
    begin
      ShowMessage(IntToStr(pTemp^.key));//<<��������� ������� �������
      PreOrder(pTemp^.left);
      PreOrder(pTemp^.right);
    end;

end;

//����������� ���������� ������ ������ � ������������ �����������
procedure InOrder(pTemp: pTreeNode);
begin
  if pTemp <> nil then
    begin
      InOrder(pTemp^.left);
      ShowMessage(IntToStr(pTemp^.key));//<<��������� ������� �������
      InOrder(pTemp^.right);
    end;

end;
end.
