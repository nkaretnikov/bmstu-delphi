// Compute (max(X,Y+W, Y-W))^2 - Y^3 * W

uses Math;

function getDouble(x: Double; s: String): Double;
begin
  Write(Concat(s, ': '));
  Readln(x);
  Result := x;
end;

function max3(x, y, z: Double): Double;
begin
  Result := Max(Max(x,y), z);
end;

var x, y, w: Double;
begin
  Writeln('Enter three real numbers:');
  x := getDouble(x, 'x');
  y := getDouble(y, 'y');
  w := getDouble(w, 'w');
  Writeln(Power(max3(x, y+w, y-w), 2) - Power(y, 3) * w);
end.
