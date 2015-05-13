unit GlMenu_Ogt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, RxGIF, ImgList, ComCtrls, ToolWin, jpeg, StdCtrls,
  DateUtils, RXCtrls, DBCtrls, Grids, DBGridEh, DBGrids, RxMemDS, DBTables,
  IBCustomDataSet, IBQuery, rxSplshWnd, Buttons, UtilRIB, rxFileUtil, IniFiles,
  ActnList, BDEConfig, System.Actions;
type
  TFGlmenu_ogt = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    Main_Panel: TPanel;
    N20: TMenuItem;
    Image1: TImage;
    ToolBar1: TToolBar;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    ActionList1: TActionList;
    SprPrep: TAction;
    SprMat: TAction;
    ImageList1: TImageList;
    N21: TMenuItem;
    SprStr: TAction;
    N11: TMenuItem;
    N22: TMenuItem;
    Label5: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure ChildFormHide(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure SprPrepExecute(Sender: TObject);
    procedure SprMatExecute(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure SprStrExecute(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGlmenu_ogt: TFGlmenu_ogt;
  ActiveForm: TForm;
implementation
  uses dm, Splach_norm, PerNorm, Norm, PerNovMes, Syrie, Find_Spprod, Find_Matrop, Find_Struk,
  Decode_Spprod, Decode_Matrop, ediz, razdel, Rashif, SyriePeriod, Podpis,
  ViborGrPrep, Razdel_vvod, Ediz_vvod, Koefpr_vvod, BasSyr_vvod, OtxSpirt_vvod;
{$R *.dfm}

procedure TFGlmenu_ogt.SprPrepExecute(Sender: TObject);
begin
if (DecodeSpprod = nil) then
  begin
    Application.CreateForm(TDecodeSpprod, DecodeSpprod);
  end;
  DecodeSpprod.l_id:=s_kodp_spr;
  DecodeSpprod.DEC.Database:=dm1.BELMED;
  DecodeSpprod.ShowModal;
end;

procedure TFGlmenu_ogt.SprStrExecute(Sender: TObject);
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
   if FViborGrPrep<>nil then
   begin
    FViborGrPrep.label7.Caption:=FindStruk.name;
    FViborGrPrep.RadioGroup3.ItemIndex:=0;
   end;
 end;
end;

procedure TFGlmenu_ogt.SprMatExecute(Sender: TObject);
begin
if (DecodeMatrop = nil) then
begin
  Application.CreateForm(TDecodeMatrop, DecodeMatrop);
end;
 FindMatrop.DataBaseName:=dm1.BELMED;
 FindMatrop.k_id:=s_ksm_spr;
 DecodeMatrop.ShowModal;
end;

procedure TFGlmenu_ogt.ChildFormHide(Sender: TObject);
begin
  if ActiveForm<>nil then
    if ActiveForm=TForm(Sender) then
    begin
      ActiveForm:=Nil;
    end;
end;

procedure TFGlmenu_ogt.FormActivate(Sender: TObject);
begin
  if (ActiveForm <> nil) then
    if (ActiveForm.Visible) and (ActiveForm.Enabled) then
      ActiveForm.SetFocus;
end;

procedure TFGlmenu_ogt.FormCreate(Sender: TObject);
begin
  Label2.Caption := '';
  Label5.Caption := '';
end;

procedure TFGlmenu_ogt.FormResize(Sender: TObject);
begin
   if (ActiveForm <> nil) then
  begin
    ActiveForm.Width  := Main_Panel.Width;
    ActiveForm.Height := Main_Panel.Height;
  end;
end;

procedure TFGlmenu_ogt.FormShow(Sender: TObject);
begin
  if (FSplash_Norm <> nil) then
    FreeAndNil(FSPlash_Norm);
  Label1.Caption := '';
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    DM1.ConfigUMC.MacroByName('USL').AsString := 'STRUK_ID = -32';
    DM1.ConfigUMC.Open;
    if (MonthOf(Date()) = DM1.ConfigUMCMES.AsInteger) and (YearOf(Date()) = DM1.ConfigUMCGOD.AsInteger) then
    begin
      MODE := 0;
    end
    else
      if ((MonthOf(Date()) = DM1.ConfigUMCMES.AsInteger - 1) and (YearOf(Date()) = DM1.ConfigUMCGOD.AsInteger))
         or ((YearOf(Date()) = DM1.ConfigUMCGOD.AsInteger - 1) and (MonthOf(Date()) = 12) and (DM1.ConfigUMCMES.AsInteger = 1))then
      begin
//     Label5.Caption:='(Прошлый месяц)';
        MODE := 1;
      end
      else
      begin
//      Label5.Caption:='(Только просмотр)';
        MODE := 2;
      end;
    Label2.Caption := FormatDateTime('mmmm', EncodeDate(DM1.ConfigUMCGOD.AsInteger, DM1.ConfigUMCMES.AsInteger, 1));
    MES := DM1.ConfigUMCMES.AsInteger;
    GOD := DM1.ConfigUMCGOD.AsInteger;
//   IF MES<10 THEN S_MES:='0'+INTTOSTR(MES) ELSE S_MES:=INTTOSTR(MES);
//   S_DAT1:='01.'+S_MES+'.'+INTTOSTR(GOD);
//   S_DAT2:=datetostr(IncMonth(strtodate(s_dat1),1)-1);
    Label5.Caption := FormatDateTime('yyyy', EncodeDate(DM1.ConfigUMCGOD.AsInteger, DM1.ConfigUMCMES.AsInteger, 1)) + 'г.';
    vSTRUK_ID := DM1.ConfigUMCSTRUK_ID.AsInteger;
    DM1.ConfigUMC.Close;
  finally
    Screen.Cursor := OldCursor;
  end;

  N1.Visible := not dm1.kurs;
  N3.Visible := not dm1.kurs;
  N4.Visible := not dm1.kurs;
  N5.Visible := not dm1.kurs;
end;

procedure TFGlmenu_ogt.N10Click(Sender: TObject);
begin
 if FRashif=nil then FRashif:=TfRashif.Create(Application);
 FRashif.Parent := Main_Panel;
 if ActiveForm<>nil then
  ActiveForm.Close;
 ActiveForm:=FRashif;
 FNorm.OnHide:=ChildFormHide;
 Label1.Caption:='Расшифровки';
 FRashif.Show;
end;

procedure TFGlmenu_ogt.N11Click(Sender: TObject);
begin
  if FindSpprod = nil then
    FindSpprod := TfindSpprod.Create(Application);
  FindSpprod.Parent := Main_Panel;
  if (ActiveForm <> nil) then
    ActiveForm.Close;
  ActiveForm := FindSpprod;
  FindSpprod.OnHide := ChildFormHide;
  Label1.Caption := 'Справочник готовой продукции';
  FindSpprod.DataBaseName := dm1.BELMED;
  FindSpprod.ReadOnly := true;
//  FindSpprod.WindowState := wsMaximized;
  FindSpprod.Show;
end;

procedure TFGlmenu_ogt.N12Click(Sender: TObject);
begin
  if (FViborGrPrep = nil) then
  	FViborGrPrep := TfViborGrPrep.Create(Application);
 	FViborGrPrep.Parent := Main_Panel;
 	if (ActiveForm <> nil) then
  	ActiveForm.Close;
 	ActiveForm := FViborGrPrep;
 	FViborGrPrep.OnHide := ChildFormHide;
 	Label1.Caption := 'Печать документа "Расшифровки.." по заданному списку ';
 	S_VID_DOK := 'Расшифровки';
 	if (dm1.P_Rashif.Active) then
  	dm1.P_Rashif.Close;
 	FViborGrPrep.Show;
end;

procedure TFGlmenu_ogt.N13Click(Sender: TObject);
begin
  if (FBasSyr_vvod = nil) then
    FBasSyr_vvod := TfBasSyr_vvod.Create(Application);
  FBasSyr_vvod.Parent := Main_Panel;
  if (ActiveForm <> nil) then
    ActiveForm.Close;
  ActiveForm := FBasSyr_vvod;
  FBasSyr_vvod.OnHide := ChildFormHide;
  Label1.Caption := 'Справочник базового сырья';
  FBasSyr_vvod.Show;
end;

procedure TFGlmenu_ogt.N14Click(Sender: TObject);
begin
 if FEdiz_vvod=nil then FEdiz_vvod:=TfEdiz_vvod.Create(Application);
 if ActiveForm<>nil then
  ActiveForm.Close;
 FEdiz_vvod.Show;
end;

procedure TFGlmenu_ogt.N15Click(Sender: TObject);
begin
 if FKoefpr_vvod=nil then FKoefpr_vvod:=TfKoefpr_vvod.Create(Application);
 if ActiveForm<>nil then
  ActiveForm.Close;
 FKoefpr_vvod.Show;
end;

procedure TFGlmenu_ogt.N16Click(Sender: TObject);
begin
 if FRazdel_vvod=nil then FRazdel_vvod:=TfRazdel_vvod.Create(Application);
 if ActiveForm<>nil then
  ActiveForm.Close;
 FRazdel_vvod.Show;
end;

procedure TFGlmenu_ogt.N17Click(Sender: TObject);
begin
 if FPodpis=nil then FPodpis:=TfPodpis.Create(Application);
 if ActiveForm<>nil then
  ActiveForm.Close;
 FPodpis.Show;
end;

procedure TFGlmenu_ogt.N18Click(Sender: TObject);
begin
 if FOtxSpirt_vvod=nil then FOtxSpirt_vvod:=TfOtxSpirt_vvod.Create(Application);
 FOtxSpirt_vvod.Parent := Main_Panel;
 if ActiveForm<>nil then
  ActiveForm.Close;
 ActiveForm:=FOtxSpirt_vvod;
 FOtxSpirt_vvod.OnHide:=ChildFormHide;
 Label1.Caption:='Справочник отходов';
 FOtxSpirt_vvod.Show;

end;

procedure TFGlmenu_ogt.N19Click(Sender: TObject);
begin
if FPerNovMes=nil then FPerNovMes:=TfPerNovMes.Create(Application);
 if ActiveForm<>nil then
  ActiveForm.Close;
  ActiveForm:=FPerNovMes;
  Label1.Caption:='Переход на новый месяц';
 FPerNovMes.ShowModal;
 Label1.Caption:='';
end;

procedure TFGlmenu_ogt.N20Click(Sender: TObject);
begin
if FPerNorm=nil then FPerNorm:=TfPerNorm.Create(Application);
   if ActiveForm<>nil then
   ActiveForm.Close;
   ActiveForm:=FPerNorm;
   Label1.Caption:='Передача данных';
   FPerNorm.ShowModal;
   Label1.Caption:='';
end;

procedure TFGlmenu_ogt.N21Click(Sender: TObject);
begin
 if FSyrie_Period=nil then FSyrie_Period:=TfSyrie_Period.Create(Application);
 FSyrie_Period.Parent := Main_Panel;
 if ActiveForm<>nil then
  ActiveForm.Close;
 ActiveForm:=FSyrie_Period;
 FSyrie_Period.OnHide:=ChildFormHide;
 Label1.Caption:='Динамика изменения норм расхода';
 FSyrie_Period.Show;
end;

procedure TFGlmenu_ogt.N22Click(Sender: TObject);
begin
  if FindMatrop = nil then
    FindMatrop := TFindMatrop.Create(Application);
  FindMatrop.Parent := Main_Panel;
  if (ActiveForm <> nil) then
    ActiveForm.Close;
  ActiveForm := FindMatrop;
  FindMatrop.OnHide := ChildFormHide;
  Label1.Caption := 'Справочник сырья и материалов';
  FindMatrop.DataBaseName := dm1.BELMED;
  FindMatrop.ReadOnly := true;
//  FindMatrop.WindowState := wsMaximized;
  FindMatrop.Show;
end;

procedure TFGlmenu_ogt.N6Click(Sender: TObject);
begin
close;
end;

procedure TFGlmenu_ogt.N7Click(Sender: TObject);
begin
if FNorm=nil then FNorm:=TfNorm.Create(Application);
 FNorm.Parent := Main_Panel;
 if ActiveForm<>nil then
  ActiveForm.Close;
 ActiveForm:=FNorm;
 FNorm.OnHide:=ChildFormHide;
 Label1.Caption:='Нормы';
 FNorm.Show;

end;

procedure TFGlmenu_ogt.N8Click(Sender: TObject);
begin
 if FSyrie=nil then FSyrie:=TfSyrie.Create(Application);
 FSyrie.Parent := Main_Panel;
 if ActiveForm<>nil then
  ActiveForm.Close;
 ActiveForm:=FSyrie;
 FSyrie.OnHide:=ChildFormHide;
 Label1.Caption:='Просмотр/корректировка сырья ';
 FSyrie.Show;

end;

procedure TFGlmenu_ogt.N9Click(Sender: TObject);
begin
 if FViborGrPrep=nil then FViborGrPrep:=TfViborGrPrep.Create(Application);
 FViborGrPrep.Parent := Main_Panel;
 if ActiveForm<>nil then
  ActiveForm.Close;
 ActiveForm:=FViborGrPrep;
 FViborGrPrep.OnHide:=ChildFormHide;
 S_VID_DOK:='Плановые нормы';
 Label1.Caption:='Печать документа "Плановые нормы.." по заданному списку ';
 if dm1.P_Rashif.Active then dm1.P_Rashif.Close;
 FViborGrPrep.Show;
end;

end.
