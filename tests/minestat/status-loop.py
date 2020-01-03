import sys
import time
import minestat

server = 'localhost'
port = 25565
timeout = time.time() + 300 # How long in seconds to keep retrying
retryTimeout = 5 # How long in seconds between retries

print('Checking status of ' + server + ':' + str(port) + '...')

while True:
  ms = minestat.MineStat(server, port)
  if ms.online:
    print('The server is online.')
    break
  elif time.time() > timeout:
    print('No response and timeout has lapsed, exiting.')
    sys.exit(1)
  else:
    time.sleep(retryTimeout)
    print('No response, retrying in ' + str(retryTimeout) + ' seconds...')
