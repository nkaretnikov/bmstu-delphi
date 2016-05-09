(*
Task: given a square with angles at (1,0), (0,1), (-1,0), and (0,-1), determine
whether a point belongs to it or not.

Solution: rotate the point by 45 degrees and see whether it belongs to the
rotated square.  The diagonal of the original square (or the side of the rotated
one) is sqrt(2).
*)
program ex3a;

type Point = record
  x: Double;
  y: Double;
end;

// Rotate a 'Point' clockwise.
function rotateCW(p: Point; angle: Integer): Point;
var
  x, y : Double;
begin
  x := p.x * cos(-angle) - p.y * sin(-angle);
  y := p.y * cos(-angle) + p.x * sin(-angle);
  p.x := x;
  p.y := y;
  Result := p;
end;

// Check whether a 'Point' is in bounds or not.
function inBounds(p: Point): Boolean;
// 1/2 of a side of the original square (rotated by 45 degrees)
var a : Double;
begin
  a := sqrt(2) / 2;
  if ((-a <= p.x) and (p.x <= a) and
      (-a <= p.y) and (p.y <= a))
  then Result := True
  else Result := False;
end;

procedure inBounds_(p: Point);
begin
  if inBounds(p)
  then WriteLn('In bounds')
  else WriteLn('Out of bounds');
end;

var p: Point;
begin
  Writeln('Enter two real numbers:');
  Write('X: ');
  Readln(p.x);
  Write('Y: ');
  Readln(p.y);
  inBounds_(rotateCW(p, 45));
end.
