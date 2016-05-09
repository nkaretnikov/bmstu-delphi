// Reverse a given natural number.

uses Math, SysUtils;

function integerLength(x: Integer): Integer;
begin
  Result := Length(IntToStr(x));
end;

var x, y, m, len: Integer;
begin
  Writeln('Enter a natural number:');
  Readln(x);
  y := 0;
  len := integerLength(x);
  m := Trunc(IntPower(10, len-1));
  repeat
    y := y + (x mod 10) * m;
    x := x div 10;
    m := m div 10;
  until (x <= 0);
  Writeln(y);
end.
