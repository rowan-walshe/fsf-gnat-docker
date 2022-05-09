with Ada.Exceptions; use Ada.Exceptions;
with Challenge;      use Challenge;
with Text_IO;        use Text_IO;

procedure Harness is

   procedure Do_Test (In1, In2, Expected : Integer)
   is
      Actual : Integer;
   begin
      Actual := Multiply (In1, In2);
      if Actual = Expected then
         Put_Line ("<PASSED::>");
      else
         Put_Line ("<FAILED::>" & Actual'Image & " should be " & Expected'Image);
      end if;
   exception
      when E : others =>
         Put_Line ("<ERROR::>" & Exception_Message (E));
   end Do_Test;

begin

   Do_Test (5, 6, 30);
   Do_Test (12, 12, 144);
   Do_Test (-2, 3, -6);

end Harness;
