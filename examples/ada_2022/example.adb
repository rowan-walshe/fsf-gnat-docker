pragma Ada_2022;

with Ada.Text_IO;
with Ada.Containers.Vectors;
with Ada.Containers.Ordered_Maps;

procedure Example is

   package Int_Vectors is new Ada.Containers.Vectors
     (Positive, Integer);

   X : constant Int_Vectors.Vector := [1, 2, 3];

   package Float_Maps is new Ada.Containers.Ordered_Maps
     (Integer, Float);

   Y : constant Float_Maps.Map := [-10 => 1.0, 0 => 2.5, 10 => 5.51];
begin
   Ada.Text_IO.Put_Line ("Vector: " & X'Image);
   Ada.Text_IO.Put_Line ("Ordered_Map: " & Y'Image);
end Example;
