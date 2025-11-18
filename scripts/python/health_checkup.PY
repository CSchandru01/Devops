import psutil
import sys

cpu= psutil.cpu_percent(interval=1)
memory= psutil.virtual_memory().percent
disk= psutil.disk_usage('/').percent    

print(f"CPU Usage: {cpu}%")
print(f"Memory Usage: {memory}%")
print(f"Disk Usage: {disk}%")       

print("\ntop 5 processes by CPU usage:")
procs = [(p.pid, p.info['name'], p.cpu_percent()
          for p in psutil.process_iter(['name']))]
procs = sorted(procs, key=lambda x: x[2], reverse=True)[:5]
for p in procs:
     print(f"PID: {p[0]}, Name: {p[1]}, CPU Usage: {p[2]}%")    

# alert if any metric exceeds 80%
alrert=False
if cpu > 80:
    print("ALERT: High CPU usage!")
    alert= True
if memory > 80:
    print("ALERT: High Memory usage!")
    alert= True
if disk > 85:
    print("ALERT: High Disk usage!")
    alert= True
if alert:
    sys.exit(1)
else:
    sys.exit(0)
