unit Splach_norm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, RXCtrls, jpeg;

type
  TFSplash_norm = class(TForm)
    Image1: TImage;
    ProgressBar1: TProgressBar;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    procedure SetBar(Max: integer; Step: integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSplash_norm: TFSplash_norm;

implementation

{$R *.dfm}

{ TFSplash_Norm }



{ TFSplash_Norm }

procedure TFSplash_norm.SetBar(Max: integer; Step: integer);
begin
  ProgressBar1.Position:=0;
  ProgressBar1.Max:=Max;
  ProgressBar1.Step:=Step;
//  RxProcessLabel.Caption:=ProcessCaption;
  Application.ProcessMessages;
  FSplash_Norm.Show;
  FSplash_Norm.Update;
end;

end.
