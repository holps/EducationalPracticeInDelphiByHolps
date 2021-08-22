//������ ������ � ��������

unit Hash;

interface

uses
    FMX.Dialogs, SysUtils;

type

  TMainArray = array of string;//<<���������� �������

const
  m = 11;
var
  MainArray: TMainArray;

procedure AddKeyMainArray(Words: string);//���������� � ������ �����
procedure CreateArray; //�������� �������
//������ �������
function KeyConversion(KeyWord: string): Integer;//���������� �������� ���-������� ��� ��������� �����
//���������� ���� ���� � ��������
function KeyIndex(Words: string): Integer;//���������� �������� ����������� ���-�������� ��� ��������� �����
function SearchFreeIndex(KI: Integer; z: Integer): Integer;
function EmptyIndexArray(KI: Integer): boolean;
function SummArray(MainArray: TMainArray): boolean;
implementation

//�������� �������
procedure CreateArray;
begin
  SetLength(MainArray, m);//<<�������� ����������� ������ �� ����, �������������
end;

//���������� � ������ �����
procedure AddKeyMainArray(Words: string);
var
  y: Integer;
begin
  if SummArray(MainArray) then
    begin
      ShowMessage('���������� ��������! ������������ ������������ ���������� ������: 10!');
    end
  else
    begin
      y:= 1;//<<������� ����� ���������
      if EmptyIndexArray(KeyIndex(Words)) then
        begin
          //inc(y);
          MainArray[KeyIndex(Words)] := Words;
          ShowMessage('���������!' + sLineBreak +'���� '+IntToStr(KeyIndex(Words)) + ' : ' + Words + '. ����� ���������: ' + y.ToString);
        end
      else
        begin
        ShowMessage('������ ' + KeyIndex(Words).ToString + ' ������!');
          for var z := 0 to m-2 do
            begin
              inc(y);
              var x:= SearchFreeIndex(KeyIndex(Words), z);
              if EmptyIndexArray(x) then
                begin
                  MainArray[x] := Words;
                  ShowMessage('���������!' + sLineBreak +'���� '+IntToStr(KeyIndex(Words)) + ' : ' + Words + '. ����� ���������: ' + y.ToString);
                  Exit;
                end
              else
                ShowMessage('������ ' + x.ToString + ' ������!');
              end;

          end;
    end;

end;

//�������� ������ �� �������
function EmptyIndexArray(KI: Integer): boolean;
begin
  Result:= MainArray[KI] = '';
end;

//�������������� � ������������� ����������
function KeyConversion(KeyWord: string): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := Low (KeyWord) to High (KeyWord) do
    Result := Result + Ord(KeyWord[I]);//<<��������� ���� �������������� ��������
end;

//���������� �������� ����������� ���-�������� ��� ��������� �����
function KeyIndex(Words: string): Integer;
var
  x: Integer;
begin
  x := KeyConversion(Words);
  Result := x mod m;
end;

//����� ��������� ������ �������� ������������
function SearchFreeIndex(KI: Integer; z: Integer): Integer;
begin
  Result :=  ((KI + z) mod m)+ 1;
  ShowMessage('������� �������� � ������ � ' + Result.ToString);
end;



//�������� ���������� ����������� ������
function SummArray(MainArray: TMainArray): boolean;
var
  I,Total: Integer;
begin
  Total:= 0;
  for I := Low(MainArray) to High(MainArray) do
    begin
      if not EmptyIndexArray(I) then
        inc(Total);
    end;
  Result:= Total >= 10;
end;

end.
