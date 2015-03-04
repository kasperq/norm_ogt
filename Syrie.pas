unit Syrie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, DBCtrls, ExtCtrls, Spin, ImgList,
  ComCtrls, ToolWin, Buttons, ActnList, FindDlgEh, UtilRIB,RxStrUtils,VCLUtils,
  DateUtils,SplshWnd, DB, RxMemDS,Utilr;

type
  TFSyrie = class(TForm)
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ImageList1: TImageList;
    Label1: TLabel;
    Label3: TLabel;
    SpinEdit2: TSpinEdit;
    Panel1: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label37: TLabel;
    Label39: TLabel;
    Label19: TLabel;
    SpeedButton2: TSpeedButton;
    Edit1: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBGridEh1: TDBGridEh;
    Label7: TLabel;
    Label11: TLabel;
    Panel2: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    SpeedButton1: TSpeedButton;
    Label20: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Edit2: TEdit;
    Label26: TLabel;
    Edit3: TEdit;
    RadioGroup2: TRadioGroup;
    FindDlgEh1: TFindDlgEh;
    Label27: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    SpeedButton3: TSpeedButton;
    ToolButton7: TToolButton;
    Label28: TLabel;
    Edit6: TEdit;
    CheckBox1: TCheckBox;
    SpeedButton4: TSpeedButton;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    SpeedButton5: TSpeedButton;
    Label6: TLabel;
    Edit10: TEdit;
    SpeedButton6: TSpeedButton;
    Edit11: TEdit;
    Label22: TLabel;
    Spis_Rashif: TRxMemoryData;
    ComboBox1: TComboBox;
    DBNavigator1: TDBNavigator;
    Spis_Rashifkodp: TFloatField;
    Spis_RashifSTRUK_ID: TIntegerField;
    planCB: TCheckBox;
    potrebCB: TCheckBox;
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGridEh1SortMarkingChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ToolButton6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure Edit6Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit6KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Edit8Click(Sender: TObject);
    procedure Edit8KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Edit10Click(Sender: TObject);
    procedure Edit10KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGridEh1EditButtonClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure planCBClick(Sender: TObject);
    procedure potrebCBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Splash: TForm;
  AniBmp1: TBitmap;
  FSyrie: TFSyrie;
  s_ksmz:integer;
  s_keiz: integer;
  kod_z:string;
  struk_z: integer;
  s_prpf: integer;
  Pr_ins_del:integer;

implementation
  uses dm,Find_Spprod, Find_Matrop,Decode_Spprod,Decode_Matrop,ediz,razdel,
  glmenu_ogt,Find_Struk;
{$R *.dfm}

procedure TFSyrie.CheckBox1Click(Sender: TObject);
begin
 if checkBox1.Checked=false then
  s_prpf:=0
 else
  s_prpf:=1;
 end;

procedure TFSyrie.planCBClick(Sender: TObject);
begin
  DBGridEh1.Columns[12].Visible := planCB.Checked;
  DBGridEh1.Columns[13].Visible := planCB.Checked;
end;

procedure TFSyrie.potrebCBClick(Sender: TObject);
begin
  DBGridEh1.Columns[13].Visible := potrebCB.Checked;
end;

procedure TFSyrie.ComboBox1Change(Sender: TObject);
begin
 	god := SpinEdit2.Value;
 	mes := ComboBox1.ItemIndex+1;
 	IF (MES < 10) THEN
  	S_MES := '0' + INTTOSTR(MES)
  ELSE
  	S_MES := INTTOSTR(MES);
 	S_DAT1 := '01.' + S_MES + '.' + copy(INTTOSTR(GOD), 3, 2);
 	S_DAT2 := datetostr(IncMonth(strtodate(s_dat1), 1) - 1);
 	StartWait;
  dm1.openNormSyr(s_ksm, god, mes, struk, usl, sort);
 	StopWait;
end;

procedure TFSyrie.DBGridEh1EditButtonClick(Sender: TObject);
begin
 if dbgrideh1.SelectedField.FieldName='KOD_PROD' then
 begin
  if FindSpprod=nil then FindSpprod:=TfindSpprod.Create(Application);
  FindSpprod.DataBaseName:=dm1.BELMED;
  FindSpprod.ReadOnly:=true;
  FindSpprod.ShowModal;
  if FindSpprod.ModalResult > 50 then
  begin
   dm1.NormSy.FieldByName('kod_prod').AsString:=FindSpprod.IBSpprodKod_Prod.Asstring;
   dm1.NormSyKodp.AsInteger:=FindSpprod.ModalResult-50;
   dm1.NormSyNmat.AsString:=FindSpprod.IBSpprodNMAT.AsString;
   dm1.NormSyNam.AsString:=FindSpprod.IBSpprodNaMe_reg.AsString;
   dm1.NormSyStruk_id.AsInteger:=FindSpprod.IBSpprodStruk_id.AsInteger;
   dm1.NormSySprod_id.AsInteger:=FindSpprod.IBSpprodSprod_id.AsInteger;
   dm1.NormSyKraz.AsInteger:=strtoint(edit6.text);
   dm1.NormSyRazdel_id.AsInteger:=s_raz;
   dm1.NormSyksm_id.AsInteger:=s_ksmz;
   dm1.NormSyNeis.AsString:=edit9.text;
   dm1.NormSyKei_id.AsInteger:=s_keiz;
   dm1.NormSyPrpf.AsInteger:=s_prpf;
   dm1.NormSyVib.AsInteger:=1;
   if edit3.text='' then dm1.NormSyPlnorm.AsFloat:=0
   else
    dm1.NormSyPlnorm.AsFloat:=strtoFloat(replacestr(edit3.text,'.',','));
   dm1.NormSyStname.AsString:=FindSpprod.IBSpprod.FieldByName('STNAME').AsString;
   dm1.NormSy.Post;
  end;
 end;
end;

procedure TFSyrie.DBGridEh1SortMarkingChanged(Sender: TObject);

var
  i :Integer;
begin
 S_KSM:=DM1.NormSyKSM_ID.AsInteger;
 Sort := ' order by';
 for i := 0 to DBGridEh1.SortMarkedColumns.Count-1 do
 BEGIN
  if DBGridEh1.SortMarkedColumns[i].Title.SortMarker = smUpEh then
  begin
   Sort := Sort + '"'+ DBGridEh1.SortMarkedColumns[i].FieldName + '"'+ ' DESC , ';
  end
  else
  begin
   Sort := Sort + '"'+DBGridEh1.SortMarkedColumns[i].FieldName + '"'+ ', ';
  end;
 END;
 if Sort <> '' then
 begin
  Sort := Copy(Sort,1,Length(Sort)-2);
  StartWait;
  IF EDIT1.Text='' THEN S_KSM:=S_KSMZ;
  dm1.openNormSyr(s_ksm, god, mes, struk, usl, sort);
  StopWait;
 end;
end;

procedure TFSyrie.Edit10Click(Sender: TObject);
begin
Edit10.Text:='';
Edit11.Text:='';
usl:='0=0'
end;

procedure TFSyrie.Edit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
   if edit10.text<>''  then
   begin
    if FRazdel=nil then FRazdel:=TFRazdel.Create(Application);
    FRazdel.razdel.Active:=true;
    if FRazdel.Razdel.Locate('kraz',strtoint(edit10.Text),[]) then
    begin
     raz:=FRazdel.RazdelRazdel_id.AsInteger;
     Edit11.Text:=FRazdel.RazdelNamraz.AsString;
     Edit10.Text:=inttostr(FRazdel.RazdelKraz.AsInteger);
     usl:=' norm.razdel_id='+inttostr(raz);
    end
    else
     showMessage('Нет такого кода! Воспользуйтесь справочником!');
   end
   else usl:='0=0';
   if edit1.Text<>'' then
   begin
     StartWait;
     dm1.openNormSyr(s_ksm, god, mes, struk, usl, sort);
     StopWait;
   end;
 end;
end;

procedure TFSyrie.Edit1Click(Sender: TObject);
begin
 LABEL4.Caption:='';
 LABEL5.Caption:='';
 LABEL7.Caption:='';
 LABEL11.Caption:='';
 LABEL19.Caption:='';
 LABEL18.Caption:=' ';
 LABEL20.Caption:='';
 LABEL21.Caption:='';
 LABEL24.Caption:='';
 LABEL25.Caption:='';
 edit1.text:='';
 Edit2.Text:='';
 Edit3.Text:='';

end;

procedure TFSyrie.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
   if edit1.text<>''  then
   begin
    dM1.Matrop.Active:=false;
    dM1.Matrop.ParamByName('ksm').AsInteger:=strtoint(edit1.text);
    dM1.Matrop.Active:=TRUE;
    if not dm1.Matrop.eof then
    begin
     s_ksm:=strtoint(edit1.text);
     s_nmats:=dm1.Matrop.FieldByName('Nmat').AsString;
     s_keis :=dm1.Matrop.FieldByName('Kei_id').AsInteger;
     s_Xarkts :=dm1.Matrop.FieldByName('Xarkt').AsString;
     s_Gosts :=dm1.Matrop.FieldByName('Gost').AsString;
     s_Namspsrs :=dm1.MatropNamspsr.AsString;
     s_nams :=dm1.MatropNam.AsString;
     s_namspsrs :=dm1.MatropNamspsr.AsString;
     s_namorgs :=dm1.MatropNam.AsString;
     Label4.Caption :=dm1.Matrop.FieldByName('Xarkt').AsString;
     Label5.Caption :=dm1.Matrop.FieldByName('Gost').AsString;
//     Label6.Caption :=dm1.Matrop.FieldByName('Neis').AsString;
     Label7.Caption :=dm1.MatropNamspsr.AsString;
     Label11.Caption :=dm1.MatropNam.AsString;
     Label19.Caption:=dm1.Matrop.FieldByName('Nmat').AsString;
     if edit4.Text<>'' then Sort := ' ' else Sort := ' order by norm.struk_id,norm.kodp';
     StartWait;
     dm1.openNormSyr(s_ksm, god, mes, struk, usl, sort);
     if DM1.NormSyPrpf.AsInteger=1 then
     begin
      s_prpf:=1;
      checkBox1.Checked:=true;
     end
     else
     begin
      s_prpf:=0;
      checkBox1.Checked:=false;
     end;
     StopWait;
    end
    else
     showMessage('Нет такого кода! Воспользуйтесь справочником!');
   end;
 end;
end;

procedure TFSyrie.Edit2Click(Sender: TObject);
begin
 LABEL18.Caption:=' ';
 LABEL20.Caption:='';
 LABEL21.Caption:='';
 LABEL24.Caption:='';
 LABEL25.Caption:='';
 Edit2.Text:='';
 Edit3.Text:='';
 s_ksmz:=0;
end;

procedure TFSyrie.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
 begin
   if edit2.text<>''  then
   begin
    dM1.Matrop.Active:=false;
    dM1.Matrop.ParamByName('ksm').AsInteger:=strtoint(edit2.text);
    dM1.Matrop.Active:=TRUE;
    if not dm1.Matrop.eof then
    begin
     s_ksmz:=strtoint(edit2.text);
     Label20.Caption :=dm1.Matrop.FieldByName('Xarkt').AsString;
     Label21.Caption :=dm1.Matrop.FieldByName('Gost').AsString;
     Label24.Caption :=dm1.MatropNamspsr.AsString;
     Label25.Caption :=dm1.MatropNam.AsString;
     Label18.Caption:=dm1.Matrop.FieldByName('Nmat').AsString;
    end
    else
     showMessage('Нет такого кода! Воспользуйтесь справочником!');
   end;
 end;
end;

procedure TFSyrie.Edit3Click(Sender: TObject);
begin
 Edit3.Text:='';
end;

procedure TFSyrie.Edit4Click(Sender: TObject);
begin
 Edit4.Text:='';
 Edit5.Text:='';
 struk:=0;
end;

procedure TFSyrie.Edit4KeyDown(Sender: TObject; var Key: Word;
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
    end
    else
    begin
      Edit5.Text:=kod;
      struk:=SelectToVarIB('SELECT  struk.struk_id FROM  struk WHERE struk.kod_struk='+''+Edit4.Text+'',dm1.BELMED, dm1.BELMED.DefaultTransaction);
    end;
  end;
  sort:=' ';
  if edit1.Text<>'' then
  begin
     StartWait;
     dm1.openNormSyr(s_ksm, god, mes, struk, usl, sort);
     StopWait;
  end;
 end;
end;

procedure TFSyrie.Edit6Click(Sender: TObject);
begin
Edit6.Text:='';
Edit7.Text:='';
usl:=' 0=0';
end;

procedure TFSyrie.Edit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
 begin
   if edit6.text<>''  then
   begin
    if FRazdel=nil then FRazdel:=TFRazdel.Create(Application);
    FRazdel.razdel.Active:=true;
    if FRazdel.Razdel.Locate('kraz',strtoint(edit6.Text),[]) then
    begin
     s_raz:=FRazdel.RazdelRazdel_id.AsInteger;
     Edit7.Text:=FRazdel.RazdelNamraz.AsString;
     Edit6.Text:=inttostr(FRazdel.RazdelKraz.AsInteger);
     if usl<>'0=0' then
      usl:=usl+' or norm.kraz='+inttostr(FRazdel.RazdelKraz.AsInteger);
    end
    else
     showMessage('Нет такого кода! Воспользуйтесь справочником!');
   end
   else usl:=' 0=0';;
 end;
end;

procedure TFSyrie.Edit8Click(Sender: TObject);
begin
 edit8.Text:='';
 edit9.Text:='';
end;

procedure TFSyrie.Edit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
   if edit8.text<>''  then
   begin
    if Find_Ediz=nil then Find_Ediz:=TFind_Ediz.Create(Application);
    Find_ediz.Ediz.Active:=true;
    if Find_ediz.Ediz.Locate('kei_id',strtoint(edit8.Text),[]) then
    begin
     Edit8.Text:=inttostr(Find_ediz.EdizKei_id.asinteger);
     Edit9.Text:=Find_ediz.EdizNeis.AsString;
     s_keiz:=Find_ediz.EdizKei_id.asinteger;
    end
    else
     showMessage('Нет такого кода! Воспользуйтесь справочником!');
   end;
 end;
end;

procedure TFSyrie.FormCreate(Sender: TObject);
begin
 if s_ksm_spr<>0 then
 begin
  s_ksm:=s_ksm_spr;
  edit1.Text:=inttostr(s_ksm);
 end
 else
 begin
  s_ksm:=0;
  LABEL4.Caption:='';
  LABEL5.Caption:='';
  LABEL7.Caption:='';
  LABEL11.Caption:='';
  LABEL19.Caption:='';
  Edit1.Text:='';
 end;
 struk:=0;
 LABEL18.Caption:=' ';
 LABEL20.Caption:='';
 LABEL21.Caption:='';
 LABEL24.Caption:='';
 LABEL25.Caption:='';
 Edit2.Text:='';
 Edit3.Text:='';
 Edit4.Text:='';
 Edit5.Text:='';
 Edit6.Text:='';
 usl:='0=0';
 Pr_ins_del:=0;
end;

procedure TFSyrie.FormShow(Sender: TObject);
begin
 dm1.IBT_WRITE.Active:=FALSE;
 dm1.IBT_READ.Active:=FALSE;
 dm1.startRWTranss;
 if DM1.NormSy.Active then DM1.NormSy.Close;
 SpinEdit2.OnChange:=nil;
 SpinEdit2.Value:=god;
 SpinEdit2.OnChange:=SpinEdit2Change;
 ComboBox1.OnChange:=nil;
 ComboBox1.ItemIndex:=mes-1;
 ComboBox1.OnChange:=ComboBox1Change;
 IF MES<10 THEN S_MES:='0'+INTTOSTR(MES) ELSE S_MES:=INTTOSTR(MES);
 S_DAT1:='01.'+S_MES+'.'+copy(INTTOSTR(GOD),3,2);
 S_DAT2:=datetostr(IncMonth(strtodate(s_dat1),1)-1);
 if DM1.Norm.Active then s_ksm_spr:=DM1.NormKsm_id.asinteger;
 if (s_ksm_spr<>0) or (s_ksm<>0) then
 begin
  if s_ksm_SPR<>0 then s_ksm:=s_ksm_spr;
  edit1.Text:=inttostr(s_ksm);
  dM1.Matrop.Active:=false;
  dM1.Matrop.ParamByName('ksm').AsInteger:=s_ksm;
  dM1.Matrop.Active:=TRUE;
  if not dm1.Matrop.eof then
  begin
   s_nmats:=dm1.Matrop.FieldByName('Nmat').AsString;
   s_keis :=dm1.Matrop.FieldByName('Kei_id').AsInteger;
   s_Xarkts :=dm1.Matrop.FieldByName('Xarkt').AsString;
   s_Gosts :=dm1.Matrop.FieldByName('Gost').AsString;
   s_Namspsrs :=dm1.MatropNamspsr.AsString;
   s_nams :=dm1.MatropNam.AsString;
   s_namspsrs :=dm1.MatropNamspsr.AsString;
   s_namorgs :=dm1.MatropNam.AsString;
   Label4.Caption :=dm1.Matrop.FieldByName('Xarkt').AsString;
   Label5.Caption :=dm1.Matrop.FieldByName('Gost').AsString;
   Label7.Caption :=dm1.MatropNamspsr.AsString;
   Label11.Caption :=dm1.MatropNam.AsString;
   Label19.Caption:=dm1.Matrop.FieldByName('Nmat').AsString;
   if edit4.Text<>'' then Sort := ' ' else Sort := ' order by norm.struk_id,norm.kodp';
   if struk<>0 then
   begin
    edit4.Text:=SelectToVarIB('SELECT  struk.stkod FROM  struk WHERE struk.struk_id='+inttostr(struk),dm1.BELMED, dm1.BELMED.DefaultTransaction);
    edit5.Text:=s_stname;
   end;
   StartWait;
   dm1.openNormSyr(s_ksm, god, mes, struk, usl, sort);
   StopWait;
   if DM1.NormSyPrpf.AsInteger=1 then
   begin
    s_prpf:=1;
    checkBox1.Checked:=true;
   end
   else
   begin
    s_prpf:=0;
    checkBox1.Checked:=false;
   end;
  end;
 end;
end;

procedure TFSyrie.RadioGroup2Click(Sender: TObject);
begin
 dm1.NormSy.DisableControls;
 if RadioGroup2.ItemIndex=1 then
 begin
  dm1.NormSy.First;
  While not dm1.NormSy.Eof do
  begin
   dm1.NormSy.Edit;
   dm1.NormSy.FieldByName('Vib').AsInteger := 1;
   dm1.NormSy.Post;
   dm1.NormSy.Next;
  end;
 end
 else
 begin
  dm1.NormSy.First;
  While not dm1.NormSy.Eof do
  begin
   dm1.NormSy.Edit;
   dm1.NormSy.FieldByName('Vib').AsInteger := 0;
   dm1.NormSy.Post;
   dm1.NormSy.Next;
  end;
 end;
 dm1.NormSy.First;
 dm1.NormSy.EnableControls;
end;

procedure TFSyrie.SpeedButton1Click(Sender: TObject);
begin
 if FindMatrop=nil then FindMatrop:=TfindMatrop.Create(Application);
 FindMatrop.DataBaseName:=dm1.BELMED;
 FindMatrop.ReadOnly:=true;
 FindMatrop.ShowModal;
 if FindMatrop.ModalResult > 50 then
 begin
  s_ksmz:=FindMatrop.ModalResult-50;
  edit2.Text:=inttostr(FindMatrop.ModalResult-50);
  Label20.Caption :=FindMatrop.IBMatropXARKT.AsString;
  Label21.Caption :=FindMatrop.IBMatropGOST.AsString;
  Label24.Caption :=FindMatrop.IBMatropNamspsr.AsString;
  Label25.Caption :=FindMatrop.IBMatropNam.AsString;
  Label18.Caption :=FindMatrop.IBMatropNMAT.AsString;
 end;
end;

procedure TFSyrie.SpeedButton2Click(Sender: TObject);
begin
 if FindMatrop=nil then FindMatrop:=TfindMatrop.Create(Application);
 FindMatrop.DataBaseName:=dm1.BELMED;
 FindMatrop.ReadOnly:=true;
 FindMatrop.ShowModal;
 if FindMatrop.ModalResult > 50 then
 begin
  s_ksm:=FindMatrop.ModalResult-50;
  s_nmats:=FindMatrop.IBMatrop.FieldByName('Nmat').AsString;
  s_keis :=FindMatrop.IBMatrop.FieldByName('Kei_id').AsInteger;
  s_Xarkts :=FindMatrop.IBMatrop.FieldByName('Xarkt').AsString;
  s_Gosts :=FindMatrop.IBMatrop.FieldByName('Gost').AsString;
  s_Namspsrs :=FindMatrop.IBMatropNamspsr.AsString;
  s_nams :=FindMatrop.IBMatropNam.AsString;
  s_namspsrs :=FindMatrop.IBMatropNamspsr.AsString;
  s_namorgs :=FindMatrop.IBMatropNam.AsString;
  edit1.Text:=inttostr(FindMatrop.ModalResult-50);
  Label4.Caption :=FindMatrop.IBMatropXARKT.AsString;
  Label5.Caption :=FindMatrop.IBMatropGOST.AsString;
  Label7.Caption :=FindMatrop.IBMatropNamspsr.AsString;
  Label11.Caption :=FindMatrop.IBMatropNam.AsString;
  Label19.Caption :=FindMatrop.IBMatropNMAT.AsString;
  if edit4.Text<>'' then Sort := ' ' else Sort := ' order by norm.struk_id,norm.kodp';
  StartWait;
  dm1.openNormSyr(s_ksm, god, mes, struk, usl, sort);
  if DM1.NormSyPrpf.AsInteger=1 then
  begin
   s_prpf:=1;
   checkBox1.Checked:=true;
  end
  else
  begin
   s_prpf:=0;
   checkBox1.Checked:=false;
  end;
  StopWait;
 end;
end;

procedure TFSyrie.SpeedButton3Click(Sender: TObject);
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
  if edit1.Text<>'' then
  begin
   sort:=' ';
   StartWait;
   dm1.openNormSyr(s_ksm, god, mes, struk, usl, sort);
   StopWait;
  end;
 end;
end;

procedure TFSyrie.SpeedButton4Click(Sender: TObject);
begin
if FRazdel=nil then FRazdel:=TFRazdel.Create(Application);
    FRazdel.ShowModal;
    if FRazdel.ModalResult>50 then
    begin
     s_raz:=FRazdel.ModalResult-50;
     Edit7.Text:=FRazdel.RazdelNamraz.AsString;
     Edit6.Text:=inttostr(FRazdel.RazdelKraz.AsInteger);
    end;
end;

procedure TFSyrie.SpeedButton5Click(Sender: TObject);
begin
 if Find_Ediz=nil then Find_Ediz:=TFind_Ediz.Create(Application);
 Find_Ediz.ShowModal;
 if Find_Ediz.ModalResult>50 then
 begin
  Edit8.Text:=inttostr(Find_Ediz.EDIZKEI_ID.AsInteger);
  Edit9.Text:=Find_Ediz.EDIZNeis.AsString;
  s_keiz:=Find_ediz.EdizKei_id.asinteger;
 end;
end;

procedure TFSyrie.SpeedButton6Click(Sender: TObject);
begin
	if (FRazdel = nil) then
  	FRazdel := TFRazdel.Create(Application);
  FRazdel.ShowModal;
  if (FRazdel.ModalResult > 50) then
  begin
    raz := FRazdel.ModalResult - 50;
    Edit11.Text := FRazdel.RazdelNamraz.AsString;
    Edit10.Text := inttostr(FRazdel.RazdelKraz.AsInteger);
    usl := ' norm.kraz=' + inttostr(FRazdel.RazdelKraz.AsInteger);
  end
  else
  	usl := '0=0';
end;

procedure TFSyrie.SpinEdit2Change(Sender: TObject);
begin
 god:=SpinEdit2.Value;
 IF MES<10 THEN S_MES:='0'+INTTOSTR(MES) ELSE S_MES:=INTTOSTR(MES);
 S_DAT1:='01.'+S_MES+'.'+copy(INTTOSTR(GOD),3,2);
 S_DAT2:=datetostr(IncMonth(strtodate(s_dat1),1)-1);
end;

procedure TFSyrie.ToolButton1Click(Sender: TObject);
begin
 if (edit2.Text<>'')or (edit3.Text<>'') or (edit6.Text<>'')or
 (s_prpf<>dm1.normSyPrpf.asinteger) or (edit8.Text<>'') then
 begin
  if MessageDlg('Произвести замену данных?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin
   DM1.NormSy.DisableControls;
   try
    StartWait;
    Pr_ins_del:=0;
    dm1.NormSy.First;
    While not dm1.NormSy.Eof do
    begin
     if dm1.NormSyVib.AsInteger=1 then
     begin
      if edit2.Text<>'' then
      begin
       dm1.NormSy.Edit;
       dm1.NormSyKsm_id.AsInteger:=s_ksmz;
       dm1.NormSy.Post;
      end;
      if edit3.Text<>'' then
      begin
       dm1.NormSy.Edit;
       dm1.NormSyPlnorm.AsFloat:=strtofloat(replacestr(edit3.text,'.',','));
       dm1.NormSy.Post;
      end;
      if edit6.Text<>'' then
      begin
       dm1.NormSy.Edit;
       dm1.NormSyKraz.AsInteger:=strtoint(edit6.text);
       dm1.NormSyRazdel_id.AsInteger:=s_raz;
       dm1.NormSy.Post;
      end;
      if edit8.Text<>'' then
      begin
       dm1.NormSy.Edit;
       dm1.NormSyKei_id.AsInteger:=s_keiz;
       dm1.NormSyNeis.AsString:=edit9.Text;
       dm1.NormSy.Post;
      end;
      if CheckBox1.Checked=False then
      begin
       dm1.NormSy.Edit;
       dm1.NormSyPrpf.AsInteger:=0;
       dm1.NormSyNazprpf.AsString:='';
       dm1.NormSy.Post
      end
      else
      begin
       dm1.NormSy.Edit;
       dm1.NormSyPrpf.AsInteger:=1;
       dm1.NormSyNazprpf.AsString:='п/ф';
       dm1.NormSy.Post
      end;
     end;
     dm1.NormSy.Next;
    end;
   finally
    StopWait;
   end;
  end;
  dm1.NormSy.EnableControls;
 end;
end;

procedure TFSyrie.ToolButton2Click(Sender: TObject);
var
pr_del: boolean;
mm: integer;
gg: integer;
begin
if MessageDlg('Удалять сырье из помеченных препаратов? ',mtConfirmation, [mbYes,mbNo], 0) = mrYes then
begin
try
 if Spis_rashif.Active then Spis_Rashif.Close;
 Spis_rashif.EmptyTable;
 Spis_Rashif.Open;
 Pr_ins_del:=2;
 DM1.NormSy.First;
 while not DM1.NormSy.Eof do
 BEGIN
  pr_del:=false;
  if dm1.NormSyVib.AsInteger=1 then
  begin
   s_kodp:=DM1.NormSyKodp.AsInteger;
   if DM1.DOCUMENT.active then DM1.DOCUMENT.Close;
   DM1.DOcUMENT.MacroByName('USL').AsString:='WHERE DOcUMENT.STRUK_ID='+INTTOSTR(VsTRUK_ID)
   + ' AND (DOCUMENT.TIP_OP_ID=119)'
   + ' and document.klient_id='+inttostr(s_kodp)
   + ' AND Document.Date_op='+''''+s_dat1+'''';
   DM1.DOCUMENT.OPEN;
   dm1.openNorm(dm1.NormSyKodp.AsInteger, god, mes, 119);
   if not dm1.norm.Eof then
   begin
     if DM1.Norm.Locate('ksm_id;razdel_id',VarArrayOf([dm1.normSyKsm_id.AsInteger,dm1.normSyRazdel_id.AsInteger]),[]) then
     begin
      dm1.Norm.Delete;
      DM1.NormSy.Delete;
      pr_del:=true;
     end
   end
   else
   begin
    if not dm1.Document.Eof then vdocument_id:=dm1.documentDoc_id.AsInteger
    else
    begin
     vTip_Op_Id:=119;
     v_Tip_Dok:=102;
     vNDoc:='Нор'+inttostr(S_Kodp)+'-'+inttostr(mes)+'.'+inttostr(god);
     vDat_op:=strtodate(s_dat1);
     dm1.Document.Insert;
     dm1.Document.Post;
    end;
    if dm1.IBQuery1.Active then dm1.IBQuery1.Close;
    DM1.IBQuery1.SQL.Clear;
    DM1.IBQuery1.SQL.Add('SELECT normn.* FROM  normn');
    DM1.IBQuery1.SQL.Add(' where normn.kodp='+inttostr(s_kodp));
    DM1.IBQuery1.SQL.Add(' and normn.datanorm='+''''+datetostr(dm1.NormSyDatanorm.AsDateTime)+'''');
    DM1.IBQuery1.SQL.Add(' and normn.Tip_op_id=119');
    dm1.IBQuery1.Open;
    while not DM1.IBQuery1.Eof do
    begin
     if (dm1.IBQuery1.FieldByName('ksm_id').AsInteger=dm1.normSyKsm_id.AsInteger)and
     (dm1.IBQuery1.FieldByName('razdel_id').AsInteger=dm1.normSyRazdel_id.AsInteger) then
     begin
      DM1.NormSy.Delete;
      pr_del:=true
     end
     else
     begin
      mm:=month(dm1.IBQuery1.FieldByName('datanorm').AsDateTime);
      gg:=year(dm1.IBQuery1.FieldByName('datanorm').AsDateTime);
      if (mm<>mes)or(gg<>god) then
      begin
       dm1.Norm.Insert;
       dm1.Norm.FieldByName('doc_id').value:=vdocument_id;
       dm1.Norm.FieldByName('struk_id').value:=dm1.IBQuery1.FieldByName('struk_id').AsInteger;
       dm1.Norm.FieldByName('Kodp').value:=dm1.IBQuery1.FieldByName('kodp').AsInteger;
       dm1.Norm.FieldByName('KRaz').value:=dm1.IBQuery1.FieldByName('Kraz').Asinteger;
       dm1.Norm.FieldByName('KSM_ID').value:=dm1.IBQuery1.FieldByName('Ksm_id').Asinteger;
       dm1.Norm.FieldByName('Kei_id').value:=dm1.IBQuery1.FieldByName('Kei_id').Asinteger;
       dm1.Norm.FieldByName('Razdel_id').value:=dm1.IBQuery1.FieldByName('Razdel_id').AsInteger;
       dm1.Norm.FieldByName('Prpf').value:=dm1.IBQuery1.FieldByName('Prpf').AsInteger;
       dm1.Norm.FieldByName('Plnorm').value:=dm1.IBQuery1.FieldByName('Plnorm').AsFloat;
       dm1.Norm.FieldByName('Nazprpf').value:=dm1.IBQuery1.FieldByName('Nazprpf').AsString;
       dm1.Norm.FieldByName('Pr_Ov').value:=dm1.IBQuery1.FieldByName('Pr_Ov').AsInteger;
       dm1.Norm.FieldByName('Tip_Op_id').value:=119;
       dm1.Norm.FieldByName('Mes').value:=Mes;
       dm1.Norm.FieldByName('God').value:=God;
       dm1.Norm.FieldByName('datanorm').value:=s_dat1;
       DM1.Norm.Post
      end;
     end;
     dm1.IBQuery1.Next;
    end;
   end;
   DM1.ApplyUpdatesNorm;
   dm1.norm.First;
   if dm1.norm.Locate('nazprpf','п/ф',[]) then
   begin
//   Запись признака наличиея п/ф ( 1-есть п/ф)
    Spis_Rashif.Insert;
    Spis_RashifKodp.asinteger:=dm1.normKodp.AsInteger;
    Spis_RashifStruk_id.asinteger:=dm1.normStruk_id.AsInteger;
    Spis_Rashif.post;
   end;
  end;
  if not pr_del then dm1.NormSy.Next;
 end;
except
 On E: Exception do
 begin
  MessageDlg('Произошла ошибка при удалении записи!'+E.Message, mtWarning, [mbOK], 0);
  Abort;
 end;
end;
end;
end;

procedure TFSyrie.ToolButton3Click(Sender: TObject);
begin
	Splash := ShowSplashWindow(AniBmp1, 'Запись данных. Подождите, пожалуйста...', True, nil);
	try
 		if (Pr_ins_del <> 2) then
 		begin
  		if (Spis_rashif.Active) then
      	Spis_Rashif.Close;
  		Spis_rashif.EmptyTable;
  		Spis_Rashif.Open;
  		DM1.NormSy.DisableControls;
  		DM1.NormSy.First;
      while (not DM1.NormSy.Eof) do
      begin
   			if (dm1.NormSyVib.AsInteger = 1) then
   			begin
//   корректировка норм
          s_kodp := DM1.NormSyKodp.AsInteger;
          s_sprod := DM1.NormSySprod_id.AsInteger;
          s_norm_id := DM1.NormSyNorm_id.AsInteger;
          if (DM1.DOCUMENT.active) then
          	DM1.DOCUMENT.Close;
          DM1.DOcUMENT.MacroByName('USL').AsString := 'WHERE DOcUMENT.STRUK_ID='
          																						+ INTTOSTR(VsTRUK_ID)
                                                      + ' AND (DOCUMENT.TIP_OP_ID=119)'
                                                      + ' and document.klient_id='
                                                      + inttostr(s_kodp)
                                                      + ' AND Document.Date_op='
                                                      + '''' + s_dat1 + '''';
          DM1.DOCUMENT.OPEN;
          dm1.openNorm(dm1.NormSyKodp.AsInteger, god, mes, 119);
          if (dm1.norm.Eof) then
          begin
           	if (dm1.document.Eof) then
           	begin
              vTip_Op_Id := 119;
              v_Tip_Dok := 102;
              vNDoc := 'Нор' + inttostr(S_Kodp) + '-' + inttostr(mes) + '.' + inttostr(god);
              vDat_op := strtodate(s_dat1);
              dm1.Document.Insert;
              dm1.Document.Post
     				end
     				else
            	vDocument_id := dm1.documentDoc_id.AsInteger;
     				if (dm1.IBQuery1.Active) then
            	dm1.IBQuery1.Close;
           	DM1.IBQuery1.SQL.Clear;
           	DM1.IBQuery1.SQL.Add('SELECT normn.* FROM  normn');
           	DM1.IBQuery1.SQL.Add(' where normn.kodp=' + inttostr(s_kodp));
           	DM1.IBQuery1.SQL.Add(' and normn.datanorm=' + '''' + datetostr(dm1.NormSyDatanorm.AsDateTime) + '''');
           	DM1.IBQuery1.SQL.Add(' and normn.Tip_op_id=119');
           	dm1.IBQuery1.Open;
           	while (not DM1.IBQuery1.Eof) do
           	begin
      				if (pr_ins_del = 0)
              	 and (dm1.IBQuery1.FieldByName('norm_id').Asinteger = s_norm_id) then
//      (dm1.IBQuery1.FieldByName('ksm_id').Asinteger=s_ksm) and
//       (Edit6.text<>'')and (Edit10.text<>Edit6.text) then
              else
              begin
               	dm1.Norm.Insert;
               	dm1.Norm.FieldByName('Kodp').value := s_kodp;
               	dm1.Norm.FieldByName('Mes').value := Mes;
               	dm1.Norm.FieldByName('God').value := God;
               	dm1.Norm.FieldByName('Tip_op_id').value := 119;
               	dm1.Norm.FieldByName('datanorm').value := s_dat1;
               	dm1.Norm.FieldByName('Struk_ID').value := dm1.IBQuery1.FieldByName('Struk_id').Asinteger;
               	dm1.NormDoc_id.AsInteger := vDocument_id;
               	dm1.NormKsm_id.AsInteger := dm1.IBQuery1.FieldByName('Ksm_id').AsInteger;
               	dm1.NormKei_id.AsInteger := dm1.IBQuery1.FieldByName('Kei_id').AsInteger;
               	dm1.NormKraz.AsInteger := dm1.IBQuery1.FieldByName('Kraz').AsInteger;
               	dm1.NormRazdel_id.AsInteger := dm1.IBQuery1.FieldByName('Razdel_id').AsInteger;
               	dm1.NormPlnorm.AsFloat := dm1.IBQuery1.FieldByName('Plnorm').AsFloat;
               	dm1.NormPrpf.AsInteger := dm1.IBQuery1.FieldByName('Prpf').AsInteger;
               	dm1.NormNazprpf.AsString := dm1.IBQuery1.FieldByName('Nazprpf').AsString;
               	DM1.Norm.Post;
             	end;
      				DM1.IBQuery1.Next;
     				end;
    			end;
    			DM1.Norm.First;
//    if (DM1.Norm.Locate('razdel_id;ksm_id',VarArrayOf([dm1.normSyRazdel_id.AsInteger,dm1.normSyKsm_id.AsInteger]),[])) then
    			if (DM1.Norm.Locate('norm_id', VarArrayOf([dm1.normSyNorm_id.AsInteger]), [])) then
    			begin
           	dm1.Norm.Edit;
           	dm1.NormKsm_id.AsInteger := dm1.NormSyKsm_id.AsInteger;
           	dm1.NormKei_id.AsInteger := dm1.NormSyKei_id.AsInteger;
           	dm1.NormKraz.AsInteger := dm1.NormSyKraz.AsInteger;
           	dm1.NormRazdel_id.AsInteger := dm1.NormSyRazdel_id.AsInteger;
           	dm1.NormPlnorm.AsFloat := dm1.NormSyPlnorm.AsFloat;
           	dm1.NormPrpf.AsInteger := dm1.NormSyPrpf.AsInteger;
           	dm1.NormNazprpf.AsString := dm1.NormSyNazprpf.AsString;
           	DM1.Norm.Post
    			end
    			else
    			begin
           	dm1.Norm.Insert;
           	dm1.Norm.FieldByName('Doc_id').value := DM1.DOCUMENTDoc_id.AsInteger;
           	dm1.Norm.FieldByName('Kodp').value := dm1.NormSyKodp.AsInteger;
           	dm1.Norm.FieldByName('Sprod_id').value := dm1.NormSySprod_id.AsInteger;
           	dm1.Norm.FieldByName('Struk_ID').value := dm1.NormSy.FieldByName('Struk_id').Asinteger;
           	dm1.Norm.FieldByName('Mes').value := Mes;
           	dm1.Norm.FieldByName('God').value := God;
           	dm1.Norm.FieldByName('Tip_op_id').value := 119;
           	dm1.Norm.FieldByName('datanorm').value := s_dat1;
           	dm1.NormKsm_id.AsInteger := dm1.NormSyKsm_id.AsInteger;
           	dm1.NormKei_id.AsInteger := dm1.NormSyKei_id.AsInteger;
           	dm1.NormKraz.AsInteger := dm1.NormSyKraz.AsInteger;
           	dm1.NormRazdel_id.AsInteger := dm1.NormSyRazdel_id.AsInteger;
           	dm1.NormPlnorm.AsFloat := dm1.NormSyPlnorm.AsFloat;
           	dm1.NormPrpf.AsInteger := dm1.NormSyPrpf.AsInteger;
           	dm1.NormNazprpf.AsString := dm1.NormSyNazprpf.AsString;
           	DM1.Norm.Post
    			end;
          DM1.ApplyUpdatesNorm;
          dm1.norm.First;
          if (dm1.norm.Locate('nazprpf', 'п/ф', [])) then
          begin
//   Запись признака наличиея п/ф ( 1-есть п/ф)
           	Spis_Rashif.Insert;
           	Spis_RashifKodp.asinteger := dm1.normKodp.AsInteger;
           	Spis_RashifStruk_id.asinteger := dm1.normStruk_id.AsInteger;
           	Spis_Rashif.post;
    			end;
   			end;
   			DM1.NormSy.Next;
  		end;
  		DM1.NormSy.EnableControls;
 		end;
//       Расчет и запись расшифровки, если есть п/ф
 		if (dm1.IBT_Read.Active) then
    	dm1.IBT_Read.Active := false;
 		if (dm1.IBT_WRITE.Active) then
    	dm1.IBT_WRITE.Active := false;
 		dm1.startRWTranss;
 		s_dat_rashif := s_dat1;
  	if (STRTODATe(s_dat_rashif) < strtodate('01.11.09')) then
    	Pr_ARX := 1
  	else
    	Pr_Arx := 0;
 		Spis_Rashif.First;
   	while (not Spis_Rashif.Eof) do
   	begin
      s_kodp := Spis_RashifKodp.AsInteger;
      struk := Spis_RashifStruk_id.AsInteger;
      dm1.RaschRashif;
      Spis_Rashif.Next;
   	end;
// восстановление NormSyr
   	if (s_ksmz <> 0) then
   	begin
      s_ksm := s_ksmz;
      edit1.Text := edit2.Text;
      edit10.Text := edit6.Text;
      edit11.Text := edit7.Text;
      label19.Caption := label18.Caption;
      label5.Caption := label21.Caption;
      label7.Caption := label24.Caption;
      label4.Caption := label25.Caption;
      dm1.Matrop.Close;
      dm1.Matrop.ParamByName('ksm').AsInteger := s_ksm;
      dm1.Matrop.Open;
      if (not dm1.Matrop.eof) then
      begin
       s_nmats := dm1.Matrop.FieldByName('Nmat').AsString;
       s_keis := dm1.Matrop.FieldByName('Kei_id').AsInteger;
       s_Xarkts := dm1.Matrop.FieldByName('Xarkt').AsString;
       s_Gosts := dm1.Matrop.FieldByName('Gost').AsString;
       s_Namspsrs := dm1.MatropNamspsr.AsString;
       s_nams := dm1.MatropNam.AsString;
       s_namspsrs := dm1.MatropNamspsr.AsString;
       s_namorgs := dm1.MatropNam.AsString;
      end;
   	end;
    dm1.openNormSyr(s_ksm, god, mes, struk, usl, sort);
   	if (DM1.NormSyPrpf.AsInteger = 1) then
   	begin
      s_prpf := 1;
      checkBox1.Checked := true;
   	end
   	else
   	begin
      s_prpf := 0;
      checkBox1.Checked := false;
   	end;
 		Splash.Free;
	except
 		On E : Exception do
 		begin
  		MessageDlg('Произошла ошибка при записи данных!' + E.Message, mtWarning, [mbOK], 0);
      DM1.IBT_WRITE.RollbackRetaining;
      Splash.Free;
 		end;
	end;
	Pr_ins_del := 0;
end;

procedure TFSyrie.ToolButton4Click(Sender: TObject);
begin
  if (dm1.NormSy.State = dsEdit) or (dm1.NormSy.State = dsInsert) or (dm1.NormSy.Modified) then
    dm1.NormSy.Post;
  DM1.NormSy.DisableControls;
  DM1.normSy.First;
  if (planCB.Checked) then
    dm1.frxReport1.LoadFromFile(reportPath + 'p_syr_dop.fr3')
  else
    dm1.frxReport1.LoadFromFile(reportPath + 'p_syr.fr3');
  dm1.frxReport1.Script.Variables['nams'] := s_nmats;
  dm1.frxReport1.Script.Variables['vgod'] := s_god;
  dm1.frxReport1.Script.Variables['xarkts'] := s_xarkts;
  dm1.frxReport1.Script.Variables['namsyrs'] := s_namspsrs;
  dm1.frxReport1.Script.Variables['namorgs'] := s_namorgs;
  dm1.frxReport1.Script.Variables['nammes'] := nammes;
  dm1.frxReport1.Script.Variables['gosts'] := s_gosts;


  dm1.frxReport1.ShowReport;
//  DM1.FrReport1.LoadFromFile(reportPath + 'P_syr.frf');
//  DM1.FrReport1.ShowReport;
  while (DM1.NormSy.ControlsDisabled) do
   	DM1.NormSy.EnableControls;
end;

procedure TFSyrie.ToolButton5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
	s_kodp_spr := DM1.NormSyKodp.AsInteger;
end;

procedure TFSyrie.ToolButton6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
	s_ksm_spr := DM1.NormSyKsm_id.AsInteger;
end;

procedure TFSyrie.ToolButton7Click(Sender: TObject);
var
  s_kod_prod : string;
  s_nam_prod : string;
  s_reg_prod : string;
  s_nam_struk : string;
begin
  if (s_ksmz = 0) then
  begin
    MessageDlg('Введите код сырья в окне "Сырье или п/ф для добавления или замены:"!', mtWarning, [mbOK], 0);
    Abort;
 	end;
 	if (s_raz = 0) then
 	begin
    MessageDlg('Введите раздел в окне "Сырье или п/ф для добавления или замены:"!', mtWarning, [mbOK], 0);
    Abort;
 	end;
 	if (s_keiz = 0) then
 	begin
    MessageDlg('Введите единицу измерения в окне "Сырье или п/ф для добавления или замены:"!', mtWarning, [mbOK], 0);
    Abort;
 	end;
{ if not DM1.NormSy.Active then
 begin
//  sort:=' ';
  StartWait;
  dm1.openNormSyr(s_ksmz, god, mes, struk, usl, sort);
  StopWait;
 end; }

{ if DM1.NormSy.Active then
 begin
  if DM1.NormSy.Eof then s_datanorm:=strtodate(s_dat1) else s_datanorm:= DM1.NormSyDatanorm.AsDateTime;
  DM1.NormSy.Insert;
  DM1.NormSyDatanorm.AsDateTime:=s_datanorm;
  DM1.NormSy.Post;
  DM1.NormSy.Edit;
  Pr_ins_del:=1;
 end;}

 	if (MessageDlg('Произвести вставку данных?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
 	begin
  	Pr_ins_del := 1;
  	DM1.NormSy.DisableControls;
  	try
   		StartWait;
//   Pr_ins_del:=0;
   		dm1.NormSy.First;
   		While (not dm1.NormSy.Eof) do
   		begin
    		if (dm1.NormSyVib.AsInteger = 1) then
    		begin
         	s_kodp := dm1.NormSyKodp.AsInteger;
         	struk := dm1.NormSyStruk_id.AsInteger;
         	s_sprod := dm1.NormSySprod_id.AsInteger;
         	s_kod_prod := dm1.NormSyKod_prod.asstring;
         	s_nam_prod := dm1.NormSyNmat.asstring;
         	s_reg_prod := dm1.NormSyNam.asstring;
         	s_nam_struk := dm1.NormSyStname.asstring;
         	DM1.NormSy.Edit;
         	DM1.NormSyVib.AsInteger := 0;
         	dm1.NormSy.Post;
         	dm1.NormSy.Insert;
         	dm1.NormSyKodp.AsInteger := s_kodp;
         	dm1.NormSySprod_id.AsInteger := s_sprod;
         	DM1.NormSy.FieldByName('KSM_ID').AsInteger := S_Ksmz;
         	DM1.NormSy.FieldByName('stname').AsString := s_nam_struk;
         	DM1.NormSy.FieldByName('kod_prod').AsString := s_kod_prod;
         	DM1.NormSy.FieldByName('Nam').AsString := s_reg_prod;
         	DM1.NormSy.FieldByName('Nmat').AsString := s_nam_prod;
         	DM1.NormSy.FieldByName('GOD').AsInteger := god;
         	DM1.NormSy.FieldByName('MES').AsInteger := mes;
         	DM1.NormSy.FieldByName('STRUK_id').AsInteger := Struk;
         	dm1.NormSyPlnorm.AsFloat := strtofloat(replacestr(edit3.text, '.', ','));
         	dm1.NormSyKraz.AsInteger := strtoint(edit6.text);
         	dm1.NormSyRazdel_id.AsInteger := s_raz;
         	DM1.NormSyDatanorm.AsDateTime := s_datanorm;
         	DM1.NormSyVib1.AsInteger := 2;
//         	DM1.NormSyVib.AsInteger := 1;
         	dm1.NormSyKei_id.AsInteger := s_keiz;
         	dm1.NormSyNeis.AsString := edit9.Text;
         	if (CheckBox1.Checked = False) then
         	begin
            dm1.NormSyPrpf.AsInteger := 0;
            dm1.NormSyNazprpf.AsString := '';
         	end
         	else
         	begin
            dm1.NormSyPrpf.AsInteger := 1;
            dm1.NormSyNazprpf.AsString := 'п/ф';
         	end;
         	dm1.NormSy.Post;
         	dm1.NormSy.First;
      	end;
      	dm1.NormSy.Next;
     	end;
      dm1.NormSy.Filtered := false;
   		dm1.NormSy.First;
      While (not dm1.NormSy.Eof) do
      begin
        if (DM1.NormSy.FieldByName('vib1').AsInteger = 2) then
        begin
          DM1.NormSy.Edit;
          DM1.NormSyVib.AsInteger := 1;
          DM1.NormSyVib1.AsInteger := 0;
          dm1.NormSy.Post;
      	end;
      	dm1.NormSy.Next;
    	end;
  	finally
   		StopWait;
  	end;
		dm1.NormSy.EnableControls;
 	end;
end;


end.
