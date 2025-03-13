import matplotlib.pyplot as plt

# File path
file_path = "D:\\ITMO\\first_year\\vpd\\lab1\\vpd_first_lab\\data20"

# Data arrays
time = []
angle = []
angular_velocity = []

# Read the file
with open(file_path, 'r', encoding='utf-8') as file:
    for line in file:
        # Split the data by comma
        data = line.strip().split(',')
        time.append(float(data[0]))
        angle.append(float(data[1]))
        angular_velocity.append(float(data[2]))

# Plot
plt.figure(figsize=(10, 6))
plt.plot(time, angular_velocity, marker='o', linestyle='-', color='b', label='Angular Velocity')
plt.xlabel('Time (s)')
plt.ylabel('Angular Velocity (deg/s)')
plt.title('Angular Velocity vs Time')
plt.legend()
plt.grid(True)
plt.show()
