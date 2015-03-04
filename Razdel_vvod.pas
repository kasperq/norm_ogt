unit Razdel_vvod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBUpdateSQL, IBUpdSQLW, IBQuery, RxIBQuery,
  Menus, FindDlgEh, ImgList, ComCtrls, ExtCtrls, DBCtrls, ToolWin, Grids,
  DBGridEh,UtilRIB;

type
  TFRazdel_vvod = class(TForm)
    DBGridEh2: TDBGridEh;
    ToolBar1: TToolBar;
    DBNavigator1: TDBNavigator;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    razdel: TRxIBQuery;
    IBUpdateRazdel: TIBUpdateSQLW;
    DSrazdel: TDataSource;
    razdelRAZDEL_ID: TSmallintField;
    razdelKODRAZ: TIBStringField;
    razdelNAMRAZ: TIBStringField;
    razdelKRAZ: TSmallintField;
    ImageList1: TImageList;
    ToolButton4: TToolButton;
    procedure ToolButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRazdel_vvod: TFRazdel_vvod;

implementation
 uses dm;
{$R *.dfm}

procedure TFRazdel_vvod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if (Razdel.Modified) or (Razdel.State =dsEdit)
  or (Razdel.State =dsInsert) then
  Razdel.Post;
 if Razdel.UpdatesPending  then
 begin
     if MessageDlg('Записать изменения?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
     begin
      try
       Razdel.ApplyUpdates;
       DM1.IBT_Write.CommitRetaining;
      except
       MessageDlg('Произошла ошибка при записи !', mtWarning, [mbOK], 0);
       Razdel.CancelUpdates;
       DM1.IBT_Write.RollbackRetaining;
      end;
     end
     else
     begin
      Razdel.CancelUpdates;
      DM1.IBT_Write.RollbackRetaining;
     end;
 end;
 Razdel.Close;
 dm1.IBT_Write.Active:=false;
 dm1.IBT_Write.Active:=true;
 dm1.IBT_read.Active:=false;
 dm1.IBT_Read.Active:=true;
end;

procedure TFRazdel_vvod.FormShow(Sender: TObject);
begin
 if not razdel.Active then razdel.Active:=true;
end;

procedure TFRazdel_vvod.ToolButton1Click(Sender: TObject);
var acc: variant;
begin
 acc:=SelectToVarIB('SELECT distinct normn.razdel_id FROM normn WHERE '+
 ' normn.razdel_id = '+inttostr(RazdelRazdel_id.AsInteger),dm1.belmed,dm1.ibt_read);
 If acc<>Null then
 begin
  MessageDlg('Запись нельзя удалять!', mtWarning, [mbOK], 0);
  abort;
 end
 else
  Razdel.Delete;
 end;

procedure TFRazdel_vvod.ToolButton2Click(Sender: TObject);
begin
 Razdel.Insert;
end;

procedure TFRazdel_vvod.ToolButton3Click(Sender: TObject);
begin
 if (Razdel.Modified) or (Razdel.State =dsEdit)
    or (Razdel.State =dsInsert) then
  Razdel.Post;
 dm1.startWriteTrans;
 try
  if Razdel.UpdatesPending then
   Razdel.ApplyUpdates;
  DM1.IBT_Write.CommitRetaining;
  dm1.IBT_Write.Active:=false;
  dm1.IBT_Write.Active:=true;
  dm1.IBT_read.Active:=false;
  dm1.IBT_Read.Active:=true;
  razdel.Close;
  razdel.Open;
 except
  on E: Exception do
  begin
   MessageDlg('Произошла ошибка при записи !'+E.Message, mtWarning, [mbOK], 0);
   raise;
   Razdel.CancelUpdates;
   DM1.IBT_Write.RollbackRetaining;
  end;
 end;
end;

procedure TFRazdel_vvod.ToolButton4Click(Sender: TObject);
begin
dm1.Copy_Razdel;
end;

end.
