#!/usr/bin/python

from bottle import Bottle, template, request, static_file

title = 'rc control'
content = 'RC control'

kw = {'title': title, 'content': content}

rctmpl = template('rc.tpl', **kw)

cssfile = 'rc.css'
htmxmin = 'htmx.min.js'

import sys

sys.path.insert(0, '/usr/lib/python2.7/bridge/')

from bridgeclient import BridgeClient as bridgeclient

bridge = bridgeclient()

global chnlno, period, samples, level, pwmval, kpv, kiv, kdv, disturbstart, disturbdir, relay, relayon, relayonv, relayoff, relayoffv, dv, hl1v, hl2v, hl3v, hl4v, hl5v, offset, slope, linear, correct, chunk

chunk = ''

def setup():
 bridge.put('no', chnlno)
 bridge.put('per', period)
 bridge.put('smpls', samples)
 bridge.put('lvl', level)
 #bridge.put('pwm', pwmval)
 bridge.put('kp', kpv)
 bridge.put('ki', kiv)
 bridge.put('kd', kdv)
 bridge.put('dstrbstart', disturbstart)
 bridge.put('dstrbdir', disturbdir)
 bridge.put('rly', relay)
 bridge.put('rlyon', relayon)
 bridge.put('rlyonv', relayonv)
 bridge.put('rlyoff', relayoff)
 bridge.put('rlyoffv', relayoffv)
 bridge.put('d', dv)
 bridge.put('hl1', hl1v)
 bridge.put('hl2', hl2v)
 bridge.put('hl3', hl3v)
 bridge.put('hl4', hl4v)
 bridge.put('hl5', hl5v)
 bridge.put('offst', offset)
 bridge.put('slp', slope)
 bridge.put('lin', linear)
 bridge.put('corr', correct)
 bridge.put('chnk', chunk)
 
app = Bottle()

@app.route('/')
def index():
 return rctmpl

@app.route('/strt')
def strt():
 global alldata
 alldata = ''
 start = request.query.strt
 setup()
 bridge.put('strt', '1')
 finished = bridge.get('finished')
 p = 0
 partialold = '0'
 while finished == '0':
  finished = bridge.get('finished')
  partial = bridge.get('partial')
  if not (partial == partialold):
   rcdata = bridge.get('package')
   partialold = partial
   alldata = alldata + rcdata
   p += 1
   print(str(p) + '. partial')
   print(rcdata)
 print("alldata: ")
 print(alldata)
 return alldata
 
@app.route('/no') 
def no(): 
 global chnlno
 chnlno = request.query.no 
 return chnlno 

@app.route('/per')
def per():
 global period
 period = request.query.per
 return period

@app.route('/smpls')
def smpls():
 global samples
 samples = request.query.smpls
 return samples

@app.route('/lvl')
def lvl():
 global level 
 level = request.query.lvl
 return level

@app.route('/pwm')
def pwm():
 global pwmval
 pwmval = request.query.pwm
 return pwmval 

@app.route('/kp')
def kp():
 global kpv
 kpv = request.query.kp
 return kpv

@app.route('/ki')
def ki():
 global kiv
 kiv = request.query.ki
 return kiv

@app.route('/kd')
def kd():
 global kdv
 kdv = request.query.kd
 return kdv

@app.route('/dstrbstart')
def dstrbstart():
 global disturbstart
 disturbstart = request.query.dstrbstart
 return disturbstart

@app.route('/dstrbdir')
def dstrbdir():
 global disturbdir
 disturbdir = request.query.dstrbdir
 return disturbdir

@app.route('/rly')
def rly():
 global relay
 relay = request.query.rly
 if relay == 'on':
  relay = '1'
  return 'on'
 else:
  relay = '0'
  return 'off' 

@app.route('/rlyon')
def rlyon():
 global relayon
 relayon = request.query.rlyon
 return relayon 

@app.route('/rlyonv')
def rlyonv(): 
 global relayonv
 relayonv = request.query.rlyonv
 return relayonv

@app.route('/rlyoff')
def rlyoff():
 global relayoff
 relayoff = request.query.rlyoff
 return relayoff

@app.route('/rlyoffv')
def rlyoffv(): 
 global relayoffv
 relayoffv = request.query.rlyoffv 
 return relayoffv

@app.route('/d')
def d():
 global dv
 dv = request.query.d
 return dv

@app.route('/hl1')
def hl1():
 global hl1v
 hl1v = request.query.hl1
 if hl1v == '0':
  return 'l'
 else:
  hl1v = '1' 
  return 'h'

@app.route('/hl2')
def hl2():
 global hl2v
 hl2v = request.query.hl2
 if hl2v == '0': 
  return 'l' 
 else:
  hl2v = '1'  
  return 'h'
  
@app.route('/hl3')
def hl3():
 global hl3v 
 hl3v = request.query.hl3
 if hl3v == '0': 
  return 'l'  
 else:
  hl3v = '1'
  return 'h'

@app.route('/hl4')
def hl4():
 global hl4v
 hl4v = request.query.hl4
 if hl4v == '0':
  return 'l' 
 else:
  hl4v = '1'
  return 'h'

@app.route('/hl5')
def hl5():
 global hl5v 
 hl5v = request.query.hl5
 if hl5v == '0':
  return 'l'
 else:
  hl5v = '1'
  return 'h'

@app.route('/offst')
def offst():
 global offset
 offset = request.query.offst
 return offset

@app.route('/slp')
def slp():
 global slope
 slope = request.query.slp
 return slope

@app.route('/lin')
def lin():
 global linear
 linear = request.query.lin
 if linear == '1':
  return 'test'
 else:
  return 'no'

@app.route('/corr')
def corr():
 global correct
 correct = request.query.corr
 if correct == '1':
  return 'on'
 else:
  return 'off'

@app.route('/chnk')
def chnk():
 global chunk
 chunk = request.query.chnk
 return 'chunk=' + chunk

@app.route('/assets/<file:path>')
def static(file):
 return static_file(file, root='/root/bottle/assets/')

app.run(host='192.168.240.1', port=8080, debug=True, reloader=True)
