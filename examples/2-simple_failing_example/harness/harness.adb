with Ada.Exceptions; use Ada.Exceptions;
with Challenge;      use Challenge;
with Text_IO;        use Text_IO;
with Codewars_Test; use Codewars_Test;

procedure Harness is
begin

   Assert (Multiply (2, 2) = 4, "2 * 2 should equal 4");
   Assert (Multiply (12, 12) = 144, "12 * 12 should equal 144");
   Assert (Multiply (-2, 3) = -6, "-2 * 3 should equal -6");

end Harness;
