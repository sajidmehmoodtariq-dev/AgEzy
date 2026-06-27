$commonStyles = @"
    :root {
      --green-dark:#1a3d28; --green-mid:#1b7239; --green:#00ab4f;
      --orange:#f5a623; --red:#d63031; --blue:#2d5bd4;
      --text:#1a2a3a; --muted:#8898aa; --border:#eaeef2;
      --bg:#f4f6f4; --card:#fff;
    }
    *{box-sizing:border-box;margin:0;padding:0;}
    html,body{width:100%;height:100%;background:#e0e0e0;font-family:"Segoe UI",system-ui,sans-serif;overflow:hidden;}
    .viewport{position:fixed;inset:0;display:flex;align-items:center;justify-content:center;padding:16px;}
    .screen{width:390px;height:844px;transform:scale(var(--app-scale,1));transform-origin:center;background:var(--bg);border-radius:26px;overflow:hidden;box-shadow:0 28px 80px rgba(0,0,0,.22);display:flex;flex-direction:column;}

    .header{flex:0 0 auto;background:var(--green-dark);padding:14px 16px 14px;display:flex;align-items:center;gap:10px;}
    .h-back{width:34px;height:34px;border-radius:50%;display:flex;align-items:center;justify-content:center;cursor:pointer;border:none;background:rgba(255,255,255,.12);}
    .h-title{flex:1;font-size:17px;font-weight:800;color:#fff;letter-spacing:-.02em;}

    .body{flex:1;overflow-y:auto;padding:16px;scrollbar-width:none;}
    .body::-webkit-scrollbar{display:none;}

    .sec-title{font-size:11px;font-weight:800;color:var(--muted);text-transform:uppercase;letter-spacing:.08em;margin:16px 0 8px;}
    .sec-title:first-child{margin-top:0;}

    .field{background:var(--card);border-radius:14px;padding:14px;margin-bottom:10px;cursor:pointer;}
    .field-label{font-size:11px;font-weight:700;color:var(--muted);text-transform:uppercase;letter-spacing:.06em;margin-bottom:5px;}
    .field-row{display:flex;align-items:center;justify-content:space-between;}
    .field-val{font-size:15px;font-weight:600;color:var(--text);}
    .field-ph{color:var(--muted);font-weight:500;}
    .chev{color:var(--muted);}

    .two-col{display:grid;grid-template-columns:1fr 1fr;gap:10px;}

    .service-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:10px;margin-bottom:10px;}
    .svc-item{background:var(--card);border-radius:14px;padding:14px 8px 10px;display:flex;flex-direction:column;align-items:center;gap:8px;cursor:pointer;border:2px solid transparent;transition:all .15s;}
    .svc-item.active{border-color:var(--green-mid);background:#f0faf4;}
    .svc-item:active{transform:scale(.95);}
    .svc-ic{width:44px;height:44px;border-radius:50%;display:flex;align-items:center;justify-content:center;}
    .svc-ic.spray{background:#e4ecfd;} .svc-ic.hay{background:#fef3e2;} .svc-ic.harvest{background:#fdedf0;} .svc-ic.spread{background:#e8f5e9;} .svc-ic.other{background:#f3f4f6;}
    .svc-lbl{font-size:11px;font-weight:700;color:var(--text);text-align:center;}

    .op-row{display:flex;align-items:center;gap:12px;padding:10px 0;border-bottom:1px solid var(--border);}
    .op-row:last-of-type{border-bottom:none;}
    .op-av{width:38px;height:38px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:13px;font-weight:800;color:#fff;flex:0 0 38px;}
    .op-nm{font-size:14px;font-weight:700;color:var(--text);}
    .op-rl{font-size:12px;color:var(--muted);}
    .op-chk{width:24px;height:24px;border-radius:50%;border:2px solid var(--border);display:flex;align-items:center;justify-content:center;cursor:pointer;transition:all .15s;flex:0 0 24px;}
    .op-chk.on{background:var(--green-mid);border-color:var(--green-mid);}

    .mach-row{display:flex;align-items:center;gap:12px;padding:10px 0;border-bottom:1px solid var(--border);}
    .mach-row:last-of-type{border-bottom:none;}
    .mach-ic{width:38px;height:38px;border-radius:10px;background:#f0f4f0;display:flex;align-items:center;justify-content:center;flex:0 0 38px;}
    .mach-nm{font-size:14px;font-weight:700;color:var(--text);}
    .mach-sb{font-size:12px;color:var(--muted);}
    .avail-badge{padding:3px 10px;border-radius:12px;font-size:10px;font-weight:700;background:#e4f8ee;color:var(--green-mid);white-space:nowrap;}

    .add-row{display:flex;align-items:center;gap:8px;color:var(--green-mid);font-size:14px;font-weight:600;cursor:pointer;padding:10px 0;}

    .submit-btn{display:block;width:100%;padding:17px;border-radius:16px;background:var(--blue);color:#fff;font-size:16px;font-weight:800;text-align:center;cursor:pointer;border:none;margin-top:20px;margin-bottom:16px;transition:opacity .15s;}
    .submit-btn:active{opacity:.85;}
    
    .bottom-nav{flex:0 0 auto;height:70px;background:#fff;border-top:1px solid #e8ede8;display:flex;align-items:center;padding:0 10px;}
    .nav-item{flex:1;display:flex;flex-direction:column;align-items:center;justify-content:center;gap:3px;cursor:pointer;padding:4px;}
    .nav-ic{width:40px;height:40px;border-radius:50%;display:flex;align-items:center;justify-content:center;}
    .nav-ic.active{background:var(--green-dark);}
    .nav-lbl{font-size:10px;font-weight:600;color:var(--muted);}
    .nav-lbl.active{color:var(--green-dark);}
    
    .review-summary { background: #fff; border-radius: 14px; padding: 16px; border: 1px solid var(--border); margin-bottom: 12px;}
    .rs-row { display: flex; justify-content: space-between; padding: 10px 0; border-bottom: 1px dashed var(--border); }
    .rs-row:last-child { border-bottom: none; }
    .rs-label { color: var(--muted); font-size: 13px; font-weight: 600; }
    .rs-value { color: var(--text); font-size: 14px; font-weight: 700; text-align: right; }
    
    /* PROGRESS BAR */
    .progress-bar { height: 4px; background: var(--green-dark); width: 100%; position: relative; }
    .progress-bar .fill { height: 100%; background: var(--green); position: absolute; left: 0; top: 0; transition: width 0.3s; }

    @media(max-width:767px){.viewport{padding:0}.screen{width:390px;height:844px;border-radius:0;box-shadow:none}}
"@

$bottomNav = @"
          <!-- BOTTOM NAV (Solid Bar Style) -->
            <style id="unified-nav-style">
      #unified-nav.bottom-nav {
        flex: 0 0 auto;
        height: 70px;
        background: #fff;
        border-top: 1px solid #e8ede8;
        display: flex; align-items: center; justify-content: space-around;
        padding: 0 10px; gap: 5px;
        margin-top: auto; z-index: 100;
        position: relative;
      }
      #unified-nav .nav-item {
        flex: 1; display: flex; flex-direction: column;
        align-items: center; justify-content: center; gap: 4px;
        cursor: pointer; padding: 6px 4px; border: none; background: transparent; text-decoration: none;
      }
      #unified-nav .nav-icon {
        width: 44px; height: 44px;
        display: flex; align-items: center; justify-content: center;
        border-radius: 50%;
      }
      #unified-nav .nav-icon.active { background: var(--green-dark, #1b7239); }
      #unified-nav .nav-icon img, #unified-nav .nav-icon svg { width: 22px; height: 22px; opacity: 0.8; }
      #unified-nav .nav-icon.active img { filter: brightness(0) invert(1) !important; opacity: 1; }
      #unified-nav .nav-icon.active svg { stroke: #fff !important; opacity: 1; }
      #unified-nav .nav-label { font-size: 9px; font-weight: 600; color: var(--muted, #8898aa); text-align: center; line-height: 1.1; white-space: nowrap; margin: 0; }
      #unified-nav .nav-item.active .nav-label { color: var(--green-dark, #1b7239); }
    </style>
    <nav id="unified-nav" class="bottom-nav">
      <!-- Home -->
      <div class="nav-item " onclick="window.location.href='dashboard.html'">
        <div class="nav-icon "><img src="images/nav-home.png" alt="Home" /></div>
        <div class="nav-label">Home</div>
      </div>
      <!-- Contracting -->
      <div class="nav-item active" onclick="window.location.href='jobs-hub.html'">
        <div class="nav-icon active"><img src="images/nav-contract-work.png" alt="Contracting" /></div>
        <div class="nav-label">Contracting</div>
      </div>
      <!-- Stock On Hand -->
      <div class="nav-item " onclick="window.location.href='contracts-list.html'">
        <div class="nav-icon "><img src="images/nav-contracts.png" alt="Stock On Hand" style="filter:invert(30%) sepia(0%) saturate(0%) brightness(60%); width:auto; object-fit:contain;" /></div>
        <div class="nav-label">Stock On Hand</div>
      </div>
      <!-- Timesheets -->
      <div class="nav-item " onclick="window.location.href='timesheets-list.html'">
        <div class="nav-icon "><svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#8898aa" stroke-width="2"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg></div>
        <div class="nav-label">Timesheets</div>
      </div>
      <!-- Map -->
      <div class="nav-item " onclick="window.location.href='farm-map.html'">
        <div class="nav-icon "><svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#8898aa" stroke-width="2"><polygon points="1 6 1 22 8 18 16 22 23 18 23 2 16 6 8 2 1 6"/><line x1="8" y1="2" x2="8" y2="18"/><line x1="16" y1="6" x2="16" y2="22"/></svg></div>
        <div class="nav-label">Map</div>
      </div>
    </nav>
"@

$commonScript = @"
<script>
  const baseW=390,baseH=844,pad=32;
  const scale=()=>{const s=Math.min((innerWidth-pad)/baseW,(innerHeight-pad)/baseH,1);document.documentElement.style.setProperty('--app-scale',s.toFixed(4));};
  scale();addEventListener('resize',scale);
</script>
"@

$step1 = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
  <title>AgEzy – Start New Job</title>
  <style>
$commonStyles
  </style>
</head>
<body>
<div class="viewport"><main class="screen">

  <header class="header">
    <button class="h-back" onclick="history.back()">
      <svg width="20" height="20" viewBox="0 0 24 24" fill="none"><path d="M19 12H5M12 5l-7 7 7 7" stroke="#fff" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/></svg>
    </button>
    <div class="h-title">Start New Job</div>
  </header>
  <div class="progress-bar"><div class="fill" style="width: 33%;"></div></div>

  <div class="body">
    <div class="sec-title">Step 1: Select Service Type</div>

    <div class="service-grid">
      <div class="svc-item" data-type="spray">
        <div class="svc-ic spray">
          <svg width="22" height="22" viewBox="0 0 24 24" fill="none"><path d="M3 12h12" stroke="#2d5bd4" stroke-width="2" stroke-linecap="round"/><path d="M15 8l4 4-4 4" stroke="#2d5bd4" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><circle cx="5" cy="12" r="2" fill="#2d5bd4"/></svg>
        </div>
        <div class="svc-lbl">Spraying</div>
      </div>
      <div class="svc-item active" data-type="hay">
        <div class="svc-ic hay">
          <svg width="22" height="22" viewBox="0 0 24 24" fill="none"><rect x="3" y="13" width="18" height="7" rx="2" stroke="#f5a623" stroke-width="2"/><path d="M7 13V9a5 5 0 0 1 10 0v4" stroke="#f5a623" stroke-width="2" stroke-linecap="round"/></svg>
        </div>
        <div class="svc-lbl">Haymaking</div>
      </div>
      <div class="svc-item" data-type="harvest">
        <div class="svc-ic harvest">
          <svg width="22" height="22" viewBox="0 0 24 24" fill="none"><path d="M12 2L4 10h5v11h6V10h5L12 2z" stroke="#d63031" stroke-width="2" stroke-linejoin="round"/></svg>
        </div>
        <div class="svc-lbl">Harvesting</div>
      </div>
      <div class="svc-item" data-type="spread">
        <div class="svc-ic spread">
          <svg width="22" height="22" viewBox="0 0 24 24" fill="none"><circle cx="12" cy="12" r="3" fill="#1b7239"/><path d="M12 2v3M12 19v3M2 12h3M19 12h3M4.93 4.93l2.12 2.12M16.95 16.95l2.12 2.12M4.93 19.07l2.12-2.12M16.95 7.05l2.12-2.12" stroke="#1b7239" stroke-width="2" stroke-linecap="round"/></svg>
        </div>
        <div class="svc-lbl">Spreading</div>
      </div>
      <div class="svc-item" data-type="other">
        <div class="svc-ic other">
          <svg width="22" height="22" viewBox="0 0 24 24" fill="none"><circle cx="12" cy="12" r="2" fill="#8898aa"/><circle cx="5" cy="12" r="2" fill="#8898aa"/><circle cx="19" cy="12" r="2" fill="#8898aa"/></svg>
        </div>
        <div class="svc-lbl">Others</div>
      </div>
    </div>

    <div class="field" onclick="cycleSubType(this)">
      <div class="field-label">Sub-Type</div>
      <div class="field-row">
        <span class="field-val" id="fSubType">Cutting</span>
        <span class="chev"><svg width="16" height="16" viewBox="0 0 24 24" fill="none"><path d="M6 9l6 6 6-6" stroke="#8898aa" stroke-width="2.2" stroke-linecap="round"/></svg></span>
      </div>
    </div>

    <button class="submit-btn" onclick="nextStep()">Next: Enter Details &rarr;</button>
  </div>
$bottomNav
</main></div>
$commonScript
<script>
  const subTypes={spray:['Boom Spray','Aerial Spray','Strip Spray'],hay:['Cutting','Raking','Baling','Wrapping'],harvest:['Header Harvest','Strip Till','Direct Drill'],spread:['Broadcast','Band','Foliar'],other:['Custom']};
  let selectedType='hay'; let subIdx=0;

  document.querySelectorAll('.svc-item').forEach(item=>{
    item.addEventListener('click',()=>{
      document.querySelectorAll('.svc-item').forEach(x=>x.classList.remove('active'));
      item.classList.add('active');
      selectedType=item.dataset.type;
      subIdx=0;
      document.getElementById('fSubType').textContent=subTypes[selectedType][0];
    });
  });

  function cycleSubType(){
    const list=subTypes[selectedType]||['Custom'];
    subIdx=(subIdx+1)%list.length;
    document.getElementById('fSubType').textContent=list[subIdx];
  }
  
  function nextStep() {
    sessionStorage.setItem('jobType', selectedType);
    sessionStorage.setItem('jobSubType', document.getElementById('fSubType').textContent);
    sessionStorage.setItem('jobTitle', document.querySelector('.svc-item.active .svc-lbl').textContent);
    window.location.href = 'create-job-details.html';
  }
</script>
</body></html>
"@

$step2 = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
  <title>AgEzy – Enter Details</title>
  <style>
$commonStyles
  </style>
</head>
<body>
<div class="viewport"><main class="screen">

  <header class="header">
    <button class="h-back" onclick="history.back()">
      <svg width="20" height="20" viewBox="0 0 24 24" fill="none"><path d="M19 12H5M12 5l-7 7 7 7" stroke="#fff" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/></svg>
    </button>
    <div class="h-title">Enter Details</div>
  </header>
  <div class="progress-bar"><div class="fill" style="width: 66%;"></div></div>

  <div class="body">

    <div class="sec-title">Step 2: Customer & Schedule</div>

    <div class="field" onclick="tapField(this,'Green Valley Farms')">
      <div class="field-label">Customer</div>
      <div class="field-row">
        <span class="field-val field-ph" id="fCustomer">Select customer…</span>
        <span class="chev"><svg width="16" height="16" viewBox="0 0 24 24" fill="none"><path d="M6 9l6 6 6-6" stroke="#8898aa" stroke-width="2.2" stroke-linecap="round"/></svg></span>
      </div>
    </div>

    <div class="field" onclick="tapField(this,'Green Acres Farm – Block C')">
      <div class="field-label">Property / Farm</div>
      <div class="field-row">
        <span class="field-val field-ph" id="fProperty">Select property…</span>
        <span class="chev"><svg width="16" height="16" viewBox="0 0 24 24" fill="none"><path d="M6 9l6 6 6-6" stroke="#8898aa" stroke-width="2.2" stroke-linecap="round"/></svg></span>
      </div>
    </div>

    <div class="two-col">
      <div class="field" onclick="tapField(this,'Oct 25, 2023')">
        <div class="field-label">Start Date</div>
        <div class="field-val" style="font-size:14px">Oct 24, 2023</div>
      </div>
      <div class="field" onclick="tapField(this,'08:00 AM')">
        <div class="field-label">Start Time</div>
        <div class="field-val" style="font-size:14px">07:30 AM</div>
      </div>
    </div>
    
    <div class="sec-title">Resources</div>

    <div class="field">
      <div class="mach-row">
        <div class="mach-ic">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none"><rect x="2" y="11" width="20" height="9" rx="2" stroke="#8898aa" stroke-width="2"/><path d="M6 11V7a6 6 0 0 1 12 0v4" stroke="#8898aa" stroke-width="2" stroke-linecap="round"/><circle cx="7" cy="20" r="1.5" fill="#8898aa"/><circle cx="17" cy="20" r="1.5" fill="#8898aa"/></svg>
        </div>
        <div style="flex:1">
          <div class="mach-nm">Big Red Harvester</div>
          <div class="mach-sb">Header 40ft · Reg: ABC-123</div>
        </div>
        <div class="avail-badge">Available</div>
      </div>
      <div class="add-row">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none"><circle cx="12" cy="12" r="10" stroke="#1b7239" stroke-width="2"/><path d="M12 8v8M8 12h8" stroke="#1b7239" stroke-width="2" stroke-linecap="round"/></svg>
        Add Machinery
      </div>
    </div>

    <div class="field">
      <div class="op-row">
        <div class="op-av" style="background:#1b7239">JG</div>
        <div style="flex:1"><div class="op-nm">John G.</div><div class="op-rl">Lead Operator</div></div>
        <div class="op-chk on" data-op="0">
          <svg width="12" height="12" viewBox="0 0 24 24" fill="none"><path d="M5 13l4 4L19 7" stroke="#fff" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/></svg>
        </div>
      </div>
      <div class="add-row">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none"><circle cx="12" cy="12" r="10" stroke="#1b7239" stroke-width="2"/><path d="M12 8v8M8 12h8" stroke="#1b7239" stroke-width="2" stroke-linecap="round"/></svg>
        Add Operator
      </div>
    </div>

    <button class="submit-btn" onclick="nextStep()">Next: Review & Confirm &rarr;</button>
  </div>
$bottomNav
</main></div>
$commonScript
<script>
  function tapField(el,val){
    const span=el.querySelector('.field-val,.field-ph');
    if(span){span.textContent=val;span.classList.remove('field-ph');}
  }

  document.querySelectorAll('.op-chk').forEach(btn=>{
    btn.addEventListener('click',()=>{
      const on=btn.classList.toggle('on');
      btn.innerHTML=on?'<svg width="12" height="12" viewBox="0 0 24 24" fill="none"><path d="M5 13l4 4L19 7" stroke="#fff" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/></svg>':'';
    });
  });
  
  function nextStep() {
    sessionStorage.setItem('jobCustomer', document.getElementById('fCustomer').textContent);
    sessionStorage.setItem('jobLocation', document.getElementById('fProperty').textContent);
    window.location.href = 'create-job-review.html';
  }
</script>
</body></html>
"@

$step3 = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
  <title>AgEzy – Review</title>
  <style>
$commonStyles
  </style>
</head>
<body>
<div class="viewport"><main class="screen">

  <header class="header">
    <button class="h-back" onclick="history.back()">
      <svg width="20" height="20" viewBox="0 0 24 24" fill="none"><path d="M19 12H5M12 5l-7 7 7 7" stroke="#fff" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/></svg>
    </button>
    <div class="h-title">Review & Confirm</div>
  </header>
  <div class="progress-bar"><div class="fill" style="width: 100%;"></div></div>

  <div class="body">
    <div class="sec-title">Step 3: Job Summary</div>

    <div class="review-summary">
      <div class="rs-row">
        <div class="rs-label">Service Type</div>
        <div class="rs-value" id="sTitle">Haymaking (Cutting)</div>
      </div>
      <div class="rs-row">
        <div class="rs-label">Customer</div>
        <div class="rs-value" id="sCust">Green Valley Farms</div>
      </div>
      <div class="rs-row">
        <div class="rs-label">Location</div>
        <div class="rs-value" id="sLoc">Green Acres Farm – Block C</div>
      </div>
      <div class="rs-row">
        <div class="rs-label">Schedule</div>
        <div class="rs-value">Oct 24, 07:30 AM</div>
      </div>
      <div class="rs-row">
        <div class="rs-label">Resources</div>
        <div class="rs-value">1 Machine, 1 Operator</div>
      </div>
      <div class="rs-row">
        <div class="rs-label">Estimated Value</div>
        <div class="rs-value" style="color:var(--green-mid);">$1,250.00</div>
      </div>
    </div>
    
    <div class="sec-title">Job Notes</div>
    <div class="field">
      <textarea style="width:100%;border:none;background:none;font-size:14px;font-family:inherit;color:var(--text);resize:none;height:70px;outline:none;line-height:1.5" placeholder="Add any relevant notes or instructions…"></textarea>
    </div>

    <button class="submit-btn" onclick="createJob()">Create Job</button>
  </div>
$bottomNav
</main></div>
$commonScript
<script>
  window.onload = () => {
    const title = sessionStorage.getItem('jobTitle') || 'Haymaking';
    const subType = sessionStorage.getItem('jobSubType') || 'Cutting';
    document.getElementById('sTitle').textContent = title + ' (' + subType + ')';
    
    const cust = sessionStorage.getItem('jobCustomer');
    if(cust && cust !== 'Select customer…') document.getElementById('sCust').textContent = cust;
    const loc = sessionStorage.getItem('jobLocation');
    if(loc && loc !== 'Select property…') document.getElementById('sLoc').textContent = loc;
  };

  function createJob(){
    sessionStorage.setItem('jobId','JOB-2025-'+(Math.floor(Math.random()*900)+100));
    sessionStorage.setItem('jobStatus','scheduled');
    window.location.href='job-detail.html';
  }
</script>
</body></html>
"@

Set-Content -Path "create-job.html" -Value $step1 -NoNewline
Set-Content -Path "create-job-details.html" -Value $step2 -NoNewline
Set-Content -Path "create-job-review.html" -Value $step3 -NoNewline

Write-Host "Created 3-step job creation flow."
