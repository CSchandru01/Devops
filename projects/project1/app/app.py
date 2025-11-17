# demo app.py for Project 1 for testing 

from flask import Flask
import socket
import os

app = Flask(__name__)

@app.route('/')
def home():
    env_var = os.getenv('APP_MESSAGE', 'DEFAULT MESSAGE')
    secret_message = os.getenv('SECRET_TOKEN', 'NO SECRET')
    host=socket.gethostname()
    return f"{enc_msg} |Secret: {secret_message} | Host: {host}"

@app.route('/health')
def health():
    return "OK", 200   

@app.route('/ready')
def ready():
    return "READY", 200  

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)


