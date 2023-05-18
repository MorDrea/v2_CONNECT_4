unit Unit13;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.UITypes, System.Math;

type
  TForm13 = class(TForm)
    FlowPanel1: TFlowPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape24: TShape;
    Shape25: TShape;
    Shape26: TShape;
    Shape27: TShape;
    Shape28: TShape;
    Shape29: TShape;
    Shape30: TShape;
    Shape31: TShape;
    Shape32: TShape;
    Shape33: TShape;
    Shape34: TShape;
    Shape35: TShape;
    Shape36: TShape;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Shape37: TShape;
    Shape38: TShape;
    Shape39: TShape;
    Shape40: TShape;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Panel4: TPanel;
    Panel5: TPanel;
    procedure InitGrid();
    procedure changeColor(Acase : array of TShape; AIndex : Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    function vertiVerif(): boolean;
    function horizVerif(): boolean;
    function diagVerif() : boolean;
    procedure matXP();
    procedure Button11Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure afficheScore();
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form13: TForm13;
  state : array [0..5] of Integer = (0,0,0,0,0,0);
  Grid : array [0..5, 0..5] of Integer;
  PlayerColor : array[0..1] of TColor = (clBlue, clRed);
  WinColor : array[0..1] of TColor = (clGreen, clYellow);
  Toogle : Boolean = False;
  a : Integer = 0;
  b : Integer = 0;
  score1 : Integer = 0;
  score2 : Integer = 0;

implementation

{$R *.dfm}

procedure TForm13.InitGrid();
var
  I, J : Integer;
begin
   for I := 0 to 5 do
     begin
       for J := 0 to 5 do
         begin
           Grid[I][J] := randomRange(100,200);
           TShape(FindComponent('Shape'+IntToStr((I+1)*((J+1))))).Brush.Color := clWhite;;
         end;
     end;
     Memo2.Lines.Clear;
end;



procedure TForm13.afficheScore();
begin
  Panel4.Caption := IntToStr(score1);
  Panel5.Caption := IntToStr(score2);
end;


procedure TForm13.matXP();
var I : Integer;
begin
  for I := 0 to 5 do
  begin
    Memo2.Lines.Add(IntToStr(Grid[I][0])+' '+IntToStr(Grid[I][1])+' '+IntToStr(Grid[I][2])+' '+IntToStr(Grid[I][3])+' '+IntToStr(Grid[I][4])+' '+IntToStr(Grid[I][5])+' ');
  end;
  Memo2.Lines.add('');
    Memo2.Lines.add('');
    Memo2.Lines.add('');
    Memo2.Lines.add('');
    Memo2.Lines.add('');

end;

function TForm13.diagVErif(): boolean;
var
I, J : Integer;
begin
result := false;
for I := 0 to 2 do
  begin
    for J := 0 to 2 do
      begin
      
        if ((Grid[I][J] = Grid[I+1][J+1]) and (Grid[I+1][J+1] = Grid[I+2][J+2]) and (Grid[I+2][J+2] = Grid[I+3][J+3]) and (Grid[I+3][J+3] = 5))then
        begin
                      case I of
                      0 : begin a := 5; end;
                      1 : begin a := 4; end;
                      2 : begin a := 3; end;
                      end;
          TShape(FindComponent('Shape'+IntToStr((J-2)+((a-2)*6)))).Brush.Color := WinColor[0];
          TShape(FindComponent('Shape'+IntToStr(J+1+((a)*6)))).Brush.Color := WinColor[0];
          TShape(FindComponent('Shape'+IntToStr(J+2+((a-1)*6)))).Brush.Color := WinColor[0];
          TShape(FindComponent('Shape'+IntToStr(J+3+((a-2)*6)))).Brush.Color := WinColor[0];
            result := true;
            ShowMessage('Joueur 1 GAGNE !');
          end else if ((Grid[I][J] = Grid[I+1][J+1]) and (Grid[I+1][J+1] = Grid[I+2][J+2]) and(Grid[I+2][J+2] = Grid[I+3][J+3]) and(Grid[I+3][J+3] = -5)) then
                   begin
                     TShape(FindComponent('Shape'+IntToStr((J-2)+((a-2)*6)))).Brush.Color := WinColor[1];
                     TShape(FindComponent('Shape'+IntToStr(J+1+((a)*6)))).Brush.Color := WinColor[1];
                     TShape(FindComponent('Shape'+IntToStr(J+2+((a-1)*6)))).Brush.Color := WinColor[1];
                     TShape(FindComponent('Shape'+IntToStr(J+3+((a-2)*6)))).Brush.Color := WinColor[1];
                       result := true;
                       ShowMessage('Joueur 2 GAGNE !');
                   end;
          
        end;
        
      end;

      for I := 0 to 2 do
  begin
    for J := 3 to 5 do
      begin
      
        if ((Grid[I][J] = Grid[I+1][J-1]) and (Grid[I+1][J-1] = Grid[I+2][J-2]) and (Grid[I+2][J-2] = Grid[I+3][J-3]) and (Grid[I+3][J-3] = 5))then
        begin
          TShape(FindComponent('Shape'+IntToStr(I+(J*6)))).Brush.Color := WinColor[0];
          TShape(FindComponent('Shape'+IntToStr(I+1+(J*6)))).Brush.Color := WinColor[0];
          TShape(FindComponent('Shape'+IntToStr(I+2+(J*6)))).Brush.Color := WinColor[0];
          TShape(FindComponent('Shape'+IntToStr(I+3+(J*6)))).Brush.Color := WinColor[0];
            result := true;
            ShowMessage('Joueur 1 GAGNE !');
          end else if ((Grid[I][J] = Grid[I+1][J-1]) and (Grid[I+1][J-1] = Grid[I+2][J-2]) and(Grid[I+2][J-2] = Grid[I+3][J-3]) and(Grid[I+3][J-3] = -5)) then
                   begin
                     TShape(FindComponent('Shape'+IntToStr(I+(J*6)))).Brush.Color := WinColor[1];
                     TShape(FindComponent('Shape'+IntToStr(I+1+(J*6)))).Brush.Color := WinColor[1];
                     TShape(FindComponent('Shape'+IntToStr(I+2+(J*6)))).Brush.Color := WinColor[1];
                     TShape(FindComponent('Shape'+IntToStr(I+3+(J*6)))).Brush.Color := WinColor[1];
                       result := true;
                       ShowMessage('Joueur 2 GAGNE !');
                   end;
          
        end;
        
      end;

end;

function TForm13.horizVerif(): boolean;
var
I, J : Integer;
begin
result := false;
for I := 0 to 5 do
  begin
    for J := 0 to 2 do
      begin
        if ((Grid[I][J] = Grid[I][J+1]) and (Grid[I][J+1] = Grid[I][J+2]) and (Grid[I][J+2] = Grid[I][J+3]) and (Grid[I][J+3] = 5))then
        begin
                      case I of
                      0 : begin a := 5; end;
                      1 : begin a := 4; end;
                      2 : begin a := 3; end;
                      3 : begin a := 2; end;
                      4 : begin a := 1; end;
                      5 : begin a := 0; end;
                      end;
                     TShape(FindComponent('Shape'+IntToStr(J+1+(a*6)))).Brush.Color := WinColor[0];
                     TShape(FindComponent('Shape'+IntToStr(J+2+(a*6)))).Brush.Color := WinColor[0];
                     TShape(FindComponent('Shape'+IntToStr(J+3+(a*6)))).Brush.Color := WinColor[0];
                     TShape(FindComponent('Shape'+IntToStr(J+4+(a*6)))).Brush.Color := WinColor[0];
                     result := true;
            ShowMessage('Joueur 1 GAGNE !');
          end else if ((Grid[I][J] = Grid[I][J+1]) and (Grid[I][J+1] = Grid[I][J+2]) and (Grid[I][J+2] = Grid[I][J+3]) and (Grid[I][J+3] = -5)) then
                   begin
                      case I of
                      0 : begin a := 5; end;
                      1 : begin a := 4; end;
                      2 : begin a := 3; end;
                      3 : begin a := 2; end;
                      4 : begin a := 1; end;
                      5 : begin a := 0; end;
                      end;
                     TShape(FindComponent('Shape'+IntToStr(J+1+(a*6)))).Brush.Color := WinColor[1];
                     TShape(FindComponent('Shape'+IntToStr(J+2+(a*6)))).Brush.Color := WinColor[1];
                     TShape(FindComponent('Shape'+IntToStr(J+3+(a*6)))).Brush.Color := WinColor[1];
                     TShape(FindComponent('Shape'+IntToStr(J+4+(a*6)))).Brush.Color := WinColor[1];
                      result := true;
                       ShowMessage('Joueur 2 GAGNE !');
                   end;
        end;
      end;
end;


function TForm13.vertiVerif(): boolean;
var
I, J : Integer;
begin
  result := false;
for J := 0 to 5 do
  begin
    for I := 0 to 2 do
      begin
      
        if ((Grid[I][J] = Grid[I+1][J]) and (Grid[I+1][J] = Grid[I+2][J]) and (Grid[I+2][J] = Grid[I+3][J]) and (Grid[I+3][J] = 5))then
        begin
                      case I of
                      0 : begin b := 6; end;
                      1 : begin b := 5; end;
                      2 : begin b := 4; end;
                      end;
          TShape(FindComponent('Shape'+IntToStr(J-5+(b*6)))).Brush.Color := WinColor[0];
          TShape(FindComponent('Shape'+IntToStr(J-5+((b-1)*6)))).Brush.Color := WinColor[0];
          TShape(FindComponent('Shape'+IntToStr(J-5+((b-2)*6)))).Brush.Color := WinColor[0];
          TShape(FindComponent('Shape'+IntToStr(J-5+((b-3)*6)))).Brush.Color := WinColor[0];
            ShowMessage('Joueur 1 GAGNE !');
            result := true;
          end else if ((Grid[I][J] = Grid[I+1][J]) and (Grid[I+1][J] = Grid[I+2][J]) and(Grid[I+2][J] = Grid[I+3][J]) and(Grid[I+3][J] = -5)) then
                   begin
                   case I of
                      0 : begin b := 6; end;
                      1 : begin b := 5; end;
                      2 : begin b := 4; end;
                      end;
                     TShape(FindComponent('Shape'+IntToStr(J-5+(b*6)))).Brush.Color := WinColor[1];
                     TShape(FindComponent('Shape'+IntToStr(J-5+((b-1)*6)))).Brush.Color := WinColor[1];
                     TShape(FindComponent('Shape'+IntToStr(J-5+((b-2)*6)))).Brush.Color := WinColor[1];
                     TShape(FindComponent('Shape'+IntToStr(J-5+((b-3)*6)))).Brush.Color := WinColor[1];
                       ShowMessage('Joueur 2 GAGNE !');
                       result := true;
                   end;
          
        end;
        
      end;

end;


procedure TForm13.Button10Click(Sender: TObject);
begin
  InitGrid;
end;

procedure TForm13.Button11Click(Sender: TObject);
begin
  Form13.Close;
end;

procedure TForm13.Button1Click(Sender: TObject);
begin
  changeColor([Shape31, Shape25, Shape19, Shape13, Shape7, Shape1], 0);
end;

procedure TForm13.Button2Click(Sender: TObject);
begin
  changeColor([Shape32, Shape26, Shape20, Shape14, Shape8, Shape2], 1);
end;

procedure TForm13.Button3Click(Sender: TObject);
begin
  changeColor([Shape33, Shape27, Shape21, Shape15, Shape9, Shape3], 2);
end;

procedure TForm13.Button4Click(Sender: TObject);
begin
  changeColor([Shape34, Shape28, Shape22, Shape16, Shape10, Shape4], 3);
end;

procedure TForm13.Button5Click(Sender: TObject);
begin
   changeColor([Shape35, Shape29, Shape23, Shape17, Shape11, Shape5], 4);
end;

procedure TForm13.Button6Click(Sender: TObject);
begin
   changeColor([Shape36, Shape30, Shape24, Shape18, Shape12, Shape6], 5);
end;



procedure TForm13.Button9Click(Sender: TObject);
begin
  InitGrid;
  score1 := 0;
  score2 := 0;
end;

procedure TForm13.changeColor(ACase : array of TShape; AIndex : Integer);
var
IndexColor : byte;
PlayerMark : Integer;
  I: Integer;
begin
  if State[AIndex] < 6 then
  begin
      Toogle := not Toogle;

      case Toogle of
      True : begin
          IndexColor := 0;
          PlayerMark := 5;
      end;

      False : begin
          IndexColor := 1;
          PlayerMark := -5;
      end;
      end;
      
      ACase[state[AIndex]].Brush.Color := PlayerColor[IndexColor];

      Grid[state[AIndex]][AIndex] := PlayerMark;
      inc(state[AIndex],1);
      if  state[AIndex] = 6 then
        begin
        TButton(FindComponent('Button'+IntToStr(AIndex+1))).Enabled := false;
        end;
  end else begin

  end;
     if vertiVerif() or horizVerif() or diagVerif() then
     begin
       for I := 0 to 5 do
       begin
         TButton(FindComponent('Button'+IntToStr(I+1))).Enabled := false;
         afficheScore();
       end;
     end;
  diagVErif();
  matXP();
end;


end.
