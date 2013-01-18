program taijiong;

uses
  Forms,
  main in 'main.pas' {TaijiongFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTaijiongFrm, TaijiongFrm);
  Application.Run;
end.
