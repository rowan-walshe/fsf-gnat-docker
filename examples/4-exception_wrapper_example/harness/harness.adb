with Ada.Exceptions; use Ada.Exceptions;
with Challenge;      use Challenge;
with Text_IO;        use Text_IO;
with Codewars_Test; use Codewars_Test;

procedure Harness is

   type Params_T is record
      X, Y : Integer;
   end record;

   function Run_Program (Params : Params_T) return Integer is
     (Multiply (Params.X, Params.Y));

   procedure Run_Test is new Codewars_Test.Test_Wrapper
     (Inputs_T    => Params_T,
      Output_T    => Integer,
      Run_Program => Run_Program,
      "="         => "=");

begin

   Run_Test ((2, 2), 4, "2 * 2 should equal 4");
   Run_Test ((12, 12), 144, "12 * 12 should equal 144");
   Run_Test ((-2, 3), -6, "-2 * 3 should equal -6");

end Harness;