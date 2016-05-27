unit Norm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, ToolWin, ComCtrls, DBGrids, StdCtrls, Grids,
  DBGridEh, Mask, Spin, Buttons, ImgList,RxStrUtils,rxVCLUtils,DateUtils,RxMemDS,
  DB, kbmMemTable, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, System.UITypes;

type
  TFNorm = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    RadioGroup3: TRadioGroup;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    SpinEdit2: TSpinEdit;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ImageList1: TImageList;
    Panel1: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Label22: TLabel;
    Label19: TLabel;
    Label29: TLabel;
    Label21: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label41: TLabel;
    SpeedButton2: TSpeedButton;
    Edit1: TEdit;
    Label53: TLabel;
    Label34: TLabel;
    Label51: TLabel;
    Label27: TLabel;
    Label52: TLabel;
    Label43: TLabel;
    DBGridEh3: TDBGridEh;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    DBNavigator2: TDBNavigator;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label5: TLabel;
    normMem: TkbmMemTable;
    normMemDOC_ID: TIntegerField;
    normMemTIP_OP_ID: TSmallintField;
    normMemSPROD_ID: TIntegerField;
    normMemRAZDEL_ID: TSmallintField;
    normMemSTRUK_ID: TSmallintField;
    normMemKSM_ID: TIntegerField;
    normMemKEI_ID: TIntegerField;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure DBGridEh3EditButtonClick(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure ProsmNorm;
    procedure ToolButton5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGridEh3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormHide(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure saveNorms;
    function checkDoubleRecords() : boolean;

  public
    { Public declarations }
  end;

var
  FNorm: TFNorm;

implementation
 uses dm,Find_Spprod, Find_Matrop,Decode_Spprod,Decode_Matrop,ediz,razdel,GlMenu_ogt;
{$R *.dfm}

function TFNorm.checkDoubleRecords() : boolean;
begin
  dm1.normLoading := true;
  result := false;
  dm1.norm.DisableControls;
  normMem.LoadFromDataSet(dm1.norm, [mtcpoAppend]);
  normMem.Open;
  dm1.norm.First;
  while (not dm1.norm.Eof) do
  begin
    if (normMem.Locate('ksm_id;razdel_id;kei_id',
                       VarArrayOf([dm1.normKSM_ID.AsInteger,
                                   dm1.normRAZDEL_ID.AsInteger,
                                   dm1.normKEI_ID.AsInteger]),
                       [])) then
    begin
      normMem.Delete;
      if (normMem.Locate('ksm_id;razdel_id;kei_id',
                         VarArrayOf([dm1.normKSM_ID.AsInteger,
                                     dm1.normRAZDEL_ID.AsInteger,
                                     dm1.normKEI_ID.AsInteger]),
                         [])) then
      begin
        result := true;
        break;
      end;
    end;
    dm1.norm.Next;
  end;
  normMem.Close;
  normMem.EmptyTable;
  dm1.norm.EnableControls;
  dm1.normLoading := false;
end;

procedure TFNorm.ComboBox1Change(Sender: TObject);
begin
  god := SpinEdit2.Value;
  mes := ComboBox1.ItemIndex + 1;
  IF (MES < 10) THEN
    S_MES := '0' + INTTOSTR(MES)
  ELSE
    S_MES := INTTOSTR(MES);
  S_DAT1 := '01.' + S_MES + '.' + copy(INTTOSTR(GOD), 3, 2);
  S_DAT2 := datetostr(IncMonth(strtodate(s_dat1), 1) - 1);
  if (s_kodp <> 0) then
    ProsmNorm;
end;

procedure TFNorm.DBGridEh3EditButtonClick(Sender: TObject);
var
  nm : integer;
begin
  nm := 0;
  if (dbgrideh3.SelectedField.FieldName = 'KEI_ID') then
    nm := 1;
  if (dbgrideh3.SelectedField.FieldName = 'KSM_ID') then
    nm := 2;
  if (dbgrideh3.SelectedField.FieldName = 'KRAZ') then
    nm := 3;
  dm1.Norm.Edit;
  case nm of
  1:
    begin
      if (Find_Ediz = nil) then
        Find_Ediz := TFind_Ediz.Create(Application);
  //    DM1.FormToObject(Find_Ediz,DbgridEh3);
      Find_Ediz.ShowModal;
      if (Find_Ediz.ModalResult > 50) then
      begin
        s_kei := Find_Ediz.ModalResult - 50;
        dm1.NormKei_id.AsInteger := find_ediz.EDIZKei_Id.AsInteger;
        dm1.NormNeis.AsString := find_ediz.EdizNeis.AsString;
      end;
    end;
  2:
    begin
      if (FindMatrop = nil) then
        FindMatrop := TfindMatrop.Create(Application);
      FindMatrop.DataBaseName := dm1.BELMED;
      FindMatrop.ReadOnly := true;
      FindMatrop.ShowModal;
      if (FindMatrop.ModalResult > 50) then
      begin
        dm1.Norm.FieldByName('Gost').AsString := FindMatrop.IBMatropGOST.AsString;
        dm1.Norm.FieldByName('Nmat').AsString := FindMatrop.IBMatropNMAT.AsString;
//        if (dm1.Norm.FieldByName('Kei_Id').AsInteger <> 0) and
//           (dm1.Norm.FieldByName('Kei_Id').AsInteger <> FindMatrop.IBMatropKei_id.AsInteger) and
//           (dm1.Ediz_ASY.Locate('kei_id',dm1.NormKei_id.AsInteger,[])) and
//           (MessageDlg('Изменить единицу измерения нормы расхода c '
//                       + dm1.Norm.FieldByName('NEIS').AsString
//                       + ' на '
//                       + dm1.Ediz_asyNeis.AsString + '? '
//                       , mtWarning, [mbYes, mbNo], 0) = mrYes) then
//        begin
//          dm1.Norm.FieldByName('Kei_Id').AsInteger := FindMatrop.IBMatropKei_id.AsInteger;
//          if (not dM1.Ediz_asy.Active) then
//            dm1.Ediz_asy.Active := true;
//          if (dm1.Ediz_ASY.Locate('kei_id',dm1.NormKei_id.AsInteger,[])) then
//            dm1.NormNeis.AsString := dm1.Ediz_asyNeis.AsString
//        end;
        dm1.Norm.FieldByName('Xarkt').AsString := FindMatrop.IBMatropXARKT.AsString;
        dm1.normKOD_PROD_KSM.AsString := dm1.getKodProd(dm1.normKSM_ID.AsInteger);
        dm1.Norm.FieldByName('Ksm_Id').AsInteger := FindMatrop.ModalResult - 50;
      end;
    end;
  3:
    begin
      if (FRazdel = nil) then
        FRazdel := TFRazdel.Create(Application);
      FRazdel.ShowModal;
      if (FRazdel.ModalResult > 50) then
      begin
        dm1.NormRazdel_id.AsInteger := FRazdel.ModalResult - 50;
        dm1.NormKraz.AsInteger := FRazdel.RazdelKraz.AsInteger;
      end;
    end;
  end;
end;

procedure TFNorm.DBGridEh3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) and (dbgrideh3.SelectedField.FieldName = 'KSM_ID') then
  begin
    if (dm1.findMatrop(StrToInt(dbgrideh3.InplaceEditor.Text))) then
    begin

      dm1.Norm.FieldByName('Gost').AsString := dm1.q_matropGOST.AsString;
      dm1.Norm.FieldByName('Nmat').AsString := dm1.q_matropNMAT.AsString;
//        dm1.Norm.FieldByName('Kei_Id').AsInteger := dm1.q_matropKei_id.AsInteger;
      dm1.Norm.FieldByName('Xarkt').AsString := dm1.q_matropXARKT.AsString;
      dm1.normKOD_PROD_KSM.AsString := dm1.getKodProd(dm1.normKSM_ID.AsInteger);
      dm1.Norm.FieldByName('Ksm_Id').AsInteger := dm1.q_matropKSM_ID.AsInteger;
    end;
  end;
end;

procedure TFNorm.Edit1Change(Sender: TObject);
begin
if edit1.text<>''   then begin
 skod:=replacestr(edit1.text,',','.')+'%';
 DM1.IBQuery1.Active := False;
 DM1.IBQuery1.SQL.Clear;
 DM1.IBQuery1.SQL.Add('SELECT SPPROD.STRUK_ID,SPPROD.NMAT, SPPROD.KOD_PROD, SPPROD.KEI_ID,SPPROD.KSM_ID');
 DM1.IBQuery1.SQL.Add(' FROM SPPROD');
 DM1.IBQuery1.SQL.Add(' WHERE SPPROD.KOD_PROD like '+''''+skod+'''');
 DM1.IBQuery1.Active := True;
 if not dm1.IBQuery1.Eof then
  begin
   s_kodp:=DM1.IBQuery1.FieldByName('ksm_id').AsInteger;
   Label19.Caption:=DM1.IBQuery1.FieldByName('kod_PROD').Asstring+DM1.IBQuery1.FieldByName('nmat').AsString;
  end
  else
  begin
   s_kodp:=0;
   Label19.Caption:='';
 end;
 Label19.Refresh;
end;
end;

procedure TFNorm.Edit1Click(Sender: TObject);
begin
 edit1.text:='';
end;

procedure TFNorm.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    StartWait;
    if (s_kodp <> 0) then
    begin
      DM1.IBQuery1.Active := False;
      DM1.IBQuery1.SQL.Clear;
      DM1.IBQuery1.SQL.Add('SELECT SPPROD.STRUK_ID,SPPROD.NMAT, SPPROD.KOD_PROD, SPPROD.KEI_ID,SPPROD.KSM_ID,');
      DM1.IBQuery1.SQL.Add('SPPROD.GOST,EDIZ.NEIS,SPPROD.KORG,SPPROD.XARKT,SPPROD.ACTIVP,SPRORG.NAM,');
      DM1.IBQuery1.SQL.Add('SPVIS.NAMEVIS, PRSYR.NAMSPSR,STRUK.STNAME, REGION.NAM NAME_REG,spprod.sprod_id');
      DM1.IBQuery1.SQL.Add(' FROM SPPROD');
      DM1.IBQuery1.SQL.Add(' INNER JOIN EDIZ ON (SPPROD.KEI_ID = EDIZ.KEI_ID)');
      DM1.IBQuery1.SQL.Add(' left JOIN SPRORG ON (SPPROD.KORG = SPRORG.KOD)');
      DM1.IBQuery1.SQL.Add(' left JOIN REGION ON (SPPROD.Reg = REGION.reg)');
      DM1.IBQuery1.SQL.Add(' INNER JOIN SPVIS ON (SPPROD.SPVIS = SPVIS.SPVIS)');
      DM1.IBQuery1.SQL.Add(' INNER JOIN PRSYR ON (SPPROD.SPSR = PRSYR.SPSR)');
      DM1.IBQuery1.SQL.Add(' INNER JOIN STRUK ON (SPPROD.STRUK_ID = STRUK.STRUK_ID)');
      DM1.IBQuery1.SQL.Add(' WHERE SPPROD.Ksm_id='+inttostr(s_kodp));
      DM1.IBQuery1.Active := True;
      EDIT1.OnChange := nil;
      edit1.text := DM1.IBQuery1.FieldByName('kod_PROD').Asstring;
      EDIT1.OnChange := Edit1Change;
      s_sprod := DM1.IBQuery1.FieldByName('sprod_id').AsInteger;
      s_gost := DM1.IBQuery1.FieldByName('GOST').AsString;
      s_xarkt := DM1.IBQuery1.FieldByName('XARKT').AsString;
      s_nmat := DM1.IBQuery1.FieldByName('NMAT').AsString;
      s_kei := DM1.IBQuery1.FieldByName('KEI_ID').VALUE;
      s_korg := DM1.IBQuery1.FieldByName('KORG').VALUE;
      s_kodProd := DM1.IBQuery1.FieldByName('KOD_PROD').AsString;
      s_namorg := DM1.IBQuery1.FieldByName('NAM').AsString;
      s_neiz := DM1.IBQuery1.FieldByName('NEIS').AsString;
      s_reg := DM1.IBQuery1.FieldByName('Name_Reg').AsString;
      s_pr_syr := DM1.IBQuery1.FieldByName('Namspsr').AsString;
      s_vid_isp := DM1.IBQuery1.FieldByName('Namevis').AsString;
      s_stname := DM1.IBQuery1.FieldByName('STNAME').AsString;
      struk := DM1.IBQuery1.FieldByName('struk_ID').AsInteger;
      if (DM1.IBQuery1.FieldByName('ACTIVP').Asinteger = 1) then
        label5.caption := 'Действующие'
      else
        label5.caption := 'Недействующие';
      label8.caption := s_stname;
      label19.caption := s_NMAT;
      label27.caption := s_vid_isp;
      label34.caption := s_pr_syr;
      label43.caption := s_reg;
      label29.caption := s_namorg;
      label21.caption := s_Neiz;
      label22.caption := s_GOST;
      label41.caption := s_Xarkt;
      DM1.VoprosWriteNorm;
      ProsmNorm;
    end;
    StopWait;
  end;
end;

procedure TFNorm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.inNorm := false;
//  FreeAndNil(FindSpprod);
end;

procedure TFNorm.FormCreate(Sender: TObject);
begin
  s_kodp := 0;
  LABEL5.Caption := 'Нет норм';
  LABEL12.Caption := '';
  LABEL19.Caption := '';
  LABEL21.Caption := '';
  LABEL22.Caption := '';
  LABEL27.Caption := '';
  LABEL29.Caption := '';
  LABEL34.Caption := '';
  LABEL41.Caption := '';
  LABEL43.Caption := '';
  LABEL8.Caption := '';
end;

procedure TFNorm.FormHide(Sender: TObject);
begin
   dm1.inNorm := false;
end;

procedure TFNorm.FormShow(Sender: TObject);
begin
  dm1.inNorm := true;
  dm1.IBT_WRITE.Active:=FALSE;
  dm1.IBT_READ.Active:=FALSE;
  dm1.startRWTranss;
  v_Tip_Dok:=102;
  SpinEdit2.OnChange:=nil;
  SpinEdit2.Value:=god;
  SpinEdit2.OnChange:=SpinEdit2Change;
  ComboBox1.OnChange:=nil;
  ComboBox1.ItemIndex:=mes-1;
  ComboBox1.OnChange:=ComboBox1Change;
  IF MES<10 THEN S_MES:='0'+INTTOSTR(MES) ELSE S_MES:=INTTOSTR(MES);
  S_DAT1:='01.'+S_MES+'.'+copy(INTTOSTR(GOD),3,2);
  S_DAT2:=datetostr(IncMonth(strtodate(s_dat1),1)-1);
  if s_kodp<>0 then
  begin
    DM1.IBQuery1.Active := False;
    DM1.IBQuery1.SQL.Clear;
    DM1.IBQuery1.SQL.Add('SELECT SPPROD.STRUK_ID,SPPROD.NMAT, SPPROD.KOD_PROD, SPPROD.KEI_ID,SPPROD.KSM_ID,');
    DM1.IBQuery1.SQL.Add('SPPROD.GOST,EDIZ.NEIS,SPPROD.KORG,SPPROD.XARKT,SPPROD.ACTIVP,SPRORG.NAM,');
    DM1.IBQuery1.SQL.Add('SPVIS.NAMEVIS, PRSYR.NAMSPSR,STRUK.STNAME, REGION.NAM NAME_REG');
    DM1.IBQuery1.SQL.Add(' FROM SPPROD');
    DM1.IBQuery1.SQL.Add(' INNER JOIN EDIZ ON (SPPROD.KEI_ID = EDIZ.KEI_ID)');
    DM1.IBQuery1.SQL.Add(' left JOIN SPRORG ON (SPPROD.KORG = SPRORG.KOD)');
    DM1.IBQuery1.SQL.Add(' left JOIN REGION ON (SPPROD.Reg = REGION.reg)');
    DM1.IBQuery1.SQL.Add(' INNER JOIN SPVIS ON (SPPROD.SPVIS = SPVIS.SPVIS)');
    DM1.IBQuery1.SQL.Add(' INNER JOIN PRSYR ON (SPPROD.SPSR = PRSYR.SPSR)');
    DM1.IBQuery1.SQL.Add(' INNER JOIN STRUK ON (SPPROD.STRUK_ID = STRUK.STRUK_ID)');
    DM1.IBQuery1.SQL.Add(' WHERE SPPROD.Ksm_id='+inttostr(s_kodp));
    DM1.IBQuery1.Active := True;
    EDIT1.OnChange:=nil;
    edit1.text:=DM1.IBQuery1.FieldByName('kod_PROD').Asstring;
    EDIT1.OnChange:=Edit1Change;
    s_gost:=DM1.IBQuery1.FieldByName('GOST').AsString;
    s_xarkt:=DM1.IBQuery1.FieldByName('XARKT').AsString;
    s_nmat:=DM1.IBQuery1.FieldByName('NMAT').AsString;
    s_kei:=DM1.IBQuery1.FieldByName('KEI_ID').VALUE;
    s_korg:=DM1.IBQuery1.FieldByName('KORG').VALUE;
    s_kodProd:=DM1.IBQuery1.FieldByName('KOD_PROD').AsString;
    s_namorg:=DM1.IBQuery1.FieldByName('NAM').AsString;
    s_neiz:=DM1.IBQuery1.FieldByName('NEIS').AsString;
    s_reg:=DM1.IBQuery1.FieldByName('Name_Reg').AsString;
    s_pr_syr:=DM1.IBQuery1.FieldByName('Namspsr').AsString;
    s_vid_isp:=DM1.IBQuery1.FieldByName('Namevis').AsString;
    s_stname:= DM1.IBQuery1.FieldByName('STNAME').AsString;
    if DM1.IBQuery1.FieldByName('ACTIVP').Asinteger=1 then
      label5.caption:='Действующие'
    else
      label5.caption:='Недействующие';
    label8.caption:=s_stname;
    label19.caption:=s_NMAT;
    label27.caption:=s_vid_isp;
    label34.caption:=s_pr_syr;
    label43.caption:=s_reg;
    label29.caption:=s_namorg;
    label21.caption:=s_Neiz;
    label22.caption:=s_GOST;
    label41.caption:=s_Xarkt;
//    DM1.VoprosWriteNorm;
    ProsmNorm;
  end
  else
  begin
   LABEL5.Caption:='Нет норм';
   LABEL12.Caption:='';
   LABEL19.Caption:='';
   LABEL21.Caption:='';
   LABEL22.Caption:='';
   LABEL27.Caption:='';
   LABEL29.Caption:='';
   LABEL34.Caption:='';
   LABEL41.Caption:='';
   LABEL43.Caption:='';
  end;
end;

procedure TFNorm.SpeedButton2Click(Sender: TObject);
begin
  if (FindSpprod = nil) then
    FindSpprod := TfindSpprod.Create(Application);
  FindSpprod.DataBaseName := dm1.BELMED;
  FindSpprod.ReadOnly := true;
  FindSpprod.ShowModal;
  if (FindSpprod.ModalResult > 50) then
  begin
    EDIT1.OnChange := nil;
    edit1.text := FindSpprod.IBSpprodKod_Prod.Asstring;
    EDIT1.OnChange := Edit1Change;
    s_kodp := FindSpprod.ModalResult - 50;
    s_sprod := FindSpprod.IBSpprod.FieldByName('sprod_ID').AsInteger;
    s_gost := FindSpprod.IBSpprodGOST.AsString;
    s_xarkt := FindSpprod.IBSpprodXARKT.AsString;
    s_nmat := FindSpprod.IBSpprodNMAT.AsString;
    s_kei := FindSpprod.IBSpprodKEI_ID.VALUE;
    s_korg := FindSpprod.IBSpprodKORG.VALUE;
    s_kodProd := FindSpprod.IBSpprodKOD_PROD.AsString;
    s_namorg := FindSpprod.IBSpprodNAME_ORG.AsString;
    s_neiz := FindSpprod.IBSpprodNEIS.AsString;
    s_reg := FindSpprod.IBSpprod.FieldByName('Name_Reg').AsString;
    s_pr_syr := FindSpprod.IBSpprod.FieldByName('Namspsr').AsString;
    s_vid_isp := FindSpprod.IBSpprod.FieldByName('Namevis').AsString;
    s_stname := FindSpprod.IBSpprod.FieldByName('STNAME').AsString;
    struk := FindSpprod.IBSpprod.FieldByName('struk_ID').AsInteger;
    if (FindSpprod.IBSpprod.FieldByName('ACTIVP').Asinteger = 1) then
      Label5.caption := 'Действующие'
    else
      label5.caption := 'Недействующие';
    label19.caption := s_NMAT;
    label8.caption := s_stname;
    label29.caption := s_namorg;
    label21.caption := s_Neiz;
    label22.caption := s_GOST;
    label41.caption := s_Xarkt;
    label27.caption := s_vid_isp;
    label34.caption := s_pr_syr;
    label43.caption := s_reg;
    DM1.VoprosWriteNorm;
    ProsmNorm;
  end;
end;

procedure TFNorm.SpinEdit2Change(Sender: TObject);
begin
 god:=SpinEdit2.Value;
 IF MES<10 THEN S_MES:='0'+INTTOSTR(MES) ELSE S_MES:=INTTOSTR(MES);
 S_DAT1:='01.'+S_MES+'.'+copy(INTTOSTR(GOD),3,2);
 S_DAT2:=datetostr(IncMonth(strtodate(s_dat1),1)-1);
 if s_kodp<>0 then ProsmNorm;
end;

procedure TFNorm.ToolButton1Click(Sender: TObject);
var
s_kodp_kop: integer;
begin
  dm1.normLoading := true;
 if FindSpprod=nil then FindSpprod:=TfindSpprod.Create(Application);
 FindSpprod.DataBaseName:=dm1.BELMED;
 FindSpprod.ReadOnly:=true;
 FindSpprod.ShowModal;
 if FindSpprod.ModalResult > 50 then
 begin
  s_kodp_kop:=FindSpprod.ModalResult-50;
  IF DM1.IBRabNORM.Active=true then DM1.IBRabNorm.Close;
  DM1.IBRabNorm.ParamByName('kod').AsInteger:=s_kodp_kop;
  DM1.IBRabNorm.ParamByName('god').AsInteger:=god;
  DM1.IBRabNorm.ParamByName('mes').AsInteger:=mes;
  DM1.IBRabNorm.ParamByName('oper').AsInteger:=119;
  DM1.IBRabNorm.Open;
  DM1.IBRabNORM.First;
  while not DM1.IBRabNorm.Eof do
  begin
    dm1.Norm.Insert;
    dm1.setNormRec(vdocument_id, s_kodp, dm1.IBRabNorm.FieldByName('Kraz').Asinteger,
                   dm1.IBRabNorm.FieldByName('Ksm_id').Asinteger, Struk, dm1.IBRabNorm.FieldByName('Kei_id').Asinteger,
                   dm1.IBRabNorm.FieldByName('Razdel_id').AsInteger, dm1.IBRabNorm.FieldByName('Prpf').AsInteger,
                   dm1.IBRabNorm.FieldByName('Pr_Ov').AsInteger, Mes, God, 119,
                   dm1.IBRabNorm.FieldByName('Plnorm').AsFloat, dm1.IBRabNorm.FieldByName('Nazprpf').AsString,
                   dm1.IBRabNorm.FieldByName('Nmat').AsString, dm1.IBRabNorm.FieldByName('Neis').AsString,
                   dm1.IBRabNorm.FieldByName('Gost').AsString, dm1.IBRabNorm.FieldByName('Xarkt').AsString,
                   dm1.IBRabNorm.FieldByName('Kod_Prod_ksm').AsString, s_dat1, '-32000', '-32000');
    dm1.Norm.Post;
    DM1.IBRabNorm.next;
  end;
 end;
 dm1.normLoading := false;
end;

procedure TFNorm.ToolButton2Click(Sender: TObject);
begin
  if (MessageDlg('Удалять нормы на препарате? ', mtConfirmation, [mbYes,mbNo], 0) = mrYes) then
  begin
    try
      dm1.startRWTranss;
      DM1.Norm.Active := true;
      DM1.Norm.First;
      while (not DM1.Norm.Eof) do
        DM1.Norm.Delete;
    except
      On E : Exception do
      begin
        MessageDlg('Произошла ошибка при удалении записи!' + E.Message, mtWarning, [mbOK], 0);
        Abort;
      end;
    end;
  end;
end;

procedure TFNorm.ToolButton3Click(Sender: TObject);
begin
  if (checkDoubleRecords()) then
    ShowMessage('Есть задвоенные строки! Проверьте правильность введенных данных.')
  else
    saveNorms;
end;

procedure TFNorm.saveNorms;
var
  dd : integer;
begin
  dm1.normLoading := true;
  if (dm1.norm.Modified) or (dm1.norm.State = dsEdit)
     or (dm1.norm.State = dsInsert) then
    dm1.norm.Post;
  DM1.ApplyUpdatesNorm;
  dm1.norm.First;
  if (dm1.norm.Locate('nazprpf', 'п/ф', [])) then             //       Расчет и запись расшифровки
  begin
    s_dat_rashif := datetostr(dm1.Norm.FieldByName('datanorm').AsDateTime);
    if (strtodate(s_dat_rashif) < strtodate('01.11.2009')) then
      Pr_ARX := 1
    else
      Pr_Arx := 0;
    dm1.startRWTranss;
    DM1.RaschRashif;
  end
  else
  begin                                                         //       удаление расшифровки
    dm1.openNorm(s_kodp, god, mes, 120);
    if (not DM1.Norm.Eof) then
    begin
      dd := dm1.normDoc_id.asinteger;
      while (not DM1.Norm.Eof) do
        DM1.Norm.Delete;
      DM1.Norm.ApplyUpdates;
      dm1.Document.Active := false;
      DM1.DOcUMENT.MacroByName('USL').AsString := 'WHERE DOcUMENT.doc_ID = ' + INTTOSTR(dd);
      DM1.DOCUMENT.OPEN;
      if (not dm1.Document.Eof) then
        DM1.Document.Delete;
      DM1.Document.ApplyUpdates;
    end;
  end;
  dm1.startRWTranss;
  DM1.IBT_WRITE.Commit;
  DM1.IBT_READ.CommitRetaining;
  dm1.norm.Close;
  dm1.document.Close;
  dm1.IBT_WRITE.Active := FALSE;
  dm1.IBT_READ.Active := FALSE;
  dm1.startRWTranss;
  dm1.normLoading := false;
  ProsmNorm;

end;

procedure TFNorm.ToolButton4Click(Sender: TObject);
begin
  dm1.normLoading := true;
  if (dm1.norm.Active) then
  begin
    s_kodp_s := 0;
    struks := 0;
    dm1.r_sprod.Active := False;
    dm1.r_sprod.MacroByName('usl').AsString := ' spprod.ksm_id=' + inttostr(s_kodp)
                                               + ' and spprod.struk_id=' + inttostr(struk);
    dm1.r_sprod.MacroByName('ut_tek_plan').AsString := '';
    dm1.r_sprod.ParamByName('mes').AsInteger := mes;
    dm1.r_sprod.ParamByName('god').AsInteger := god;
    dm1.r_sprod.Active := true;
    if (not dm1.R_sprod.Eof) then
    begin
      dm1.r_sprod.Edit;
      dm1.r_sprodVib.AsInteger := 1;
      dm1.r_sprodVid.AsInteger := RadioGroup3.ItemIndex;
      dm1.r_sprod.Post;
    end;
    DM1.norm.First;
    DM1.Norm.DisableControls;
    if (dm1.p_rashif.Active) then
       dm1.p_rashif.Close;
    dm1.p_rashif.EmptyTable;
    dm1.p_rashif.LoadFromDataSet(DM1.norm, [mtcpoAppend]);
    dm1.p_rashif.Active := True;
    dm1.p_rashif.First;
    dm1.frxReport1.LoadFromFile(reportPath + 'P_normg.fr3');
    dm1.frxReport1.ShowReport;
    while (DM1.Norm.ControlsDisabled) do
      DM1.Norm.EnableControls;
  end;
  dm1.normLoading := false;
end;

procedure TFNorm.ToolButton5Click(Sender: TObject);
begin
  dm1.normLoading := true;
 if (DecodeSpprod = nil) then
  begin
    Application.CreateForm(TDecodeSpprod, DecodeSpprod);
  end;
  DecodeSpprod.l_id:=s_kodp;
  DecodeSpprod.DEC.Database:=dm1.BELMED;
  DecodeSpprod.ShowModal;
  dm1.normLoading := false;
end;

procedure TFNorm.ToolButton5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  s_kodp_spr := s_kodp;
end;

procedure TFNorm.ToolButton6Click(Sender: TObject);
begin
  dm1.normLoading := true;
  FindMatrop.DataBaseName := dm1.BELMED;
  FindMatrop.k_id := dm1.Norm.FieldByName('ksm_id').AsInteger;
  DecodeMatrop.ShowModal;
  dm1.normLoading := false;
end;

procedure TFNorm.ProsmNorm;
//var
//  prevNorms : boolean;
begin
//  prevNorms := false;
  dm1.normLoading := true;
  vTip_Op_Id := 119;
  v_Tip_Dok := 102;
  vDocument_Id := 0;
  dm1.openNorm(s_kodp, god, mes, 119);
  IF (DM1.NORM.eof) THEN
  begin
    IF (DM1.IBRabNORM.Active = true) then
      DM1.IBRabNorm.Close;
    DM1.IBRabNorm.ParamByName('kod').AsInteger := s_kodp;
    DM1.IBRabNorm.ParamByName('god').AsInteger := god;
    DM1.IBRabNorm.ParamByName('mes').AsInteger := mes;
    DM1.IBRabNorm.ParamByName('oper').AsInteger := 119;
    DM1.IBRabNorm.Open;
    DM1.IBRabNORM.First;      
    IF (DM1.IBRabNORM.eof) THEN
    begin
// из архива
      IF (DM1.NORMArx.Active = true) then
        DM1.NormArx.Close;
      DM1.NormArx.ParamByName('kod').AsInteger := s_kodp;
      DM1.NormArx.ParamByName('god').AsInteger := god;
      DM1.NormArx.ParamByName('mes').AsInteger := mes;
      DM1.NormArx.Open;
      DM1.NORMArx.First;
      if (not DM1.NORMArx.Eof) then
      begin
        while (not DM1.NORMArx.Eof) do
        begin
          dm1.Norm.Insert;
          dm1.setNormRec(-32000, s_kodp, dm1.NormArx.FieldByName('Kraz').Asinteger,
                         dm1.NormArx.FieldByName('Ksm_id').Asinteger, dm1.NormArx.FieldByName('Struk_ID').AsInteger,
                         dm1.NormArx.FieldByName('Kei_id').Asinteger, dm1.NormArx.FieldByName('Razdel_id').AsInteger,
                         dm1.NormArx.FieldByName('Prpf').AsInteger, dm1.NormArx.FieldByName('Pr_Ov').AsInteger,
                         Mes, God, 119, dm1.NormArx.FieldByName('Plnorm').AsFloat,
                         dm1.NormArx.FieldByName('Nazprpf').AsString, dm1.NormArx.FieldByName('Nmat').AsString,
                         dm1.NormArx.FieldByName('Neis').AsString, dm1.NormArx.FieldByName('Gost').AsString,
                         dm1.NormArx.FieldByName('Xarkt').AsString, dm1.NormArx.FieldByName('Kod_Prod').AsString,
                         s_dat1, dm1.NormArx.FieldByName('Kodraz').AsString,
                         dm1.NormArx.FieldByName('namraz').AsString);
          dm1.Norm.Post;
          dM1.NormArx.next;
        end;
        label12.Caption := dm1.MesName_1(dm1.NormArxMes.AsInteger) + ' '
                           + IntToStr(dm1.NormArxGod.AsInteger) + ' г.';
        if (label5.caption = 'Действующие') then
          label5.Font.Color := clNavy
        else
          label5.Font.Color := clRed;
      end
      else
      begin
// новые нормы
        FNorm.label5.caption := 'Нет норм';
        label5.Font.Color := clRed;
      end;
    end
    else
    begin
// уже были когда-то - переносим в текущий месяц
//      prevNorms := true;
      while (not DM1.IBRabNorm.Eof) do
      begin
        dm1.Norm.Insert;
        dm1.setNormRec(-32000, s_kodp, dm1.IBRabNorm.FieldByName('Kraz').Asinteger,
                       dm1.IBRabNorm.FieldByName('Ksm_id').Asinteger, dm1.IBRabNorm.FieldByName('Struk_ID').AsInteger,
                       dm1.IBRabNorm.FieldByName('Kei_id').Asinteger, dm1.IBRabNorm.FieldByName('Razdel_id').AsInteger,
                       dm1.IBRabNorm.FieldByName('Prpf').AsInteger, dm1.IBRabNorm.FieldByName('Pr_Ov').AsInteger,
                       Mes, God, 119, dm1.IBRabNorm.FieldByName('Plnorm').AsFloat,
                       dm1.IBRabNorm.FieldByName('Nazprpf').AsString, dm1.IBRabNorm.FieldByName('Nmat').AsString,
                       dm1.IBRabNorm.FieldByName('Neis').AsString, dm1.IBRabNorm.FieldByName('Gost').AsString,
                       dm1.IBRabNorm.FieldByName('Xarkt').AsString, dm1.IBRabNorm.FieldByName('Kod_Prod_ksm').AsString,
                       s_dat1, dm1.IBRabNorm.FieldByName('Kodraz').AsString,
                       dm1.IBRabNorm.FieldByName('namraz').AsString);
        dm1.Norm.Post;
        DM1.IBRabNorm.next;
      end;
      label12.Caption := dm1.MesName_1(dm1.IBRabnormMes.AsInteger) + ' '
                         + IntToStr(dm1.IBRabnormGod.AsInteger) + ' г.';
      if (label5.caption = 'Действующие') then
        label5.Font.Color := clNavy
      else
        label5.Font.Color := clRed;
    end;
  end
  else
    label12.Caption := dm1.MesName_1(Mes) + ' ' + IntToStr(God) + ' г.';
    if (vDocument_Id = 0) then
    begin
      if (DM1.DOCUMENT.active) then
        DM1.DOCUMENT.Close;
      DM1.DOcUMENT.MacroByName('USL').AsString := 'WHERE DOcUMENT.STRUK_ID=' + INTTOSTR(VsTRUK_ID)
                                                  + ' AND (DOCUMENT.TIP_OP_ID=119)'
                                                  + ' and document.klient_id=' + inttostr(s_kodp)
                                                  + ' AND Document.Date_op=' + '''' + s_dat1 + '''';
      DM1.DOCUMENT.OPEN;
      dm1.Document.First;
      if (dm1.Document.Locate('Tip_op_id', 119, [])) then
        vDocument_id := dm1.DocumentDoc_id.AsInteger
      else
      begin
        vNDoc := 'Нор' + inttostr(S_Kodp) + '-' + inttostr(mes) + '.' + inttostr(god);
        vDat_op := strtodate(s_dat1);
        dm1.Document.Insert;
        dm1.Document.Post;
      end;
      dm1.norm.First;
      While (not dm1.norm.Eof) do
      begin
        dm1.norm.Edit;
        dm1.normDoc_id.AsInteger := vDocument_id;
        dm1.norm.Post;
        dm1.norm.Next;
      end;
//    if (prevNorms) then
//      saveNorms;
    dm1.norm.First;
  end;
  dm1.normLoading := false;
end;

end.
