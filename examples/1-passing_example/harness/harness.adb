with Ada.Exceptions;        use Ada.Exceptions;
with Challenge;             use Challenge;
with Text_IO;               use Text_IO;
with Codewars_Test; use Codewars_Test;

procedure Harness is
begin

   Assert (Multiply (5, 6) = 30);
   Assert (Multiply (12, 12) = 144);
   Assert (Multiply (-2, 3) = -6);

end Harness;
