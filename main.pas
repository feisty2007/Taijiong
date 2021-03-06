unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls,Clipbrd,ShellAPI;

type
  TTaijiongFrm = class(TForm)
    pnl1: TPanel;
    img1: TImage;
    lbl1: TLabel;
    edt_firstLine: TEdit;
    edt_secondLine: TEdit;
    edt_thirdLine: TEdit;
    btn1: TButton;
    lbl_firstLine: TLabel;
    lbl_secondLine: TLabel;
    lbl_ThirdLine: TLabel;
    btn2: TButton;
    dlgSave1: TSaveDialog;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lb: TLabel;
    btn3: TButton;
    lbl5: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure lbl4Click(Sender: TObject);
  private
    { Private declarations }
    function verifyInput:Boolean;
  public
    { Public declarations }
  end;

var
  TaijiongFrm: TTaijiongFrm;

implementation

{$R *.dfm}

procedure TTaijiongFrm.btn1Click(Sender: TObject);
begin

  if not verifyInput then
  begin
    ShowMessage('三句请全部输入！');
    Exit;
  end;
  lbl_firstLine.Caption := edt_firstLine.Text;
  lbl_secondLine.Caption := edt_secondLine.Text;
  lbl_ThirdLine.Caption := edt_thirdLine.Text;
end;

procedure TTaijiongFrm.btn2Click(Sender: TObject);
var
  iwidth,iheight:integer;
  bmp:TBitmap;
  jpg:TJPEGImage;
begin
  iwidth := img1.Picture.Width;
  iheight:= img1.Picture.Height;

  bmp:= TBitmap.Create;
  bmp.Width := iwidth;
  bmp.Height := iheight;

  BitBlt(bmp.Canvas.Handle,0,0,iwidth,iheight,Canvas.Handle,0,0,SRCCOPY);

  jpg:=TJPEGImage.Create;
  jpg.Assign(bmp);
  if dlgSave1.Execute then
  begin
    jpg.SaveToFile(dlgSave1.FileName);
    ShowMessage('保存成功');
  end;

  bmp.Free;
  jpg.Free;
end;

function TTaijiongFrm.verifyInput: Boolean;
begin
  Result := true;

  if (Length(Trim(edt_firstLine.text))=0) or (Length(Trim(edt_secondLine.Text))=0) or (Length(Trim(edt_thirdLine.text))=0) then
  begin
    Result := false;
  end;
end;

procedure TTaijiongFrm.btn3Click(Sender: TObject);
var
  iwidth,iheight:integer;
  bmp:TBitmap;
  //jpg:TJPEGImage;
begin
  iwidth := img1.Picture.Width;
  iheight:= img1.Picture.Height;

  bmp:= TBitmap.Create;
  bmp.Width := iwidth;
  bmp.Height := iheight;

  BitBlt(bmp.Canvas.Handle,0,0,iwidth,iheight,Canvas.Handle,0,0,SRCCOPY);

  //jpg:=TJPEGImage.Create;
  //jpg.Assign(bmp);

  //Clipboard.Open;
  //Clipboard.Clear;
  Clipboard.Assign(bmp);
  //Clipboard.Close;
  ShowMessage('保存成功');


  bmp.Free;
  //jpg.Free;

end;

procedure TTaijiongFrm.lbl4Click(Sender: TObject);
begin
  ShellExecute(handle,'open','mailto:camark@sina.cn',nil,nil,SW_NORMAL);
end;

end.
