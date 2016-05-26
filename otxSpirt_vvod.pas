unit otxSpirt_vvod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, DB, IBCustomDataSet, IBUpdateSQL, IBUpdSQLW, IBQuery,
  RxIBQuery, ComCtrls, ExtCtrls, DBCtrls, ToolWin, Grids, DBGridEh, Buttons,
  StdCtrls,UtilRIB,RxStrUtils, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, System.UITypes;

type
  TFOtxSpirt_vvod = class(TForm)
    DBGridEh2: TDBGridEh;
    ToolBar1: TToolBar;
    DBNavigator1: TDBNavigator;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Otxody: TRxIBQuery;
    DSOtxody: TDataSource;
    ImageList1: TImageList;
    OtxodyKODP_O: TIntegerField;
    OtxodyKODP_OS: TIntegerField;
    OtxodySTRUK_ID: TIntegerField;
    OtxodyDATEVV: TDateField;
    OtxodyRAZDEL_IDO: TSmallintField;
    OtxodyRAZDEL_IDOS: TSmallintField;
    OtxodyKSM_IDO: TIntegerField;
    OtxodyKSM_IDOS: TIntegerField;
    OtxodyKEI_IDO: TSmallintField;
    OtxodyKEI_IDOS: TSmallintField;
    OtxodyKODST_O: TIBStringField;
    OtxodyKODST_OS: TIBStringField;
    OtxodyBAS_ID: TIntegerField;
    OtxodyNAMPRO: TIBStringField;
    OtxodyNAMPROS: TIBStringField;
    OtxodyNEISO: TIBStringField;
    OtxodyNEISOS: TIBStringField;
    OtxodyNAMO: TIBStringField;
    OtxodyNAMOS: TIBStringField;
    OtxodyKRAZ_O: TSmallintField;
    OtxodyKRAZ_OS: TSmallintField;
    OtxodySTNAME: TIBStringField;
    OtxodyPROD_O: TIBStringField;
    OtxodyPROD_OS: TIBStringField;
    IBOtxody: TIBUpdateSQLW;
    Label2: TLabel;
    Edit4: TEdit;
    SpeedButton3: TSpeedButton;
    OtxodySTKOD: TIBStringField;
    Label1: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    OtxodySPROD_IDO: TIntegerField;
    OtxodySPROD_IDOS: TIntegerField;
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure DBGridEh2EditButtonClick(Sender: TObject);
    procedure OtxodyNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton4Click(Sender: TObject);
    procedure OtxodyKEI_IDOValidate(Sender: TField);
    procedure OtxodyKSM_IDOSValidate(Sender: TField);
    procedure DBGridEh2SortMarkingChanged(Sender: TObject);
    procedure OtxodyBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOtxSpirt_vvod: TFOtxSpirt_vvod;

  uslOrd : string;

implementation
 uses dm,Ediz,Find_Matrop,Find_Struk,Find_spprod,Razdel;
{$R *.dfm}

procedure TFOtxSpirt_vvod.DBGridEh2EditButtonClick(Sender: TObject);
var
  nm : integer;
begin
  nm := 0;
 if dbgrideh2.SelectedField.FieldName='NEISO' then nm:=1;
 if dbgrideh2.SelectedField.FieldName='KSM_IDO' then nm:=2;
 if dbgrideh2.SelectedField.FieldName='NEISOS' then nm:=3;
 if dbgrideh2.SelectedField.FieldName='KSM_IDOS' then nm:=4;
  if dbgrideh2.SelectedField.FieldName='KRAZ_O' then nm:=5;
 if dbgrideh2.SelectedField.FieldName='PROD_OS' then nm:=6;
 if dbgrideh2.SelectedField.FieldName='KRAZ_OS' then nm:=7;
 OTXODY.Edit;
 case nm of
  1: begin
    if Find_Ediz=nil then Find_Ediz:=TFind_Ediz.Create(Application);
    Find_Ediz.ShowModal;
    if Find_Ediz.ModalResult > 50 then
    begin
     OtxodyKei_ido.AsInteger:=find_ediz.EDIZKei_Id.AsInteger;
     OtxodyNeiso.AsString:=find_ediz.EdizNeis.AsString;
    end;
   end;
  2: begin
    if FindMatrop=nil then FindMatrop:=TfindMatrop.Create(Application);
    FindMatrop.DataBaseName:=dm1.BELMED;
    FindMatrop.ReadOnly:=true;
    FindMatrop.ShowModal;
    if FindMatrop.ModalResult > 50 then
    begin
     Otxody.FieldByName('Ksm_Ido').AsInteger :=FindMatrop.ModalResult-50;
     Otxody.FieldByName('Namo').AsString :=FindMatrop.IBMatropNMAT.AsString;
    end;
   end;
  3: begin
    if Find_Ediz=nil then Find_Ediz:=TFind_Ediz.Create(Application);
    Find_Ediz.ShowModal;
    if Find_Ediz.ModalResult > 50 then
    begin
     OtxodyKei_idos.AsInteger:=find_ediz.EDIZKei_Id.AsInteger;
     OtxodyNeisos.AsString:=find_ediz.EdizNeis.AsString;
    end;
   end;
   4: begin
    if FindMatrop=nil then FindMatrop:=TfindMatrop.Create(Application);
    FindMatrop.DataBaseName:=dm1.BELMED;
    FindMatrop.ReadOnly:=true;
    FindMatrop.ShowModal;
    if FindMatrop.ModalResult > 50 then
    begin
     Otxody.FieldByName('Ksm_Idos').AsInteger :=FindMatrop.ModalResult-50;
     Otxody.FieldByName('Namos').AsString :=FindMatrop.IBMatropNMAT.AsString;
    end;
   end;
   5: begin
    if FRazdel=nil then FRazdel:=TFRazdel.Create(Application);
    fRazdel.ShowModal;
    if FRazdel.ModalResult > 50 then
    begin
     Otxody.FieldByName('Razdel_ido').AsInteger :=FRazdel.ModalResult-50;
     Otxody.FieldByName('Kraz_o').AsInteger:=FRazdel.RazdelKraz.AsInteger;
    end;
   end;
   6: begin
    if FindSpprod=nil then FindSpprod:=TfindSpprod.Create(Application);
    FindSpprod.DataBaseName:=dm1.BELMED;
    FindSpprod.ReadOnly:=true;
    FindSpprod.ShowModal;
    if FindSpprod.ModalResult > 50 then
    begin
     Otxody.FieldByName('Kodp_os').AsInteger :=FindSpprod.ModalResult-50;
     Otxody.FieldByName('sprod_idos').AsInteger :=FindSpprod.IBSpprodSprod_id.AsInteger;
     Otxody.FieldByName('Prod_os').AsString :=FindSpprod.IBSpprodKod_Prod.AsString;
     Otxody.FieldByName('Nampros').AsString :=FindSpprod.IBSpprodNmat.AsString;
     Otxody.FieldByName('kodst_os').AsString :=FindSpprod.IBSpprodSpksm.AsString;
    end;
   end;
   7: begin
    if FRazdel=nil then FRazdel:=TFRazdel.Create(Application);
    fRazdel.ShowModal;
    if FRazdel.ModalResult > 50 then
    begin
     Otxody.FieldByName('Razdel_idos').AsInteger :=FRazdel.ModalResult-50;
     Otxody.FieldByName('Kraz_os').AsInteger:=FRazdel.RazdelKraz.AsInteger;
    end;
   end;
  end;

end;

procedure TFOtxSpirt_vvod.DBGridEh2SortMarkingChanged(Sender: TObject);
var
  i :Integer;
begin
  uslOrd := '';
  for i := 0 to DBGridEh2.SortMarkedColumns.Count-1 do
  begin
    if (DBGridEh2.SortMarkedColumns[i].Title.SortMarker = smUpEh) then
       uslOrd := uslOrd + '"'+ DBGridEh2.SortMarkedColumns[i].FieldName + '"'+ ' DESC , '
    else
       uslOrd := uslOrd + '"'+DBGridEh2.SortMarkedColumns[i].FieldName + '"'+ ', ';
  end;
  if (uslOrd <> '') then
    uslOrd := Copy(uslOrd, 1, Length(uslOrd) - 2);
  Otxody.Close;
  Otxody.Open;
end;

procedure TFOtxSpirt_vvod.Edit1Change(Sender: TObject);
begin
 if edit1.text<>'' then begin
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
   Label3.Caption:=DM1.IBQuery1.FieldByName('kod_PROD').Asstring+DM1.IBQuery1.FieldByName('nmat').AsString;
  end
  else
  begin
   s_kodp:=0;
   Label3.Caption:='';
 end;
 Label3.Refresh;
end;
end;

procedure TFOtxSpirt_vvod.Edit1Click(Sender: TObject);
begin
 edit1.text:='';
end;

procedure TFOtxSpirt_vvod.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
  if s_kodp<>0 then
  begin
    DM1.IBQuery1.Active := False;
    DM1.IBQuery1.SQL.Clear;
    DM1.IBQuery1.SQL.Add('SELECT SPPROD.STRUK_ID,SPPROD.NMAT, SPPROD.KOD_PROD, SPPROD.KEI_ID,SPPROD.KSM_ID,');
    DM1.IBQuery1.SQL.Add('SPPROD.GOST,EDIZ.NEIS,SPPROD.KORG,SPPROD.XARKT,SPPROD.ACTIVP,SPRORG.NAM,');
    DM1.IBQuery1.SQL.Add('SPVIS.NAMEVIS, PRSYR.NAMSPSR,STRUK.STNAME,struk.stkod, REGION.NAM NAME_REG,SPPROD.sprod_ID');
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
    s_sprod:=DM1.IBQuery1.FieldByName('sprod_id').AsInteger;
    s_kodp:=DM1.IBQuery1.FieldByName('ksm_id').AsInteger;
    s_nmat:=DM1.IBQuery1.FieldByName('NMAT').AsString;
    s_kodProd:=DM1.IBQuery1.FieldByName('KOD_PROD').AsString;
    s_namorg:=DM1.IBQuery1.FieldByName('NAM').AsString;
    s_neiz:=DM1.IBQuery1.FieldByName('NEIS').AsString;
    s_reg:=DM1.IBQuery1.FieldByName('Name_Reg').AsString;
    s_pr_syr:=DM1.IBQuery1.FieldByName('Namspsr').AsString;
    s_vid_isp:=DM1.IBQuery1.FieldByName('Namevis').AsString;
    edit4.text:= DM1.IBQuery1.FieldByName('STkod').AsString;
    label4.caption:= DM1.IBQuery1.FieldByName('STNAME').AsString;
    struk:=DM1.IBQuery1.FieldByName('struk_ID').AsInteger;
    label3.caption:=s_NMAT;
    usl:=' struk.struk_id='+inttostr(struk)+' and otxody.kodp_o='+ inttostr(s_kodp);
    Otxody.Close;
    Otxody.MacroByName('us').AsString:=usl;
    Otxody.Open;
   end;
  end;
end;

procedure TFOtxSpirt_vvod.Edit4Click(Sender: TObject);
begin
 Edit4.Text:='';
label4.caption:='';
end;

procedure TFOtxSpirt_vvod.Edit4KeyDown(Sender: TObject; var Key: Word;
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
      label4.caption:=kod;
      struk:=SelectToVarIB('SELECT  struk.struk_id FROM  struk WHERE struk.kod_struk='+''+Edit4.Text+'',dm1.BELMED, dm1.BELMED.DefaultTransaction);
      if not Otxody.Active then Otxody.Active:=true;
      usl:=' struk.struk_id='+inttostr(struk);
      Otxody.Close;
      Otxody.MacroByName('us').AsString:=usl;
      Otxody.Open;
    end;
  end;
 end;
end;

procedure TFOtxSpirt_vvod.FormShow(Sender: TObject);
begin
  uslOrd := 'PROD_OS ';
  if (not Otxody.Active) then
    Otxody.Open;
  if (not Otxody.Eof) then
  begin
    label4.caption := OtxodyStname.AsString;
    Edit4.Text := OtxodyStkod.AsString;
    EDIT1.OnChange := nil;
    Edit1.Text := OtxodyProd_o.AsString;
    EDIT1.OnChange := Edit1Change;
    Label3.Caption := OtxodyNampro.AsString;
    struk := OtxodyStruk_id.AsInteger;
    s_kodp := OtxodyKodp_o.AsInteger;
    s_nmat := OtxodyNampro.AsString;
    usl := ' struk.struk_id=' + inttostr(struk) + ' and otxody.kodp_o=' + inttostr(s_kodp);
  end;
end;

procedure TFOtxSpirt_vvod.OtxodyBeforeOpen(DataSet: TDataSet);
begin
  Otxody.MacroByName('usl_ord').AsString := uslOrd;
end;

procedure TFOtxSpirt_vvod.OtxodyKEI_IDOValidate(Sender: TField);
begin
 dM1.Matrop.Active:=false;
 dM1.Matrop.ParamByName('ksm').AsInteger:=Otxody.FieldByName('Ksm_Ido').AsInteger;
 dM1.Matrop.Active:=TRUE;
 if not dm1.Matrop.eof then
 begin
  Otxody.FieldByName('Namo').AsString :=dm1.Matrop.FieldByName('Nmat').AsString;;
 end
 else
  showMessage('Нет такого кода! Воспользуйтесь справочником!');
end;

procedure TFOtxSpirt_vvod.OtxodyKSM_IDOSValidate(Sender: TField);
begin
 dM1.Matrop.Active:=false;
 dM1.Matrop.ParamByName('ksm').AsInteger:=Otxody.FieldByName('Ksm_Idos').AsInteger;
 dM1.Matrop.Active:=TRUE;
 if not dm1.Matrop.eof then
 begin
  Otxody.FieldByName('Namos').AsString :=dm1.Matrop.FieldByName('Nmat').AsString;;
 end
 else
  showMessage('Нет такого кода! Воспользуйтесь справочником!');
end;

procedure TFOtxSpirt_vvod.OtxodyNewRecord(DataSet: TDataSet);
begin
 OtxodyDatevv.AsDateTime:=date;
 if OtxodyKodp_o.AsInteger=0 then OtxodyKodp_o.AsInteger:=s_kodp;
 if OtxodySprod_ido.AsInteger=0 then OtxodySprod_ido.AsInteger:=s_sprod;
 if Otxodynampro.AsString='' then OtxodyNampro.AsString:=s_nmat;
 if OtxodyStruk_ID.AsInteger=0 then OtxodyStruk_id.AsInteger:=struk;
end;

procedure TFOtxSpirt_vvod.SpeedButton1Click(Sender: TObject);
begin
 if FindSpprod=nil then FindSpprod:=TfindSpprod.Create(Application);
 FindSpprod.DataBaseName:=dm1.BELMED;
 FindSpprod.ReadOnly:=true;
 FindSpprod.ShowModal;
 if FindSpprod.ModalResult > 50 then
 begin
  EDIT1.OnChange:=nil;
  edit1.text:=FindSpprod.IBSpprodKod_Prod.Asstring;
  EDIT1.OnChange:=Edit1Change;
  s_kodp:=FindSpprod.ModalResult-50;
  s_kodProd:=FindSpprod.IBSpprodKOD_PROD.AsString;
  struk:=FindSpprod.IBSpprodStruk_id.AsInteger;
  s_sprod:=FindSpprod.IBSpprodSprod_id.AsInteger;
  s_NMAT:=FindSpprod.IBSpprodnmat.AsString;
  label3.caption:=s_NMAT;
  DM1.IBQuery1.Active := False;
  DM1.IBQuery1.SQL.Clear;
  DM1.IBQuery1.SQL.Add('SELECT struk.STkod,struk.stname from struk where struk.struk_id='+inttostr(struk));
  DM1.IBQuery1.Active := True;
  edit4.text:=DM1.IBQuery1.FieldByName('stkod').Asstring;
  label4.caption:=DM1.IBQuery1.FieldByName('stname').Asstring;;
  usl:=' struk.struk_id='+inttostr(struk)+' and otxody.kodp_o='+ inttostr(s_kodp);
  Otxody.Close;
  Otxody.MacroByName('us').AsString:=usl;
  Otxody.Open;
 end;
end;

procedure TFOtxSpirt_vvod.SpeedButton3Click(Sender: TObject);
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
  label4.caption:=FindStruk.name;
  Edit4.Text:=FindStruk.kod;
  if not Otxody.Active then Otxody.Active:=true;
  usl:=' struk.struk_id='+inttostr(struk);
  Otxody.Close;
  Otxody.MacroByName('us').AsString:=usl;
  Otxody.Open;
 end;
end;

procedure TFOtxSpirt_vvod.ToolButton1Click(Sender: TObject);
begin
 Otxody.Delete;
end;

procedure TFOtxSpirt_vvod.ToolButton2Click(Sender: TObject);
begin
 Otxody.Open;
 Otxody.Insert;
end;

procedure TFOtxSpirt_vvod.ToolButton3Click(Sender: TObject);
begin
 if (Otxody.Modified) or (Otxody.State =dsEdit)
    or (Otxody.State =dsInsert) then
  Otxody.Post;
 dm1.startWriteTrans;
 try
  if Otxody.UpdatesPending then
   Otxody.ApplyUpdates;
  DM1.IBT_Write.CommitRetaining;
  dm1.IBT_Write.Active:=false;
  dm1.IBT_read.Active:=false;
  dm1.IBT_Read.Active:=true;
  Otxody.Close;
  dm1.IBT_Read.Active:=true;
  dm1.IBT_Write.Active:=true;
  usl:=' struk.struk_id='+inttostr(struk)+' and otxody.kodp_o='+ inttostr(s_kodp);
  Otxody.MacroByName('us').AsString:=usl;
  Otxody.Open;
 except
  on E: Exception do
  begin
   MessageDlg('Произошла ошибка при записи !'+E.Message, mtWarning, [mbOK], 0);
   raise;
   Otxody.CancelUpdates;
   DM1.IBT_Write.RollbackRetaining;
  end;
 end;
end;

procedure TFOtxSpirt_vvod.ToolButton4Click(Sender: TObject);
begin
 dm1.Copy_Otxody;
end;

end.
