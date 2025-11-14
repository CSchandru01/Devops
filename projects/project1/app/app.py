# demo app.py for Project 1 for testing 

from flask import Flask
import socket

app = Flask(__name__)

@app.route('/')
def home():
    return "Welcome to Project 1!"  

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

