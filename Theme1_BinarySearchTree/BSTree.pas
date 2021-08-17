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
  procedure PreOrder(pTemp: pTreeNode; LvlNode: Integer; var str: string);
  procedure InOrder(pTemp: pTreeNode; LvlNode: Integer;var str: string);
  procedure FreeBSTree (var pTemp: pTreeNode);

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
  pNewNode^.counterKey := 1;//<<������� ����� ��������� �����
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
function CorrectString (ColSpace: Integer): string;
begin
  Result := '';
  while ColSpace > 0 do
    begin
      Result := ' ' + Result;
      Dec(ColSpace);
    end;
end;

//����������� ���������� ������ ������ � ������ �����������
procedure PreOrder(pTemp: pTreeNode; LvlNode: Integer; var str: string);
var
  Spaces: Integer;
begin
  if pTemp <> nil then
    begin
      Spaces := (LvlNode - 0) * 5; //<<������� �������� �� ������ ������
      str := str + CorrectString(Spaces)+ IntToStr(pTemp^.key) + #13#10;
      Inc(LvlNode);
      PreOrder(pTemp^.left, LvlNode, str);
      PreOrder(pTemp^.right, LvlNode, str);
    end;

end;

//����������� ���������� ������ ������ � ������������ �����������
procedure InOrder(pTemp: pTreeNode; LvlNode: Integer; var str: string);
var
  Spaces: Integer;
begin
  if pTemp <> nil then
    begin
      Spaces := (LvlNode - 0) * 5;
      Inc(LvlNode);
      InOrder(pTemp^.left, LvlNode, str);
      str := str + CorrectString(Spaces)+ IntToStr(pTemp^.key) + #13#10;//<<������� �� ������ ������� ������
      InOrder(pTemp^.right,LvlNode, str);
    end;

end;

//����������� ��������� ������������ ������, ������� �������. �������� ������
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
