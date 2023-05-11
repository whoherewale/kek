#try to understand what write here
#work with data base

Python
import argparse
import logging
import coloredlogs
import ssl
 
import concurrent.futures
import urllib.request
 
from netaddr import IPNetwork
from collections import deque
 
 
VERSION = 0.1
 
 
def setup_args():
 parser = argparse.ArgumentParser(
 description = 'Domain Seeker v' + str(VERSION) + ' (c) Kaimi (kaimi.io)',
 epilog = '',
 formatter_class = argparse.ArgumentDefaultsHelpFormatter
 )
 parser.add_argument(
 '-d',
 '--domains',
 help = 'Domain list to discover',
 type = str,
 required = True
 )
 parser.add_argument(
 '-i',
 '--ips',
 help = 'IP list (ranges) to scan for domains',
 type = str,
 required = True
 )
 parser.add_argument(
 '--https',
 help = 'Check HTTPS in addition to HTTP',
 action = 'store_true'
 )
 parser.add_argument(
 '--codes',
 help = 'HTTP-codes list that will be considered as good',
 type = str,
 default = '200,301,302,401,403'
 )
 parser.add_argument(
 '--separator',
 help = 'IP/Domain/HTTP-codes list separator',
 type = str,
 default = ','
 )
 parser.add_argument(
 '--include',
 help = 'Show results containing provided string',
 type = str
 )
 parser.add_argument(
 '--exclude',
 help = 'Hide results containing provided string',
 type = str
 )
 parser.add_argument(
 '--agent',
 help = 'User-Agent value for HTTP-requests',
 type = str,
 default = 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.1'
 )
 parser.add_argument(
 '--http-port',
 help = 'HTTP port',
 type = int,
 default = 80
 )
 parser.add_argument(
 '--https-port',
 help = 'HTTPS port',
 type = int,
 default = 443
 )
 parser.add_argument(
 '--timeout',
 help = 'HTTP-request timeout',
 type = int,
 default = 5
 )
 parser.add_argument(
 '--threads',
 help = 'Number of threads',
 type = int,
 default = 2
 )
 
 args = parser.parse_args()
 
 return args
 
 
if __name__ == '__main__':
 main()
