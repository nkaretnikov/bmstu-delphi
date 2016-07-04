(*
Design and define a class hierarchy, with inheritance, and test it.  The first
object is a car, which can store and print its issue year and mileage, and which
can determine the average mileage per year.  The second object is a car, which
can store its registration number, brand, issue year, mileage, and the lastname
of its owner, which can print the said parameters and the average mileage per
year.
*)

uses SysUtils;

type Car = class(TObject)
  issueYear: Cardinal;
  mileage: Cardinal;
  procedure print();
  function mileagePerYear(): Real;
end;

procedure Car.print();
begin
  WriteLn('issue year: ', issueYear);
  WriteLn('mileage: ', mileage);
end;

function Car.mileagePerYear();
begin
  Result := mileage / (CurrentYear() - issueYear);
end;

type CarExt = class(Car)
  regNumber: Cardinal;
  brand: String;
  ownerLastName: String;
  procedure print();
end;

procedure CarExt.print();
begin
  WriteLn('registration number: ', regNumber);
  WriteLn('brand: ', brand);
  WriteLn('owner last name: ', ownerLastName);
  inherited print();
end;

var car1: Car;
var car2: CarExt;
begin
  car1 := Car.Create();
  car1.issueYear := 1992;
  car1.mileage := 288000;
  car1.print();
  WriteLn(car1.mileagePerYear():4:2);
  WriteLn('');

  car2 := CarExt.Create();
  car2.regNumber := 343250;
  car2.brand := 'Ford';
  car2.ownerLastName := 'Smith';
  car2.issueYear := 1988;
  car2.mileage := 320000;
  car2.print();
  WriteLn(car2.mileagePerYear():4:2);
end.
