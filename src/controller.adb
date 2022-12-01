

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
      TempData : Radio.RadioData;
      TxData : Radio.RadioData;
      MyClock : Time; 
   begin 
      Ultrasonic.Setup(10,11);
      TxData.Length := 3+12;
      TxData.Version := 12;
      TxData.Group := 1;
      TxData.Protocol := 14;
      
      Radio.Setup(RadioFrequency => 2407,
                  Length => TxData.Length,
                  Version => TxData.Version,
                  Group => TxData.Group, 
                  Protocol => TxData.Protocol);
      
      Radio.StartReceiving;
      Put_Line(Radio.State);
      
      loop 
         MyClock := Clock;               
             
         Measurements.SetMeasurements(Read);
         
         Put_Line("Read" & Distance_Cm'Image(Read));
        
         MicroValues.SetMicroValues(Radio.Receive);
         
         delay until Myclock + Milliseconds(100);   
                   
      end loop;
   end Sense; 
   
   task body Act is 
      MyClock : Time;
   begin 
      loop 
    
         MyClock := Clock;
        
         Drive(MotorDriver.GetDirection);
         delay until MyClock + Milliseconds(50);
      
         
      end loop;
   end Act; 
      
   task body Think is 
      MyClock : Time;
      RData : Radio.RadioData;
   begin
      
      loop
    
         MyClock := Clock; 
      
         Put_Line("Hello");
         RData := MicroValues.GetMicroValues;
         if Measurements.GetMeasurements > 50 then
            if RData.Payload(1) = 0 then 
               MotorDriver.SetDirection(Stop);
            elsif RData.Payload(1) = 1 then
               MotorDriver.SetDirection(Front);
            elsif Rdata.Payload(1) = 2 then
               MotorDriver.SetDirection(Back);
            elsif Rdata.Payload(1) = 3 then
               MotorDriver.SetDirection(Right);
            elsif Rdata.Payload(1) = 4 then
               MotorDriver.SetDirection(Left);
            else 
               MotorDriver.SetDirection(Stop);
            end if; 
         
         else 
            MotorDriver.SetDirection(Stop);  
         end if;    
      
         delay until MyClock + Milliseconds(100);
                
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
   
   protected body MicroValues is 
      procedure SetMicroValues(A : Radio.RadioData) is 
      begin
         MicrobitData := A;
      end SetMicroValues;
      
      function GetMicroValues return Radio.RadioData is 
      begin 
         return MicrobitData;
      end GetMicroValues;
   end MicroValues;
   
  
end Controller;

   

