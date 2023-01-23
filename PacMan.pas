program PacMan;

uses
      GraphABC,
      ABCButtons,
      ABCObjects;
var
  Button1: ButtonABC;
  z, c: integer;
  f2: array [0..1000] of integer;
  a: array [0..19, 0..19] of integer;
  f3, f4, f5, f6: integer;
  i, j, X, Y, s, n, m, o, n2, m2, h, ex, q, qq, prd, dline, p: integer;
  f1: text;
//��������� ������ �� ���������
procedure ext;
begin
  assign(f1, 'records.txt'); //������ ���-�� ����� � ���� records.txt
  append(f1);
  write(f1, ' ', o);
  close(f1);
  window.Close;
end;


//��������� ��������� �������� ����, ��������������� ����� ������ 20�20 ������
procedure Pole;
var
  i, j: integer;
begin
  for i := 0 to 19 do
  begin
    for j := 0 to 19 do
    begin
      a[i, j] := 0; //���������� ������� 0, ������� ���������� ���� �� �������� ������ ����� ���������
    end;
  end;
  for i := 0 to 19 do
  begin
    for j := 0 to 19 do
    begin
      SetBrushColor(clDarkBlue);
      SetPenColor(clBlack);
      if a[i, j] = 0 then rectangle(i * 20, j * 20, (i * 20) + 20, (j * 20) + 20); //���� ��-�� ������� ����� 0, �� �������� �������     
    end;
  end;
  //���������� ������������ ��-�� ������� 1, ������� ����� ���������� �����
  for j := 0 to 1 do
    for i := 0 to 19 do
    begin
      a[i, j] := 1;
    end;
  for j := 19 downto 18 do
    for i := 0 to 19 do
    begin
      a[i, j] := 1;
    end;
  for i := 0 to 1 do
    for j := 0 to 19 do
    begin
      a[i, j] := 1;
    end;
  for i := 19 downto 18 do
    for j := 0 to 19 do
    begin
      a[i, j] := 1;
    end;
  for i := 3 to 8 do
  begin
    j := 3;
    a[i, j] := 1;
  end;
  for i := 10 to 16 do
  begin
    j := 3;
    a[i, j] := 1;
  end;
  for i := 3 to 16 do
    for j := 12 to 15 do
    begin
      a[i, j] := 1;
    end;
  for i := 3 to 5 do
    for j := 5 to 10 do
    begin
      a[i, j] := 1;
    end;
  for i := 14 to 16 do
    for j := 5 to 10 do
    begin
      a[i, j] := 1;
    end;
  for i := 7 to 12 do
    for j := 5 to 7 do
    begin
      a[i, j] := 1;
    end;
  for i := 9 to 10 do
    for j := 7 to 10 do
    begin
      a[i, j] := 1;
    end;
  for j := 9 to 10 do
  begin
    i := 7;
    a[i, j] := 1;
  end;
  for j := 9 to 10 do
  begin
    i := 12;
    a[i, j] := 1;
  end;
  for i := 0 to 19 do
    for j := 0 to 19 do
    begin
      if a[i, j] = 1 then FloodFill((i * 20) + 3, (j * 20) + 3, clPurple);//���������� ����
    end;
  //��������� ���������� ��������� ������� ������ ���������
  for i := 0 to 19 do
    for j := 0 to 19 do
    begin
      if a[i, j] = 0 then 
      begin
        SetBrushColor(clOrange);
        circle((i * 20) + 10, (j * 20) + 10, 5);
        a[i, j] := 2;
        s := s + 1;  //���-�� ���������� ������ �� �����
      end;
    end;  
end;

//��������� ���������
procedure lose;

var
  but := new ButtonABC(150, 200, 100, 'Exit', Color.Purple);//�������� ������ ������ �� ���������
begin
  
  clearwindow(clDarkBlue);
  SetFontSize(32);
  setbrushcolor(clPurple);
  textout(150, 100, 'Game Over!');
  SetFontSize(14);
  rectangle(150, 200, 250, 233);
  textout(180, 205, 'Exit');
  but.OnClick := ext;
  sleep(500);
  
  
  
end;

//��������� ������
procedure win;

var
  but1 := new ButtonABC(150, 200, 100, 'Exit', Color.Purple);//�������� ������ ������ �� ���������
begin
  
  clearwindow(clDarkBlue);
  SetFontSize(14);
  rectangle(150, 200, 250, 233);
  textout(180, 205, 'Exit');
  SetFontSize(14);
  but1.OnClick := ext;
  SetFontSize(32);
  setbrushcolor(clPurple);
  textout(150, 100, 'Winner!!!');
  sleep(500);
end;


procedure KeyDown(key: integer);
var
  OX, OY, i, j, np, mp, k, n2p, m2p, l: integer;
begin
  if ((n = (X + 5)) and (m = (Y + 5))) or ((n2 = (X + 5)) and (m2 = (Y + 5))) then h := h + 1;
  if h = 2 then lose; //�������� �� ��������, ���� ������� �� ����� ������, ��� � ������
  //������������ ������ ����� ��������� �� ���� �����, ��� ���� �� �����
  SetBrushColor(clDarkBlue);
  SetPenColor(clBlack);
  rectangle(x - 5, y - 5, x + 15, y + 15);
  SetBrushColor(clDarkBlue);
  SetPenColor(clBlack);
  if a[n div 20, m div 20] = 0 then rectangle(n - 10, m - 10, n + 10, m + 10);
  if a[n div 20, m div 20] = 2 then 
  begin
    rectangle(n - 10, m - 10, n + 10, m + 10);
    setbrushcolor(clOrange);
    circle(n, m, 5);
  end;
  SetBrushColor(clDarkBlue);
  SetPenColor(clBlack);
  if a[n2 div 20, m2 div 20] = 0 then rectangle(n2 - 10, m2 - 10, n2 + 10, m2 + 10);
  if a[n2 div 20, m2 div 20] = 2 then 
  begin
    rectangle(n2 - 10, m2 - 10, n2 + 10, m2 + 10);
    setbrushcolor(clOrange);
    circle(n2, m2, 5);
  end;
  SetBrushColor(clDarkBlue);
  SetPenColor(clBlack);
  
  
  OX := X;
  OY := Y;
  case key of //�������� ������� ��� ������� ������������ ������ �� ����������
    VK_w: OY := OY - 20;
    VK_s: OY := OY + 20;
    VK_a: OX := OX - 20;
    VK_d: OX := OX + 20;
  end;
  if (a[OX div 20, OY div 20] = 0) or (a[OX div 20, OY div 20] = 2) then 
  begin
    X := OX;
    Y := OY;
    if a[OX div 20, OY div 20] = 2 then 
    begin
      a[OX div 20, OY div 20] := 0; 
      s := s - 1; //��������� ���-�� ���������� ������
      o := o + 10; //������� ����� ������
      SetBrushColor(clBlue);
      textout(400, 25, 'Points: '); 
      textout(400, 45, o); 
    end;
  end;
  SetBrushColor(clYellow);
  SetPenColor(clBlack);
  circle(X + 5, Y + 5, 10); 
  if s = 0 then //�������� �� ������, ���� ���-�� ���������� ������ ����� 0
  begin
    clearwindow(clDarkBlue);
    win;
    ex := 1;
  end;
  if ((n = (X + 5)) and (m = (Y + 5))) or ((n2 = (X + 5)) and (m2 = (Y + 5))) then h := h + 1;
  if h = 2 then
  begin
    Clearwindow(clDarkBlue);//��� ���� �������� �� ��������, ���� ������� �� ����� ������, ��� � ������
    lose;
    ex := 2;
  end;
  
  np := n;          
  mp := m;
  n2p := n2;
  m2p := m2;
  // ����� �������� ������� �������� �� ���������� x ��� y
  l := random(2) + 1;
  if l = 1 then 
  begin
    if n2p < x then n2p := n2p + 20 else //�������� ��������� �������� � ������������ ������� �� x
      n2p := n2p - 20;
  end;
  if l = 2 then 
  begin
    if m2p > y then m2p := m2p - 20 else //�������� ��������� �������� � ������������ ������� �� y
      m2p := m2p + 20;
  end;
  if (a[n2p div 20, m2p div 20] = 0) or (a[n2p div 20, m2p div 20] = 2) then 
  begin
    n2 := n2p;
    m2 := m2p;
    
  end;
  setbrushcolor(clPink);  //��������� �������� ��������
  circle(n2, m2, 10); 
  
  // ����� �������� ������� �������� �� ���������� x ��� y
  k := random(2) + 1;
  if k = 1 then 
  begin
    if np < x then np := np + 20 else //�������� ��������� �������� � ������������ ������� �� x
      np := np - 20;
  end;
  if k = 2 then 
  begin
    if mp > y then mp := mp - 20 else //�������� ��������� �������� � ������������ ������� �� y
      mp := mp + 20;
  end;
  
  if (a[np div 20, mp div 20] = 0) or (a[np div 20, mp div 20] = 2) then 
  begin
    n := np;
    m := mp;
  end;
  setbrushcolor(clRed); //��������� �������� ��������
  circle(n, m, 10); 
  
  if ex = 1 then win;
  if ex = 2 then lose;
  
  Redraw;
  
end;
//��������� ������� ������ Play
procedure ButtonClickPlay;

begin
  clearWindow(clDarkBlue);
  setpencolor(clOrange);
  setbrushcolor(clYellow);
  
  redraw;
  
  OnKeyDown := KeyDown;
  Pole;
  
  if ex = 1 then halt;
  if ex = 2 then halt;
end;

//��������� ������� ������ Settings
procedure ButtonClickSettings;
var
  Button0: ButtonABC;
begin
  
  clearWindow(clDarkBlue);
  redraw;
  setpencolor(clBlue);
  setbrushcolor(clPurple);
  rectangle(10, 10, 300, 300);
  textout(15, 15, 'Control :');
  textout(15, 50, 'w - Move up');
  textout(15, 80, 's - Move down');
  textout(15, 110, 'a - Move left');
  textout(15, 140, 'd - Move right');
  redraw;
  Button0 := ButtonABC.Create(10, 200, 100, 'Continue', clPurple);
  Button0.OnClick := ButtonClickPlay;
end;

 //��������� Menu
procedure Menu;
var
  Button1: ButtonABC;
  Button2: ButtonABC;
  Button3: ButtonABC;

begin
  redraw;
  ClearWindow(clDarkBlue);
  setpencolor(clBlue);
  setbrushcolor(clPurple);
  Button1 := ButtonABC.Create(50, 100, 200, 'Play', clPurple);
  Button1.OnClick := ButtonClickPlay;
  Button2 := ButtonABC.Create(50, 150, 150, 'Settings', clPurple);
  Button2.OnClick := ButtonClickSettings;
  Button3 := ButtonABC.Create(50, 200, 100, 'Exit', clPurple);
  Button3.OnClick := ext;
  
end;

begin
  ex := 0;
  h := 1;
  s := 0;
  n2 := 290;
  m2 := 50;
  n := 50;
  m := 50;
  z := 100;
  c := 100;
  x := 185;
  y := 325;
  o := 0;
  q := 0;
  setpencolor(clBlue);
  setbrushcolor(clPurple);
  Rectangle(300, 100, 600, 300);
  SetFontSize(14);
  textout(380, 105, 'Top 5 Records : ');
  assign(f1, 'records.txt');
  reset(f1);
  while not eof(f1) do //������ ����� �� ���� � ������
  begin
    read(f1, f2[q]);
    inc(q);
    dline := dline + 1; //������ ���-�� ����� � �����
  end;
  
  close(f1);
  q := 0;
  for q := 0 to dline do //���������� ������� �� ��������
    for p := q to dline do
    begin
      if f2[q] < f2[p] then
      
      begin
        prd := f2[q];
        f2[q] := f2[p];
        f2[p] := prd;
      end;
      
    end;
  
  qq := 150;
  for q := 0 to 4 do
  begin
    textout(320, qq, f2[q]);//����� �� ����� ������� � ��� 5 ���������
    qq := qq + 20;
  end;
  
  SetWindowSize(640, 480); //������ �������� ����
  FloodFill(400, 400, clDarkBlue);
  LockDrawing;
  Menu;
  
end.