unit uTriangle;

interface
  type
    Shapes = (Equilateral, Isosceles, Scalene);

    Triangle = class
      class function Sides(AShapeName : Shapes; ASide1, ASide2, ASide3 : single) : boolean; static;
    end;

implementation
  uses
    System.Generics.Collections;

  class function Triangle.Sides(AShapeName : Shapes; ASide1, ASide2, ASide3 : single) : boolean;
    var
     SidesList : TArray<single>;
    begin
      // Default value for Result
      Result := FALSE;

      SidesList := [ASide1, ASide2, ASide3];
      System.Generics.Collections.TArray.Sort<single>(SidesList);

      // Not a "real" triangle case
      if (0 >= ASide1) or (0 >= ASide2) or (0 >= ASide3) then
        exit;

      // "Opened" triangle case
      if (SidesList[0] + SidesList[1]) < SidesList[2] then
        exit;

      case (AShapeName) of
        Equilateral :
          if (ASide1 = ASide2) and (ASide2 = ASide3) then
            Result := TRUE;
        Isosceles :
          begin
          if (ASide1 = ASide2) or (ASide2 = ASide3) or (ASide1 = ASide3) then
            Result := TRUE;
          end;
        Scalene :
          begin
          if (ASide1 <> ASide2) and (ASide2 <> ASide3) and (ASide1 <> ASide3) then
            Result := TRUE;
          end;
      end;

    end;

end.
