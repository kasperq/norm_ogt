unit koefpr_vvod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, DB, IBCustomDataSet, IBUpdateSQL, IBUpdSQLW, IBQuery,
  RxIBQuery, ComCtrls, ExtCtrls, DBCtrls, ToolWin, Grids, DBGridEh, FindDlgEh;

type
  TFkoefpr_vvod = class(TForm)
    DBGridEh2: TDBGridEh;
    ToolBar1: TToolBar;
    DBNavigator1: TDBNavigator;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    koefpr: TRxIBQuery;
    IBUpdateKoefpr: TIBUpdateSQLW;
    DSKoefpr: TDataSource;
    ImageList1: TImageList;
    koefprKEIR: TSmallintField;
    koefprKOEF: TFMTBCDField;
    koefprKSM_ID: TIntegerField;
    koefprKEI_ID: TSmallintField;
    koefprNMAT: TIBStringField;
    koefprNEISO: TIBStringField;
    koefprNEISK: TIBStringField;
    ToolButton4: TToolButton;
    FindDlgEh1: TFindDlgEh;
    procedure FormShow(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh2EditButtonClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fkoefpr_vvod: TFkoefpr_vvod;

implementation
 uses dm,Ediz,Find_Matrop;
{$R *.dfm}

procedure TFkoefpr_vvod.DBGridEh2EditButtonClick(Sender: TObject);
var
  nm : integer;
begin
  nm := 0;
 if dbgrideh2.SelectedField.FieldName='NEISO' then nm:=1;
 if dbgrideh2.SelectedField.FieldName='KSM_ID' then nm:=2;
 if dbgrideh2.SelectedField.FieldName='NEISK' then nm:=3;
 koefpr.Edit;
 case nm of
  1: begin
    if Find_Ediz=nil then Find_Ediz:=TFind_Ediz.Create(Application);
    Find_Ediz.ShowModal;
    if Find_Ediz.ModalResult > 50 then
    begin
     s_kei:=Find_Ediz.ModalResult-50;
     KoefprKei_id.AsInteger:=find_ediz.EDIZKei_Id.AsInteger;
     koefprNeiso.AsString:=find_ediz.EdizNeis.AsString;
    end;
   end;
  2: begin
    if FindMatrop=nil then FindMatrop:=TfindMatrop.Create(Application);
    FindMatrop.DataBaseName:=dm1.BELMED;
    FindMatrop.ReadOnly:=true;
    FindMatrop.ShowModal;
    if FindMatrop.ModalResult > 50 then
    begin
     koefpr.FieldByName('Ksm_Id').AsInteger :=FindMatrop.ModalResult-50;
     koefpr.FieldByName('Nmat').AsString :=FindMatrop.IBMatropNMAT.AsString;
    end;
   end;
  3: begin
    if Find_Ediz=nil then Find_Ediz:=TFind_Ediz.Create(Application);
    Find_Ediz.ShowModal;
    if Find_Ediz.ModalResult > 50 then
    begin
     s_kei:=Find_Ediz.ModalResult-50;
     KoefprKeir.AsInteger:=find_ediz.EDIZKei_Id.AsInteger;
     koefprNeisk.AsString:=find_ediz.EdizNeis.AsString;
    end;
   end;
  end;

end;

procedure TFkoefpr_vvod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if (Koefpr.Modified) or (Koefpr.State =dsEdit)
    or (Koefpr.State =dsInsert) then
  if MessageDlg('Сохранить изменения? ',mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
   Koefpr.Post;
   dm1.startWriteTrans;
   try
    if Koefpr.UpdatesPending then
     Koefpr.ApplyUpdates;
    DM1.IBT_Write.CommitRetaining;
    dm1.IBT_Write.Active:=false;
    dm1.IBT_Write.Active:=true;
    dm1.IBT_read.Active:=false;
    dm1.IBT_Read.Active:=true;
    Koefpr.Close;
    Koefpr.Open;
   except
    on E: Exception do
    begin
     MessageDlg('Произошла ошибка при записи !'+E.Message, mtWarning, [mbOK], 0);
    raise;
    Koefpr.CancelUpdates;
    DM1.IBT_Write.RollbackRetaining;
   end;
  end;
 end;
end;

procedure TFkoefpr_vvod.FormShow(Sender: TObject);
begin
 koefpr.Open;
// koefpr.append;
end;

procedure TFkoefpr_vvod.ToolButton1Click(Sender: TObject);
begin
 koefpr.Delete;
end;

procedure TFkoefpr_vvod.ToolButton2Click(Sender: TObject);
begin
 koefpr.Insert;
end;

procedure TFkoefpr_vvod.ToolButton3Click(Sender: TObject);
begin
if MessageDlg('Сохранить изменения? ',mtConfirmation, [mbYes,mbNo], 0) = mrYes then
begin
 if (koefpr.Modified) or (Koefpr.State =dsEdit)
    or (Koefpr.State =dsInsert) then
  Koefpr.Post;
 dm1.startWriteTrans;
 try
  if Koefpr.UpdatesPending then
   Koefpr.ApplyUpdates;
  DM1.IBT_Write.CommitRetaining;
  dm1.IBT_Write.Active:=false;
  dm1.IBT_Write.Active:=true;
  dm1.IBT_read.Active:=false;
  dm1.IBT_Read.Active:=true;
  Koefpr.Close;
  Koefpr.Open;
 except
  on E: Exception do
  begin
   MessageDlg('Произошла ошибка при записи !'+E.Message, mtWarning, [mbOK], 0);
   raise;
   Koefpr.CancelUpdates;
   DM1.IBT_Write.RollbackRetaining;
  end;
 end;
end;
end;

procedure TFkoefpr_vvod.ToolButton4Click(Sender: TObject);
begin
 dm1.Copy_Koefpr;
end;

end.
