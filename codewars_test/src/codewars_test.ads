with Ada.Text_IO; use Ada.Text_IO;

package Codewars_Test is

   --  Describe a test group
   procedure Describe (Group_Name : String);

   --  Name a test
   procedure IT (Test_Name : String);

   --  Log an error message
   procedure Error (Message : String);

   --  Assert that the test has passed, and log the result
   procedure Assert (Test_Result : Boolean; Message : String := "");

   --  Used to wrap calls to a program, so that exceptions can be caught. This
   --  allows for all tests to run, without stopping for the first exception.
   generic
      type Inputs_T is private;
      type Output_T is private;
      with function Run_Program (X : Inputs_T) return Output_T;
      with function "=" (X, Y : Output_T) return Boolean;
   procedure Test_Wrapper (Params          : Inputs_T;
                           Expected_Result : Output_T;
                           Message         : String := "");

end Codewars_Test;
