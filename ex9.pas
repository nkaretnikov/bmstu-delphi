(*
Given an A(n,m) matrix, sort its rows in ascending order by comparing the
minimal element of each row. 
*)

uses Math;

type
  IntegerArray = array of Integer;
  Matrix = array of IntegerArray;

// XXX: Need to sort the array and return the indexes.
function f(mat: Matrix): IntegerArray;
var
  i, j: Integer;
  minv: Integer;
  mins: IntegerArray;
begin
  minv := High(Integer);
  for i := 0 to Length(mat)-1 do
    for j := 0 to Length(mat[i])-1 do
      minv := Min(minv, mat[i,j]);
    SetLength(mins, i+1); 
    mins[i] := minv;
  Result := mins;
end;

var mat: Matrix;
begin
  SetLength(mat, 4);
  SetLength(mat[0], 4);
  SetLength(mat[1], 4);
  SetLength(mat[2], 4);
  SetLength(mat[3], 4);

  mat[0,0] := 16;
  mat[0,1] := 15;
  mat[0,2] := 14;
  mat[0,3] := 13;

  mat[1,0] := 12;
  mat[1,1] := 11;
  mat[1,2] := 10;
  mat[1,3] := 9;

  mat[2,0] := 8;
  mat[2,1] := 7;
  mat[2,2] := 6;
  mat[2,3] := 5;

  mat[3,0] := 4;
  mat[3,1] := 3;
  mat[3,2] := 2;
  mat[3,3] := 1;
end.
