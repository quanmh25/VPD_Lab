#!/usr/bin/env python3
import ev3dev2.motor as motor
import time

motorA = motor.LargeMotor(motor.OUTPUT_A)
voltages = [100, 80, 60, 40, 20, -20, -40, -60, -80, -100] 
try: 
    for vol in voltages: 
        timeStart = time.time() 
        startPos = motorA.position 
        name = "data" + str(vol) 
        file = open(name, "w") 
        while True: 
            timeNow = time.time() - timeStart 
            motorA.run_direct(duty_cycle_sp = vol) 
            pos = motorA.position - startPos 
            file.write('{}, {}, {}\n'.format(timeNow, pos, motorA.speed))
            if timeNow > 1: 
                motorA.run_direct(duty_cycle_sp = 0)
                motorA.stop()
                time.sleep(3)
                break 
        file.close() 
except Exception as e: 
    raise e 
finally: 
    motorA.stop(stop_action = 'brake') 
    file.close()