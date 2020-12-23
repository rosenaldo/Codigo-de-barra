unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    img_codigoBarra: TImage;
    Edit1: TEdit;
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    procedure GerarCodigoBarra(codigo: string; img:TCanvas);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }



{ TForm1 }

procedure TForm1.Edit1Change(Sender: TObject);
begin
GerarCodigoBarra(Edit1.Text, img_codigoBarra.Canvas);
end;

procedure TForm1.GerarCodigoBarra(codigo: string; img: TCanvas);
const
digitos : array['0'..'9'] of string[5]= ('00110', '10001', '01001', '11000',
'00101', '10100', '01100', '00011', '10010', '01010');
var s : string;
i, j, x, t : Integer;
begin
// Gerar o valor para desenhar o c�digo de barras
// Caracter de in�cio
s := '0000';
for i := 1 to length(codigo) div 2 do
for j := 1 to 5 do
s := s + Copy(Digitos[codigo[i * 2 - 1]], j, 1) + Copy(Digitos[codigo[i * 2]], j, 1);
// Caracter de fim
s := s + '100';
// Desenhar em um objeto canvas
// Configurar os par�metros iniciais
x := 0;
// Pintar o fundo do c�digo de branco
Canvas.Brush.Color := clWhite;
Canvas.Pen.Color := clWhite;
Canvas.Rectangle(0,0, 2000, 79);
// Definir as cores da caneta
Canvas.Brush.Color := clBlack;
Canvas.Pen.Color := clBlack;
// Escrever o c�digo de barras no canvas
for i := 1 to length(s) do
begin
// Definir a espessura da barra
t := strToInt(s[i]) * 2 + 1;
// Imprimir apenas barra sim barra n�o (preto/branco - intercalado);
if i mod 2 = 1 then
Canvas.Rectangle(x, 0, x + t, 79);
// Passar para a pr�xima barra
x := x + t;
end;
end;

end.
