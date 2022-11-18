package body Wheels is
   
   procedure Front is
      
   begin
      --  We set the frequency by setting the period (remember f=1/t).
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us 
   
      --LEFT
      --front   
      MicroBit.IOsForTasking.Set(6, Forward); --IN1
      MicroBit.IOsForTasking.Set(7, not Forward); --IN2
   
      --back
      MicroBit.IOsForTasking.Set(2, Forward); --IN3
      MicroBit.IOsForTasking.Set(3, not Forward); --IN4
   
      --RIGHT
      --front
      MicroBit.IOsForTasking.Set(12, Forward); --IN1
      MicroBit.IOsForTasking.Set(13, not Forward); --IN2

      --back
      MicroBit.IOsForTasking.Set(14, Forward); --IN3
      MicroBit.IOsForTasking.Set(15, not Forward); --IN4
   
      MicroBit.IOsForTasking.Write (0, Speed); --left speed control ENA ENB
      MicroBit.IOsForTasking.Write (1, Speed); --right speed control ENA ENB
   end Front;
   
   procedure Back is
   
   begin
      --  We set the frequency by setting the period (remember f=1/t).
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us 
   
      --LEFT
      --front   
      MicroBit.IOsForTasking.Set(6, not Forward); --IN1
      MicroBit.IOsForTasking.Set(7, Forward); --IN2
   
      --back
      MicroBit.IOsForTasking.Set(2, not Forward); --IN3
      MicroBit.IOsForTasking.Set(3, Forward); --IN4
   
      --RIGHT
      --front
      MicroBit.IOsForTasking.Set(12, not Forward); --IN1
      MicroBit.IOsForTasking.Set(13, Forward); --IN2

      --back
      MicroBit.IOsForTasking.Set(14, not Forward); --IN3
      MicroBit.IOsForTasking.Set(15, Forward); --IN4
   
      MicroBit.IOsForTasking.Write (0, Speed); --left speed control ENA ENB
      MicroBit.IOsForTasking.Write (1, Speed); --right speed control ENA ENB
   end Back;
   
   
   procedure Left is
     
   begin
      --  We set the frequency by setting the period (remember f=1/t).
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us 
   
      --LEFT
      --front   
      MicroBit.IOsForTasking.Set(6, not Forward); --IN1
      MicroBit.IOsForTasking.Set(7, Forward); --IN2
   
      --back
      MicroBit.IOsForTasking.Set(2, Forward); --IN3
      MicroBit.IOsForTasking.Set(3, not Forward); --IN4
   
      --RIGHT
      --front
      MicroBit.IOsForTasking.Set(12, Forward); --IN1
      MicroBit.IOsForTasking.Set(13, not Forward); --IN2

      --back
      MicroBit.IOsForTasking.Set(14, not Forward); --IN3
      MicroBit.IOsForTasking.Set(15, Forward); --IN4
   
      MicroBit.IOsForTasking.Write (0, Speed); --left speed control ENA ENB
      MicroBit.IOsForTasking.Write (1, Speed); --right speed control ENA ENB
   end Left;
   
   
   procedure Right is
     
   begin
      --  We set the frequency by setting the period (remember f=1/t).
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us 
   
      --LEFT
      --front   
      MicroBit.IOsForTasking.Set(6, Forward); --IN1
      MicroBit.IOsForTasking.Set(7, not Forward); --IN2
   
      --back
      MicroBit.IOsForTasking.Set(2, Forward); --IN3
      MicroBit.IOsForTasking.Set(3, not Forward); --IN4
   
      --RIGHT
      --front
      MicroBit.IOsForTasking.Set(12, not Forward); --IN1
      MicroBit.IOsForTasking.Set(13, Forward); --IN2

      --back
      MicroBit.IOsForTasking.Set(14, not Forward); --IN3
      MicroBit.IOsForTasking.Set(15, Forward); --IN4
   
      MicroBit.IOsForTasking.Write (0, Speed); --left speed control ENA ENB
      MicroBit.IOsForTasking.Write (1, Speed); --right speed control ENA ENB
   end Right;
   
   procedure Stop is
     
   begin
      --  We set the frequency by setting the period (remember f=1/t).
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us 
   
      --LEFT
      --front   
      MicroBit.IOsForTasking.Set(6, not Forward); --IN1
      MicroBit.IOsForTasking.Set(7, not Forward); --IN2
   
      --back
      MicroBit.IOsForTasking.Set(2, not Forward); --IN3
      MicroBit.IOsForTasking.Set(3, not Forward); --IN4
   
      --RIGHT
      --front
      MicroBit.IOsForTasking.Set(12, not Forward); --IN1
      MicroBit.IOsForTasking.Set(13, not Forward); --IN2

      --back
      MicroBit.IOsForTasking.Set(14, not Forward); --IN3
      MicroBit.IOsForTasking.Set(15, not Forward); --IN4
   
      MicroBit.IOsForTasking.Write (0, Speed); --left speed control ENA ENB
      MicroBit.IOsForTasking.Write (1, Speed); --right speed control ENA ENB
   end Stop;

end Wheels;
