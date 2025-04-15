#include <Bridge.h>
#include <Wire.h>

const int addr = 11;

void putr(byte r)
{
  Wire.beginTransmission(addr);    
  Wire.write(r);            
  Wire.endTransmission();
}

char strt[2];
char no[2];
char lvl[4];
char per[5];
char smpls[5];
char pwm[3];
char kp[5];
char ki[5];
char kd[5];
char dstrbstart[4];
char dstrbdir[5];
char rly[2];
char rlyon[4];
char rlyonv[4];
char rlyoff[4];
char rlyoffv[4]; 
char d[2];
char hl1[2];
char hl2[2];
char hl3[2];
char hl4[2];
char hl5[2];
char offst[4];
char slp[6];
char lin[2];
char corr[2]; 
char chnk[4];

String rcdata;
int chunk = 50;
int partial;
long now, nowOld = millis();

void setup() {
  //pinMode(0, OUTPUT);
  //digitalWrite(0, 1);
  //pinMode(1, OUTPUT);
  //digitalWrite(1, 1);
  //pinMode(2, OUTPUT);
  //digitalWrite(2, 1);
  pinMode(4, OUTPUT);
  digitalWrite(4, 1);
  pinMode(5, OUTPUT);
  digitalWrite(5, 1);
  pinMode(6, OUTPUT);
  digitalWrite(6, 1);
  pinMode(7, OUTPUT);
  digitalWrite(7, 1);
  pinMode(8, OUTPUT);
  digitalWrite(8, 1);
  pinMode(9, OUTPUT);
  digitalWrite(9, 1);
  pinMode(10, OUTPUT);
  digitalWrite(10, 1);
  pinMode(11, OUTPUT);
  digitalWrite(11, 1);
  pinMode(12, OUTPUT);
  digitalWrite(12, 1);
  pinMode(13, OUTPUT);
  digitalWrite(13, 1);
  //analogWrite(3, 0);
  Bridge.begin();
  Wire.begin();
  putr(0);
}

void loop() {
  Bridge.get("strt", strt, 2);    
  int start = String(strt).toInt();
  if(start == 1)
  {
    float pointf;
    rcdata = "";        
    Bridge.put("finished", "0");
    Bridge.put("partial", "0");
    Bridge.get("no", no, 2);
    Bridge.get("per", per, 5);
    Bridge.get("smpls", smpls, 5);
    Bridge.get("lvl", lvl, 4);
    Bridge.get("pwm", pwm, 3);
    Bridge.get("kp", kp, 5);
    Bridge.get("ki", ki, 5);
    Bridge.get("kd", kd, 5);
    Bridge.get("dstrbstart", dstrbstart, 4);
    Bridge.get("dstrbdir", dstrbdir, 5);
		Bridge.get("rly", rly, 2);
		Bridge.get("rlyon", rlyon, 4);
		Bridge.get("rlyonv", rlyonv, 4);
		Bridge.get("rlyoff", rlyoff, 4);
		Bridge.get("rlyoffv", rlyoffv, 4);
    Bridge.get("d", d, 2);
    Bridge.get("hl1", hl1, 2);
    Bridge.get("hl2", hl2, 2);
    Bridge.get("hl3", hl3, 2);
    Bridge.get("hl4", hl4, 2);
    Bridge.get("hl5", hl5, 2);
    Bridge.get("offst", offst, 4);
    Bridge.get("slp", slp, 6);
    Bridge.get("lin", lin, 2);
    Bridge.get("corr", corr, 2);
    Bridge.get("chnk", chnk, 4);
    int chnlno = String(no).toInt();
    int period = String(per).toInt();
    int samples = String(smpls).toInt();
    byte level = String(lvl).toInt();
    int intpwm = String(pwm).toInt();
    float kpv = String(kp).toFloat(); 
    float kiv = String(ki).toFloat();
    float ts = period / 1000.0;
		int relay = String(rly).toInt();
		int relayon = String(rlyon).toInt();
		int relayonv = String(rlyonv).toInt();
		int relayoff = String(rlyoff).toInt();
		int relayoffv = String(rlyoffv).toInt();
    int dv = String(d).toInt();
    int hl1v = String(hl1).toInt();
    int hl2v = String(hl2).toInt();
    int hl3v = String(hl3).toInt();
    int hl4v = String(hl4).toInt();
    int hl5v = String(hl5).toInt();
    int offset = String(offst).toInt();
    float slope = String(slp).toFloat();
    kiv *= ts;
    float kdv = String(kd).toFloat();
    kdv /= ts;
    int disturbstart = String(dstrbstart).toInt();
    String disturbdir = String(dstrbdir);
    int linear = String(lin).toInt();
    int correct = String(corr).toInt();
    if(String(chnk) != "")
      chunk = String(chnk).toInt();
    partial = chunk;

    int up, down, dstrb = 0;

    digitalWrite(4, hl1v);
    digitalWrite(5, hl2v);
    digitalWrite(6, hl3v);
    digitalWrite(7, hl4v);
    digitalWrite(8, hl5v);
    
    if(disturbstart > 0)
    {
      switch(dv)
      {        
        case 1: 
         up = 9; 
         down = 10;
         break;
        case 3: 
         up = 11;
         down = 12;
         break;        
       case 5:
        up = 13;
        down = 13;
        break;
      }
      if(disturbdir == "up")
        dstrb = up;
      if(disturbdir == "down")
        dstrb = down;
    }

    //analogWrite(intpwm, level);
    if(linear)
    {
      if(correct)
        putr(40);
    }
    else
      putr(level);
    
    rcdata = "[";    
    String coma = ",";
    int point, pointOld;
    String package = "";
    int p = 0;
    int err, u, u0;
    byte bu;
    float intgrl = 0, drvtv;
    int currelay = relayonv; 
    int stepx = 0, stepy = 0, nextx; 
    pointOld = analogRead(chnlno);
    pointf = (pointOld - offset) / slope;
    pointOld = (int)pointf;
    Bridge.put("partial", "0");    
    u = 0; 
    u0 = 0;
    if(samples >= 255)
    {
      stepx = samples / 255;
      nextx = stepx;
    }
    else 
      stepy = 255 / samples;
    for(int i = 0; i < samples; i++)
    {
      if(disturbstart > 0)
        if((float)i / (float)samples * 100.0 >= disturbstart)
          digitalWrite(dstrb, 0);
      if(i == partial)
      {
        package = "partial" +  String(p);
        Bridge.put("partial", package);
        Bridge.put("package", rcdata);
        partial += chunk;
        rcdata = "";
        p++;
      }
      do
        now = millis();
      while(now < nowOld + period);      
      point = analogRead(chnlno);
      pointf = (point - offset) / slope;
      point = (int)pointf;
      nowOld = now;
      
      if(linear)
      {
        if(stepx)
        {
          if(i == nextx)
          {            
            u0++;             
            nextx += stepx;            
          }
        }
        else
          u0 += stepy;
        if(u0 > 255)
          u = 255;
        else if(u0 < 40)
        {
          if(correct)
            u = 40;
        }
          else
            u = u0;           
      }
      else if(relay)
			{
				if(point >= relayon)
					currelay = relayoffv;
				if(point <= relayoff)
					currelay = relayonv;
        u = currelay;
			}
      else if(kpv > 0)
      {
        err = (level - point);
        intgrl += err;
        drvtv = point - pointOld;
        u = kpv * err + kiv * intgrl - kdv * drvtv; 
        if(u > 255)
          u = 255;
        if(u < 0)
          u = 0;
      }
      else
        u = level;
      bu = (byte)u;
      //analogWrite(intpwm, u);      
      putr(bu);
      if(i == samples - 1)      
        coma = "";
      else
        coma = ",";
      rcdata = rcdata + String(point);
      rcdata = rcdata + coma;
      pointOld = point;
    }
    rcdata = rcdata + "]";
    package = "partial" +  String(p);
    Bridge.put("partial", package);
    Bridge.put("package", rcdata);
    Bridge.put("finished", "1");
    Bridge.put("strt", "0");
    if(dstrb > 0)
      digitalWrite(dstrb, 1);        
  }
}
