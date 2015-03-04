unit PerNovMes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,IB,SplshWnd;

type
  TFPerNovMes = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPerNovMes: TFPerNovMes;

implementation
  uses glmenu_ogt,dm,perNorm;
{$R *.dfm}

procedure TFPerNovMes.Button2Click(Sender: TObject);
begin
close;
end;

procedure TFPerNovMes.FormShow(Sender: TObject);
begin
Label3.Caption:=FGlMenu_ogt.Label2.Caption;
button1.Visible:=true;
button2.Caption:='Нет';
Label1.Caption:='Месяц обработки:';
Label2.Caption:='Вы действительно хотите перейти на новый месяц?';
end;

procedure TFPerNovMes.Button1Click(Sender: TObject);
//var
//NumMax: integer;
begin
 if dm1.ConfigUMC.Active then dm1.ConfigUMC.Active:=false;
 DM1.ConfigUMC.MacroByName('USL').AsString:='ConfigUMC.Struk_id = '+IntToStr(vstruk_id);
 DM1.ConfigUMC.Open;
 dm1.New_Mes.ParamByName('Struk_Id').AsInteger:=vStruk_id;
 OldCursor:=Screen.Cursor;
 Screen.Cursor:=crHourGlass;
 try
  dm1.startWriteTrans;
  try
   dm1.New_Mes.ExecProc;
   dm1.IBT_WRITE.Commit;
  except
   on E:EIBInterbaseError do
   begin
    ShowMessage(E.Message);
    dm1.IBT_WRITE.rollback;
   end;
  end;
  DM1.ConfigUMC.Close;
  if dm1.IBT_READ.Active then dm1.IBT_READ.Active:=false;
  dm1.startReadTrans;
  if dm1.ConfigUMC.Active then dm1.ConfigUMC.Active:=false;
  DM1.ConfigUMC.MacroByName('USL').AsString:='ConfigUMC.Struk_id = '+IntToStr(vstruk_id);
  DM1.ConfigUMC.Open;
  MES:=DM1.ConfigUMCMES.AsInteger;
  GOD:=DM1.ConfigUMCGOD.AsInteger;
// дозапись в таблицу NORM
{  if MessageDlg('Перенести нормы в старую базу?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin
   FperNorm.Norm_ST.Active :=true;
   if not FperNorm.Norm_st.Eof then
   begin
    FperNorm.Norm_st.First;
    while not FperNorm.Norm_ST.Eof do FperNorm.Norm_st.Delete;
   end;
   if dm1.IBQuery1.Active then dm1.IBQuery1.Close;
   DM1.IBQuery1.SQL.Clear;
   DM1.IBQuery1.SQL.Add('select min(norm_id) norm_id from norm');
   DM1.IBQuery1.SQL.Add(' where norm.mes='+inttostr(mes));
   DM1.IBQuery1.SQL.Add(' and norm.god='+inttostr(god));
   dm1.IBQuery1.Open;
   if dm1.IBQuery1.FieldByName('norm_id').AsVariant=null then
   begin
    DM1.IBQuery1.SQL.Clear;
    DM1.IBQuery1.SQL.Add('select max(norm_id) norm_id from norm');
    dm1.IBQuery1.Open;
    if not dm1.IBQuery1.FieldByName('norm_id').AsVariant=null then NumMax:=dm1.IBQuery1.FieldByName('norm_id').AsInteger
    else NumMax:=0;
   end
   else NumMax:=dm1.IBQuery1.FieldByName('norm_id').AsInteger;
   FperNorm.Normn_ASY.Active :=false;
   FperNorm.Normn_ASY.ParamByName('mes').AsInteger:=mes;
   FperNorm.Normn_ASY.ParamByName('god').AsInteger:=god;
   FperNorm.Normn_ASY.Active :=true;
   FperNorm.Normn_ASY.First;
   if not FperNorm.Normn_ASY.Eof then
   begin
    Splash := ShowSplashWindow(AniBmp1,
    'Переносятся данные. Подождите, пожалуйста...', True, nil);
    While not FperNorm.Normn_ASY.Eof do
    begin
     NumMax:=NumMax+1;
     FperNorm.Norm_st.Append;
     FperNorm.Norm_st.FieldByName('Kodp').AsVariant:=FperNorm.Normn_ASY.FieldByName('Kodp').AsVariant;
     FperNorm.Norm_st.FieldByName('ksm_id').AsVariant:=FperNorm.Normn_ASY.FieldByName('ksm_id').AsVariant;
     FperNorm.Norm_st.FieldByName('struk_id').AsVariant:=FperNorm.Normn_ASY.FieldByName('struk_id').AsVariant;
     FperNorm.Norm_st.FieldByName('kei_id').AsVariant:=FperNorm.Normn_ASY.FieldByName('kei_id').AsVariant;
     FperNorm.Norm_st.FieldByName('plnorm').AsVariant:=FperNorm.Normn_ASY.FieldByName('plnorm').AsVariant;
     FperNorm.norm_st.FieldByName('kraz').AsVariant:=FperNorm.normn_ASY.FieldByName('kraz').AsVariant;
     FperNorm.Norm_st.FieldByName('mes').AsVariant:=mes;
     FperNorm.norm_st.FieldByName('god').AsInteger:=god;
     FperNorm.Norm_st.FieldByName('norm_id').AsInteger:=NumMax;
     FperNorm.Norm_ST.FieldByName('Datav').AsDateTime:=date;
     FperNorm.Norm_ST.FieldByName('Timev').AsString:=TimeToStr(time);
     If FperNorm.NORMn_ASY.FieldByName('pr_ov').AsInteger=1 then FperNorm.NORM_ST.FieldByName('pr_ov').AsBoolean:=true
     else FperNorm.NORM_ST.FieldByName('pr_ov').AsBoolean:=false;
     If FperNorm.NORMn_ASY.FieldByName('prpf').AsInteger=1 then FperNorm.NORM_ST.FieldByName('prpf').AsBoolean:=true
     else FperNorm.NORM_ST.FieldByName('prpf').AsBoolean:=false;
     FperNorm.NORM_ST.FieldByName('nazprpf').AsVariant:=FperNorm.NORMn_ASY.FieldByName('nazprpf').AsVariant;
     FperNorm.Norm_st.Post;
     FperNorm.Normn_ASY.Next;
    end;
    Splash.Free;
   end;
  end;}
  FGlMenu_ogt.Label2.Caption:=FormatDateTime('mmmm',EncodeDate(DM1.ConfigUMCGOD.AsInteger,DM1.ConfigUMCMES.AsInteger,1));
  IF MES<10 THEN S_MES:='0'+INTTOSTR(MES) ELSE S_MES:=INTTOSTR(MES);
  S_DAT1:='01.'+S_MES+'.'+INTTOSTR(GOD);
  S_DAT2:=datetostr(IncMonth(strtodate(s_dat1),1)-1);
  FGlMenu_ogt.Label5.Caption:=FormatDateTime('yyyy',EncodeDate(DM1.ConfigUMCGOD.AsInteger,DM1.ConfigUMCMES.AsInteger,1))+'г.';
  label2.Caption:='Вы перешли на новый месяц !';
  Label3.Caption:=FGlMenu_ogt.Label2.Caption;
  button1.Visible:=false;
  button2.Caption:='Выход';
 finally
  Screen.Cursor:=OldCursor;
 end;
end;

end.
