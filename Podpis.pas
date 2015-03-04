unit Podpis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, DBCtrls, ImgList, ComCtrls,
  ToolWin, Buttons, Grids, DBGridEh, ExtCtrls, Mask, DBCtrlsEh, DBLookupEh,UtilRIB
  ,RxStrUtils;
type
  TFPodpis = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Label14: TLabel;
    ImageList1: TImageList;
    Panel1: TPanel;
    Label1: TLabel;
    DBGridEh3: TDBGridEh;
    Label2: TLabel;
    SpeedButton3: TSpeedButton;
    Edit4: TEdit;
    Edit5: TEdit;
    ToolButton3: TToolButton;
    ComboBox1: TComboBox;
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit4Click(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure DBGridEh3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPodpis: TFPodpis;
  struk_zap: integer;
implementation
 uses dm,Find_Struk;
{$R *.dfm}

procedure TFPodpis.ComboBox1Change(Sender: TObject);
begin
 if ComboBox1.ItemIndex=0 then v_Tip_dok:=102;
 if ComboBox1.ItemIndex=1 then v_Tip_dok:=103;
 if ComboBox1.ItemIndex=2 then v_Tip_dok:=104;
 if DM1.Podpis.Active then DM1.Podpis.Close;
 DM1.Podpis.ParamByName('Struk').AsInteger:=Struk;
 DM1.Podpis.ParamByName('Tip_Dok').AsInteger:=v_Tip_Dok;
 DM1.Podpis.Open;
 DBGrideh3.SetFocus;
end;

procedure TFPodpis.DBGridEh3DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
 if dm1.PodpisStruk_id.AsInteger=0 then
 begin
  DBGridEh3.Canvas.Brush.Color:=clMoneyGreen;
  DBGridEh3.Canvas.Font.Color:=clBlack;
  DBGridEh3.Canvas.FillRect(Rect);
  DBgridEh3.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;
end;

procedure TFPodpis.Edit4Click(Sender: TObject);
begin
Edit4.Text:='';
Edit5.Text:='';
end;

procedure TFPodpis.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
  if (Edit4.Text<>'') then
  begin
    Edit4.Text:=replacestr(edit4.text,',','.');
    kod:=SelectToVarIB('SELECT  struk.stname FROM  struk WHERE struk.kod_struk='+''+Edit4.Text+'',dm1.BELMED, dm1.BELMED.DefaultTransaction);
    If kod=Null then
    begin
      MessageDlg('Неправильно введен код подразделения!', mtInformation,[mbOk], 0);
      Edit4.Text:='';
      abort;
    end
    else
    begin
      Edit5.Text:=kod;
      struk:=SelectToVarIB('SELECT  struk.struk_id FROM  struk WHERE struk.kod_struk='+''+Edit4.Text+'',dm1.BELMED, dm1.BELMED.DefaultTransaction);
      if v_tip_Dok<>0 then
      begin
       if DM1.Podpis.Active then DM1.Podpis.Close;
       DM1.Podpis.ParamByName('Struk').AsInteger:=Struk;
       DM1.Podpis.ParamByName('Tip_Dok').AsInteger:=v_Tip_Dok;
       DM1.Podpis.Open;
      end;
    end;
  end;
 end;
end;

procedure TFPodpis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 struk:=struk_zap;
end;

procedure TFPodpis.FormCreate(Sender: TObject);
begin
 v_tip_dok:=0;
 struk:=0;
end;

procedure TFPodpis.FormShow(Sender: TObject);
begin
 if v_tip_dok<>0 then
   ComboBox1.ItemIndex:=v_tip_dok-102
 else
 begin
  v_tip_dok:=102;
  ComboBox1.ItemIndex:=0;
 end;
 struk_zap:=0;
 if struk<>0 then
 begin
  struk_zap:=struk;
  kod:=SelectToVarIB('SELECT  struk.stname FROM  struk WHERE struk.struk_id='+''+inttostr(struk)+'',dm1.BELMED, dm1.BELMED.DefaultTransaction);
  Edit5.Text:=kod;
  kod:=SelectToVarIB('SELECT  struk.kod_struk FROM  struk WHERE struk.struk_id='+''+inttostr(struk)+'',dm1.BELMED, dm1.BELMED.DefaultTransaction);
  Edit4.Text:=kod;
  if DM1.Podpis.Active then DM1.Podpis.Close;;
  DM1.Podpis.ParamByName('Struk').AsInteger:=Struk;
  DM1.Podpis.ParamByName('Tip_Dok').AsInteger:=v_Tip_Dok;
  DM1.Podpis.Open;
 end
 else Edit4.SetFocus;

end;

procedure TFPodpis.SpeedButton3Click(Sender: TObject);
begin
if FindStruk=nil then FindStruk:=TfindStruk.Create(Application);
 FindStruk.WindowState:=wsNormal;
 FindStruk.DataBaseName:=dm1.BELMED;
 FindStruk.Vibor:=False;
 FindStruk.ReadOnly:=False;
 FindStruk.ShowModal;
 If FindStruk.ModalResult > 50 then
 begin
  STRUK :=FindStruk.ModalResult-50;
  Edit5.Text:=FindStruk.name;
  Edit4.Text:=FindStruk.kod;
  if v_tip_dok<>0 then
  begin
   if DM1.Podpis.Active then DM1.Podpis.Close;
   DM1.Podpis.ParamByName('Struk').AsInteger:=Struk;
   DM1.Podpis.ParamByName('Tip_Dok').AsInteger:=v_Tip_Dok;
   DM1.Podpis.Open;
  end;
 end;
end;

procedure TFPodpis.ToolButton1Click(Sender: TObject);
begin
 if Dm1.Podpis.Active then
 begin
  vTip_op_id:=Dm1.PodpisTip_op_id.AsInteger;
  Dm1.Podpis.Insert;
 end;
end;

procedure TFPodpis.ToolButton2Click(Sender: TObject);
begin
 if DM1.podpis.active then DM1.Podpis.Delete;
end;

procedure TFPodpis.ToolButton3Click(Sender: TObject);
begin
 dm1.startRWTranss;
 try
  if (DM1.Podpis.UpdatesPending) or (DM1.Podpis.Modified) then
   DM1.Podpis.ApplyUpdates;
  DM1.IBT_WRITE.Commit;
  DM1.IBT_READ.CommitRetaining;
  DM1.Podpis.Close;
  dm1.IBT_WRITE.Active:=false;
  DM1.IBT_READ.Active:=false;
  dm1.startRWTranss;
  DM1.Podpis.ParamByName('Struk').AsInteger:=Struk;
  DM1.Podpis.ParamByName('Tip_Dok').AsInteger:=v_Tip_Dok;
  DM1.Podpis.Open;
 except
  On E: Exception do
  begin
   MessageDlg('Произошла ошибка при записи данных!'+E.Message, mtWarning, [mbOK], 0);
   DM1.IBT_WRITE.RollbackRetaining;
  end;
 end;
end;

end.
