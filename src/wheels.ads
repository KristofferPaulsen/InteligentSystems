with Ada.Real_Time; use Ada.Real_Time;
with Microbit.IOsForTasking; use MicroBit.IOsForTasking;
with Ultrasonic; use Ultrasonic;
with MicroBit.Console; use MicroBit.Console;

package wheels is

   Speed : constant MicroBit.IOsForTasking.Analog_Value := 1023; --between 0 and 1023
   Forward : constant Boolean := True; -- forward is true, backward is false
 
   procedure Front;
   procedure back;
   procedure right;
   procedure Left;
   procedure Stop; 
   
end wheels;
