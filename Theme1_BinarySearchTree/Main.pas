unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, FMX.Edit;

type
  TfMain = class(TForm)
    PnlManualGenData: TPanel;
    PnlAutoGenData: TPanel;
    LblPnlManualGenData: TLabel;
    LblPnlAutoGenData: TLabel;
    LblKey: TLabel;
    EdtKey: TEdit;
    BtnAddNode: TButton;
    LblNumberOfNodes: TLabel;
    EdtNumberOfNodes: TEdit;
    BtnFillTree: TButton;
    PnlSearchNodeByKey: TPanel;
    PnlMgmtData: TPanel;
    LblPnlSearchNodeByKey: TLabel;
    LblSearchKey: TLabel;
    EdtSearchKey: TEdit;
    BtnSearchNodeByKey: TButton;
    LblPnlMgmtData: TLabel;
    BtnResetBinarySearchTree: TButton;
    PnlOutDataVisualView: TPanel;
    LblInputKeySequence: TLabel;
    LblOutTreeInDirectOrder: TLabel;
    LblOutTreeInSymmetricOrder: TLabel;
    MemoInputKeySequence: TMemo;
    MemoOutTreePreOrder: TMemo;
    MemoOutTreeInOrder: TMemo;
    BtnPreOrderBinarySearchTree: TButton;
    BtnInOrderBinarySearchTree: TButton;
    procedure Show(const Msg: string);
    procedure BtnAddNodeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSearchNodeByKeyClick(Sender: TObject);
    procedure BtnPreOrderBinarySearchTreeClick(Sender: TObject);
    procedure BtnInOrderBinarySearchTreeClick(Sender: TObject);
    procedure BtnResetBinarySearchTreeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;
  //WorkTree: pTreeNode;

implementation

{$R *.fmx}

uses BSTree;

//����� ��� �������� ����� �� ���� �����
procedure TfMain.FormShow(Sender: TObject);
begin
    EdtKey.SetFocus;
end;


//�������������� ������ ������ ������������������ ������
procedure TfMain.Show(const Msg: string);
begin
  MemoInputKeySequence.Lines.Text := MemoInputKeySequence.Text + EdtKey.Text + ' -> ';
end;


//����� �� ����� ������ � ������ �������
procedure TfMain.BtnPreOrderBinarySearchTreeClick(Sender: TObject);
var LvlRootNode: Integer;
s: string;
begin
  s := '';
  LvlRootNode := 0;
  PreOrder(WorkTree, LvlRootNode, s);
  MemoOutTreePreOrder.Lines.Add(s);
end;




//��������� ������ �� ����� ������ � ������������ �������
procedure TfMain.BtnInOrderBinarySearchTreeClick(Sender: TObject);
var LvlRootNode: Integer;
s: string;
begin
  s := '';
  LvlRootNode := 0;
  InOrder(WorkTree, LvlRootNode, s);
  MemoOutTreeInOrder.Lines.Add(s);
end;



//����� �� ����� ������� ������������������ ������
 procedure TfMain.BtnAddNodeClick(Sender: TObject);

begin
  if (EdtKey.Text = '') then
    begin
      ShowMessage('�� ����� ���� ������ ����!');
      EdtKey.SetFocus;
    end
  else
    begin
      AddNode(WorkTree,StrToInt(EdtKey.Text));
      Show(EdtKey.Text); //����� ������ � ������������������ ����� �������������
      EdtKey.Text := '';
      EdtKey.SetFocus;
    end;
end;


//����� �� ����� ��������� �������
procedure TfMain.BtnSearchNodeByKeyClick(Sender: TObject);
begin
  if (EdtSearchKey.Text = '') then
    begin
      ShowMessage('��������� ������ ��������!');
      EdtSearchKey.SetFocus;
    end
   else
     begin
       SearchKey(EdtSearchKey.Text.ToInteger);
       EdtSearchKey.Text := '';
     end;
end;


//�����
procedure TfMain.BtnResetBinarySearchTreeClick(Sender: TObject);
begin
  MemoInputKeySequence.Lines.Clear;
  MemoOutTreePreOrder.Lines.Clear;
  MemoOutTreeInOrder.Lines.Clear;
  FreeBSTree(WorkTree);
  EdtKey.SetFocus;
end;


end.
