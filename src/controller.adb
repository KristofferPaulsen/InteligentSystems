with Ada.Real_Time; use Ada.Real_Time; 
with Wheels; use Wheels;
with Ultrasonic; use Ultrasonic;
with MicroBit.Radio; use MicroBit.Radio;
use MicroBit; 
with HAL; use HAL;
with Ada.Execution_Time; use Ada.Execution_Time;

package body Controller is
      
   procedure Drive(CarDirection : Directions) is 
   begin
      case CarDirection is 
         
         when Front => Wheels.Front;
            Put_Line("FORWARD!");
         when Back => Wheels.Back;
            Put_Line("BACKWARD!");
         when Left => Wheels.Left;
            Put_Line("LEFT!");
         when Right => Wheels.Right;
            Put_Line("RIGHT!");
         when Stop => Wheels.Stop;
            Put_Line("NOTMOVING");
      end case; 
   end Drive;
    
       
   task body Sense is 
      SensorValues : Distance_Cm := 10;
      MyClock : Time; 
      Time_Now_Stopwatch : Time;
      Time_Now_CPU : CPU_Time;
      Elapsed_Stopwatch : Time_Span;
      Elapsed_CPU : Time_Span;
      AmountOfMeasurement: Integer := 10; -- do 10 measurement and average
          
   begin 
      Ultrasonic.Setup(10,11);
      
      loop
         Elapsed_Stopwatch := Time_Span_Zero;
         Elapsed_CPU := Time_Span_Zero;
         
         for Index in 1..AmountOfMeasurement loop
         
            Time_Now_Stopwatch := Clock;
            Time_Now_CPU := Clock;

        
            MyClock := Clock;               
             
            Measurements.SetMeasurements(Read);
         
            Put_Line("Read" & Distance_Cm'Image(SensorValues));
                                 
            delay until Myclock + Milliseconds(70);   
            Elapsed_CPU := Elapsed_CPU + (Clock - Time_Now_CPU);
            Elapsed_Stopwatch := Elapsed_Stopwatch + (Clock - Time_Now_Stopwatch);
         end loop;
         Elapsed_CPU := Elapsed_CPU / AmountOfMeasurement;
         Elapsed_Stopwatch := Elapsed_Stopwatch / AmountOfMeasurement;

         Put_Line ("Average CPU time SENSE: " & To_Duration (Elapsed_CPU)'Image & " seconds");
         Put_Line ("Average Stopwatch time SENSE: " & To_Duration (Elapsed_Stopwatch)'Image & " seconds");
            
       
      end loop;
   end Sense; 
   
   task body Act is 
      MyClock : Time;
      Time_Now_Stopwatch : Time;
      Time_Now_CPU : CPU_Time;
      Elapsed_Stopwatch : Time_Span;
      Elapsed_CPU : Time_Span;
      AmountOfMeasurement: Integer := 10; -- do 10 measurement and average

   begin 
      loop 
         Elapsed_Stopwatch := Time_Span_Zero;
         Elapsed_CPU := Time_Span_Zero;
         
         for Index in 1..AmountOfMeasurement loop
         
            Time_Now_Stopwatch := Clock;
            Time_Now_CPU := Clock;

            MyClock := Clock;
        
            Drive(MotorDriver.GetDirection);
            delay until MyClock + Milliseconds(50);
            Elapsed_CPU := Elapsed_CPU + (Clock - Time_Now_CPU);
            Elapsed_Stopwatch := Elapsed_Stopwatch + (Clock - Time_Now_Stopwatch);
         end loop;
         Elapsed_CPU := Elapsed_CPU / AmountOfMeasurement;
         Elapsed_Stopwatch := Elapsed_Stopwatch / AmountOfMeasurement;

         Put_Line ("Average CPU time ACT: " & To_Duration (Elapsed_CPU)'Image & " seconds");
         Put_Line ("Average Stopwatch time ACT: " & To_Duration (Elapsed_Stopwatch)'Image & " seconds");
         
      end loop;
   end Act; 
      
   task body Think is 
      MyClock : Time;
      Time_Now_Stopwatch : Time;
      Time_Now_CPU : CPU_Time;
      Elapsed_Stopwatch : Time_Span;
      Elapsed_CPU : Time_Span;
      AmountOfMeasurement: Integer := 10; -- do 10 measurement and average
   begin
      
      loop
         Elapsed_Stopwatch := Time_Span_Zero;
         Elapsed_CPU := Time_Span_Zero;
         
         for Index in 1..AmountOfMeasurement loop
         
            Time_Now_Stopwatch := Clock;
            Time_Now_CPU := Clock;
         
            MyClock := Clock; 
      
            Put_Line("Hello");
            
            if Measurements.GetMeasurements < 50 then 
               MotorDriver.SetDirection(Right); 
            else 
               MotorDriver.SetDirection(Front); 
            end if;    
      
            delay until MyClock + Milliseconds(100);
               
            Elapsed_CPU := Elapsed_CPU + (Clock - Time_Now_CPU);
            Elapsed_Stopwatch := Elapsed_Stopwatch + (Clock - Time_Now_Stopwatch);
         end loop;
         Elapsed_CPU := Elapsed_CPU / AmountOfMeasurement;
         Elapsed_Stopwatch := Elapsed_Stopwatch / AmountOfMeasurement;

         Put_Line ("Average CPU time THINK: " & To_Duration (Elapsed_CPU)'Image & " seconds");
         Put_Line ("Average Stopwatch time THINK: " & To_Duration (Elapsed_Stopwatch)'Image & " seconds");
     

      end loop;               
   end Think;
                      
   protected body MotorDriver is 
 
      procedure SetDirection (V : Directions) is
      begin
         DriveDirection := V;
      end SetDirection;

      function GetDirection return Directions is
      begin
         return DriveDirection;
      end GetDirection;
      
      
   end MotorDriver;
   
   protected body Measurements is 
      procedure SetMeasurements(K : Distance_Cm) is 
      begin
         SensorValues := K;
      end SetMeasurements;
      
      function GetMeasurements return Distance_Cm is 
      begin 
         return SensorValues; 
      end GetMeasurements;
   
   end Measurements;
end Controller;
