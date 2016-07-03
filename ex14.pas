(*
Define an object with the following fields and methods.  Write a program that
creates the object and tests the methods.  The object is a table, its
parameteres are two numbers: its length and width.  Its methods are the
initialization procedure, a procedure for computing its area, and a
pretty-printing method.
*)

type Table = class(TObject)
  len: Integer;
  width: Integer;
  procedure init(l, w: Integer);
  function area(): Integer;
  procedure print();
end;

procedure Table.init(l, w: Integer);
begin
  len := l;
  width := w;
end;

function Table.area(): Integer;
begin
  Result := len * width;
end;

procedure Table.print();
begin
  WriteLn('length: ', len);
  WriteLn('width: ', width);
end;

var t: Table;
begin
  t := Table.Create();
  t.init(4, 5);
  t.print();
  WriteLn(t.area());
  t.Destroy();
end.
