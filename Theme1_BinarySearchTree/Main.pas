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
    EdtInfo: TEdit;
    LblInfo: TLabel;
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
    MemoOutTreeInDirectOrder: TMemo;
    MemoOutTreeInSymmetricOrder: TMemo;
    procedure BtnAddNodeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Show(const Msg: string);
  end;

var
  fMain: TfMain;
  //WorkTree: pTreeNode;

implementation

{$R *.fmx}

uses BSTree;

procedure TfMain.Show(const Msg: string);
begin
  //MemoInputKeySequence.Lines.Add(Msg);
  MemoInputKeySequence.Lines.Text := MemoInputKeySequence.Text + EdtKey.Text + ' -> ';
end;

//Процедура вывода на экран входной последовательности ключей дерева


//Процедура вывода на экран дерева в прямом порядке


//Процедура вывода на экран дерева в симметричном порядке



//Процедура добавления вершины в дерево
 procedure TfMain.BtnAddNodeClick(Sender: TObject);

begin
  if (EdtKey.Text = '') or (EdtInfo.Text = '') then
    ShowMessage('Не заданы ключ или данные нового узла!')
    else
      begin
        AddNode(WorkTree,EdtInfo.Text,StrToInt(EdtKey.Text));
        Show(EdtKey.Text); //Вывод вершин в последовательности ввода пользователем
      end;

end;


end.
