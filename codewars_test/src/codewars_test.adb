with Ada.Exceptions; use Ada.Exceptions;

package body Codewars_Test is

   DESCRIBE_TEXT : constant String := "<DESCRIBE::>";
   IT_TEXT       : constant String := "<IT::>";
   PASSED_TEXT   : constant String := "<PASSED::>";
   FAILED_TEXT   : constant String := "<FAILED::>";
   ERROR_TEXT    : constant String := "<ERROR::>";

   --------------
   -- Describe --
   --------------

   procedure Describe (Group_Name : String) is
   begin
      Put_Line (DESCRIBE_TEXT & Group_Name);
   end Describe;

   --------
   -- IT --
   --------

   procedure IT (Test_Name : String) is
      begin
      Put_Line (IT_TEXT & Test_Name);
   end IT;

   -----------
   -- Error --
   -----------

   procedure Error (Message : String) is
   begin
      Put_Line (ERROR_TEXT & Message);
   end Error;

   ------------
   -- Assert --
   ------------

   procedure Assert (Test_Result : Boolean; Message : String := "")
   is
   begin
      if Test_Result then
         Put_Line (PASSED_TEXT & "Test Passed");
      else
         Put_Line (FAILED_TEXT & Message);
      end if;
   end Assert;

   ------------------
   -- Test_Wrapper --
   ------------------

   procedure Test_Wrapper
     (Params          : Inputs_T;
      Expected_Result : Output_T;
      Message         : String := "")
   is
      Result : Output_T;
   begin
      Result := Run_Program (Params);
      Assert (Result = Expected_Result, Message);
   exception
      when E : others =>
         Put_Line (ERROR_TEXT & Exception_Message (E));
         Put_Line (FAILED_TEXT & Message);
   end Test_Wrapper;

end Codewars_Test;
