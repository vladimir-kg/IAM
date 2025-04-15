

<% 
	kw={'title': title, 'content': content}
	rebase('mainhtml.tpl', **kw)
%>
<div id='content'>
  <h2>RC analog systems model</h2>
  <fieldset>
    <legend>RC analog system setup</legend>
    <div class='flex-container'>
      <div>
        <fieldset class='single'>
          <label for='npt'>input</label>
          <input type='radio' id='npt' name='no' value='0' hx-trigger='change' hx-get='/no' hx-target='#answer'>
        </fieldset>
      </div>
      <div>
        <fieldset class='single'>
          <label for='frst'>1st</label>
          <input type='radio' id='frst' name='no' value='1' hx-trigger='change,load' hx-get='/no' hx-target='#answer' checked> 
          <label for='hl1'>hl1</label>
          <input type='checkbox' id='hl1' name='hl1' value='0' hx-trigger='change, load' hx-get='/hl1' hx-target='#hl1v'>
          <span id='hl1v'></span>
          <label for='d1'>d1</label>
          <input type='radio' id='d1' name='d' value='1' hx-trigger='change, load' hx-get='/d' hx-target='#d'checked>
        </fieldset>
      </div>
      <div>
        <fieldset class='single'>
          <label for='scnd'>2nd</label>
          <input type='radio' id='scnd' name='no' value='2' hx-trigger='change' hx-get='/no' hx-target='#answer'>
          <label for='hl2'>hl2</label>
          <input type='checkbox' id='hl2' name='hl2' value='0' hx-trigger='change,load' hx-get='/hl2' hx-target='#hl2v'>
          <span id='hl2v'></span>
          <label for='d2'>d2</label>                                                                            
          <input type='radio' id='d2' name='d' value='2' hx-trigger='change' hx-get='/d' hx-target='#d'>
        </fieldset>
      </div>
      <div>
        <fieldset class='single'>
          <label for='thrd'>3rd</label>
          <input type='radio' id='thrd' name='no' value='3' hx-trigger='change' hx-get='/no' hx-target='#answer'>
          <label for='hl3'>hl3</label>                                                                           
          <input type='checkbox' id='hl3' name='hl3' value='0' hx-trigger='change,load' hx-get='/hl3' hx-target='#hl3v'>
          <span id='hl3v'></span>
          <label for='d3'>d3</label>
          <input type='radio' id='d3' name='d' value='3' hx-trigger='change' hx-get='/d' hx-target='#d'>
        </fieldset>
      </div>
      <div>
        <fieldset class='single'>
          <label for='frth'>4th</label>
          <input type='radio' id='frth' name='no' value='4' hx-trigger='change' hx-get='/no' hx-target='#answer'>
          <label for='hl4'>hl4</label>                                                                                           
          <input type='checkbox' id='hl4' name='hl4' value='0' hx-trigger='change,load' hx-get='/hl4' hx-target='#hl4v'>
          <span id='hl4v'></span>
          <label for='d4'>d4</label>
          <input type='radio' id='d4' name='d' value='4' hx-trigger='change' hx-get='/d' hx-target='#d'>
        </fieldset>
      </div>
      <div>
        <fieldset class='single'>
          <label for='ffth'>5th</label>
          <input type='radio' id='ffth' name='no' value='5' hx-trigger='change' hx-get='/no' hx-target='#answer'>
          <label for='hl5'>hl5</label>                                                                           
          <input type='checkbox' id='hl5' name='hl5' value='0' hx-trigger='change,load' hx-get='/hl5' hx-target='#hl5v'>
          <span id='hl5v'></span>                                                                                             
          <label for='d5'>d5</label>                                                                                    
          <input type='radio' id='d5' name='d' value='5' hx-trigger='change' hx-get='/d' hx-target='#d'>
        </fieldset>
      </div>
      <div>
        <fieldset class='single'>
          fine tunning
          <button onclick='finetminus()'>-</button>
          <button onclick='finetplus()'>+</button>
        </fieldset> 
      </div>
    </div>
    <div> 
      <span>selected no: </span><span id='answer'></span> <span>selected </span><span id='d'>d</span>
    </div>
    <div>
      <fieldset class='single'>
        <legend>relay feedback</legend>
        <label for='rly'>relay</label>
        <input type='checkbox' id='rly' name='rly' value='on' hx-trigger='change, load' hx-get='/rly' hx-target='#relayindicator'>
        <span id='relayindicator'></span>
        <label for='rlyon'>relay on</label>        
        <input type='range' min='50' max='200' step='1' id='rlyon' name='rlyon' hx-trigger='change, load' hx-get='/rlyon' hx-target='#relayonv'>
        <input type='radio' name='finet' value='rlyon'>
        <span id='relayonv'></span>
        <label for='rlyoff'>relay off</label>
        <input type='range' min='50' max='200' step='1' id='rlyoff' name='rlyoff' hx-trigger='change, load' hx-get='/rlyoff' hx-target='#relayoffv'>
        <input type='radio' name='finet' value='rlyoff'>
        <span id='relayoffv'></span>
        <label for='rlyonv''>relay on value</label>
        <input type='range' min='50' max='200' step='1' id='rlyonv' name='rlyonv' hx-trigger='change, load' hx-get='/rlyonv' hx-target='#relayonvl'> 
        <input type='radio' name='finet' value='rlyonv'>
        <span id='relayonvl'></span> 
        <label for='rlyoffv''>relay off value</label>
        <input type='range' min='50' max='200' step='1' id='rlyoffv' name='rlyoffv' hx-trigger='change, load' hx-get='rlyoffv' hx-target='#relayoffvl'>
        <input type='radio' name='finet' value='rlyoffv'>
        <span id='relayoffvl'></span> 
      </fieldset>
    </div>
    <div class='flex-container'>
      <div>
        <fieldset class='single'>
          <legend>sampling period (mS)</legend>
          <input type='range' id='per' name='per' min='10' max='100' step='5' hx-trigger='change, load' hx-get='/per' hx-target='#period'>
          <input type='radio' name='finet' value='per' class='finet'>  
          <span id='period'></span>
        </fieldset>
      </div>
      <div>
        <fieldset class='single'>
          <legend>samples no</legend>
          <input type='range' id='smpls' name='smpls' min='10' max='2000' step='10' hx-trigger='change, load' hx-get='/smpls' hx-target='#samples'>
          <input type='radio' name='finet' value='smpls' class='finet'>
          <span id='samples' class='finet'></span>
        </fieldset>
      </div>  
      <div>
        <fieldset class='single'>
          <legend>input level DA</legend>
          <input type='range' id='lvl' name='lvl' min='0' max='255' step='1' hx-trigger='change, load' hx-get='/lvl' hx-target='#level'>
          <input type='radio' name='finet' value='lvl' class='finet'>
          <span id='level'></span>
        </fieldset>
      </div>
<!--
      <div>
        <fieldset class='single'>
          <legend>pwm channels</legend>
          <select id='pwm' name='pwm' hx-trigger='change, load' hx-get='/pwm' hx-target='#pwmchnl'>
            <option value='3' selected>3 - 980Hz</option>
            <option value='5'>5 - 490Hz</option>
            <option value='6'>6 - 490Hz</option>
            <option value='9'>9 - 490Hz</option>
            <option value='10'>10 - 490Hz</option>
            <option value='11'>11 - 980Hz</option>
            <option value='13'>13 - 490Hz</option>
          </select>
          <span id='pwmchnl'></span>
        </fieldset>
      </div>
-->
      <div>
        <fieldset>
          <legend>kp</legend>
          <input type='range' id='kp' name='kp' min='0' max='50' step='0.1' hx-trigger='change, load' hx-get='/kp' hx-target='#kpv'>
          <input type='radio' name='finet' value='kp' class='finet'>
          <span id='kpv'></span>
        </fieldset>
      </div>
      <div>
        <fieldset>
          <legend>ki</legend>
          <input type='range' id='ki' name='ki' min='0' max='10' step='0.01' hx-trigger='change, load' hx-get='/ki' hx-target='#kiv'>
          <input type='radio' name='finet' value='ki' class='finet'>
          <span id='kiv'></span>
        </fieldset> 
      </div>
      <div>
        <fieldset>
          <legend>kd</legend>
          <input type='range' id='kd' name='kd' min='0' max='10' step='0.01' hx-trigger='change, load'' hx-get='/kd' hx-target='#kdv'>
          <input type='radio' name='finet' value='kd' class='finet'>
          <span id='kdv'></span>
        </fieldset>
      </div>
      <div>
        <fieldset>
          <legend>disturbance settings</legend>
          start time
          <input type='range' id='dstrbstart' name='dstrbstart' min='0' max='100' step='1' hx-trigger='change, load' hx-get='/dstrbstart' hx-target='#disturbancestart'>
          <input type='radio' name='finet' value='dstrbstart' class='finet'>
          <span id='disturbancestart'></span>%
          up
          <input type='radio' name='dstrbdir' value='up' class='finet' hx-trigger='change, load' hx-get='/dstrbdir' hx-target='#selectedir' checked>
          down
          <input type='radio' name='dstrbdir' value='down' class='finet' hx-trigger='change' hx-get='/dstrbdir' hx-target='#selectedir'>
          selected: 
          <span id='selectedir'></span>
        </fieldset>
      </div>
      <div>
        <fieldset>
          <legend>calibration</legend>
          <Label for='offst'>offset</label>
          <input type='range' id='offst' name='offst'  min='0' max='500' step='1' hx-trigger='change, load' hx-get='/offst' hx-target='#offset'>
          <input type='radio' name='finet' value='offst'>
          <span id='offset'></span>
          <label for='slp'>slope</label>
	  <input type='range' id='slp' name='slp' min='0' max='10' step='0.05' hx-trigger='change, load' hx-get='/slp' hx-target='#slope'>
          <input type='radio' name='finet' value='slp'>
          <span id='slope'></span>
        </fieldset>
      </div>
      <div>
        <fieldset>
          <legend>linear test</legend>
          <label for='lin'>linear</label>
          <input type='checkbox' id='lin' name='lin' value='1' hx-trigger='change, load' hx-get='/lin' hx-target='#linear'>
          <span id='linear'></span>
          <label for='corr'>correction</label>
          <input type='checkbox' id='corr' name='corr' value='1' hx-trigger='change, load' hx-get='/corr' hx-target='#correction'>
          <span id='correction'></span>
        </fieldset>
    </div>
    <script>
// *** fine tunning y = ax + b ***
      const a = 0.964261
      //const b = 14.20878
      const b = 12
      function finetplus()
      {
        let elmntid = document.querySelector('input[name="finet"]:checked').value;
        let elmnt = document.getElementById(elmntid);
        let max = Number(elmnt.max);
        let value = Number(elmnt.value);
        let step = Number(elmnt.step);
        if(value < max)
        {
          elmnt.value = value + step
          let chngevnt = new Event('change');
          elmnt.dispatchEvent(chngevnt);
	}
      }

      function finetminus()
      {
        let elmntid = document.querySelector('input[name="finet"]:checked').value;                                                                 
        let elmnt = document.getElementById(elmntid);                                                                                              
        let min = Number(elmnt.min);                                                                                                               
        let value = Number(elmnt.value);                                                                                                           
        let step = Number(elmnt.step);                                                                                                                                                                                                                         
        if(value > min)
        {                 
          elmnt.value = value - step                                                                                                               
          let chngevnt = new Event('change');                                                                                                      
          elmnt.dispatchEvent(chngevnt);                                                                                                           
        }  
      }
                                                                                                                                
      function displayChart()                                                                                                                
      {
        const frame = document.getElementById('frame')
        while(frame.hasChildNodes())
          frame.removeChild(frame.firstChild)                                                                                                                                      
        ctx = document.createElement('canvas')
        ctx.id = 'ctx' 
        frame.appendChild(ctx)                                                                                         
        let yaxis = document.getElementById('data').innerText
        yaxis = JSON.parse(yaxis)                                                                                                            
        let xaxis = []                                                                                                                           
        for(i = 0; i < yaxis.length; i++)
        {
          xaxis.push(i)
          //yaxis[i] -= b
          //yaxis[i] /= a
        }
        new Chart(ctx, {                                                                                                                     
          type: 'line',                                                                                                                      
            data: {                                                                                                                            
              labels: xaxis,                                                                                                                   
              datasets: [{                                                                                                                     
                label: 'RC chart',                                                                                                             
                data: yaxis,                                                                                                                   
                borderWidth: 1,
                pointBackgroundColor: 'rgba(0, 0, 0, 1)'
            }]                                                                                                                               
          },                                                                                                                                  
          options: {
            aspectRatio: 3,
	    plugins: {
              legend: {
                labels: {
                  color: 'black'
                }, 
                display: false
              }
            },                                                                                                                      
            scales: {                                                                                                                         
             y: {                                                                                                                            
                  beginAtZero: true                                                                                                          
                }                                                                                                                            
           }                                                                                                                                 
        }                                                                                                                                   
     })
     status.innerText = 'off';
  }

  function showstate()
  {
   let scnds = Math.floor(per.value * 0.001 * smpls.value);
   console.log(scnds);
   status.innerText = scnds;
   function pauza()
   {
     setTimeout(function(){
       status.innerText = --scnds;
       if(scnds > 0)
        pauza();
       else
        status.innerText = 'data transfer';
     },1000)
   }
   pauza()
  }                                                                                                                                       
 </script>   

    <p>
      <button hx-trigger='click' onclick='showstate()' name='strt' hx-get='/strt' hx-target='#data' hx-on::after-request='displayChart()'>start</button>
      experiment status: <span id='status'></span>
    </p>
  </fieldset>
  <input type='hidden' id='data'>
  <p>
    <div id='frame'></div>
  </p>
</div>
<script>

var blackwhite = function()
{
	document.body.style.backgroundColor = 'white';
	document.body.style.color='black';
	document.querySelector('#content').style.backgroundColor = 'white';
	document.querySelector('#content').style.color = 'black';
	let inputs = document.querySelectorAll('input');
	for (inp of inputs)
		inp.style.accentColor = 'black';
}

var blueyellow = function()
{
	document.body.style.backgroundColor = 'blue';
	document.body.style.color='white';
	document.querySelector('#content').style.backgroundColor = 'yellow';
	document.querySelector('#content').style.color = 'blue';	
	let inputs = document.querySelectorAll('input');
	for (inp of inputs)
		inp.style.accentColor = 'blue';
}

 let per = document.querySelector('#per')
 per.defaultValue = 50 
 let smpls = document.querySelector('#smpls')
 smpls.defaultValue = 100
 document.querySelector('#rlyon').defaultValue = 125
 document.querySelector('#rlyoff').defaultValue = 125
 document.querySelector('#rlyonv').defaultValue = 175
 document.querySelector('#rlyoffv').defaultValue = 75 
 document.querySelector('#lvl').defaultValue = 100
 document.querySelector('#kp').defaultValue = 0
 document.querySelector('#ki').defaultValue = 0
 document.querySelector('#kd').defaultValue = 0
 document.querySelector('#dstrbstart').defaultValue = 0
 document.querySelector('#offst').defaultValue = 1
 document.querySelector('#slp').defaultValue = 3.9
 let status = document.querySelector('#status')
 status.innerText = 'off'
</script>
