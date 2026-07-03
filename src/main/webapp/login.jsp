<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FirstSmile | Login</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
  margin:0;
  padding:0;
  box-sizing:border-box;
  font-family:'Poppins',sans-serif;
}

body{
  min-height:100vh;
  display:flex;
  justify-content:center;
  align-items:center;
  overflow-x:hidden;
  overflow-y:auto;
  background:linear-gradient(135deg,#ffffff,#fff7fb,#f2fcff);
  position:relative;
  padding:20px;
}

/* Floating decorative circles */

.circle{
  position:absolute;
  border-radius:50%;
  opacity:.35;
  animation:float 7s ease-in-out infinite;
  pointer-events:none;
}

.c1{ width:170px; height:170px; background:#7de3ff; top:-60px; left:-60px; }
.c2{ width:130px; height:130px; background:#ffc8df; bottom:-40px; right:80px; animation-delay:1s; }
.c3{ width:90px; height:90px; background:#ffe8a8; right:250px; top:120px; animation-delay:2s; }
.c4{ width:60px; height:60px; background:#c8ffd4; left:120px; bottom:60px; animation-delay:1.6s; }
.c5{ width:45px; height:45px; background:#d8c8ff; right:60px; top:260px; animation-delay:.5s; }

@keyframes float{
  0%,100%{ transform:translateY(0px) translateX(0px); }
  50%{ transform:translateY(-18px) translateX(6px); }
}

/* gentle floating sparkles drawn with JS-positioned spans */
.sparkle{
  position:absolute;
  font-size:14px;
  opacity:0;
  pointer-events:none;
  animation:sparkleAnim 2.6s ease-in-out infinite;
}

@keyframes sparkleAnim{
  0%{ opacity:0; transform:translateY(0) scale(.6) rotate(0deg); }
  20%{ opacity:.8; }
  100%{ opacity:0; transform:translateY(-60px) scale(1.1) rotate(40deg); }
}

/* Card */

.container{
  width:1000px;
  max-width:95vw;
  min-height:580px;
  display:flex;
  background:rgba(255,255,255,.55);
  backdrop-filter:blur(20px);
  border-radius:35px;
  box-shadow:0 20px 50px rgba(0,0,0,.08);
  overflow:hidden;
  position:relative;
  opacity:0;
  transform:translateY(24px) scale(.98);
  animation:cardIn .8s cubic-bezier(.16,1,.3,1) forwards;
}

@keyframes cardIn{
  to{ opacity:1; transform:translateY(0) scale(1); }
}

/* subtle animated border glow */
.container::before{
  content:"";
  position:absolute;
  inset:0;
  border-radius:35px;
  padding:2px;
  background:linear-gradient(120deg,#7de3ff,#ffc8df,#ffe8a8,#7de3ff);
  background-size:300% 300%;
  -webkit-mask:linear-gradient(#fff 0 0) content-box, linear-gradient(#fff 0 0);
  -webkit-mask-composite:xor;
  mask-composite:exclude;
  opacity:.25;
  animation:borderShift 6s linear infinite;
  pointer-events:none;
}

@keyframes borderShift{
  0%{ background-position:0% 50%; }
  100%{ background-position:300% 50%; }
}

/* Left */

.left{
  width:55%;
  display:flex;
  justify-content:center;
  align-items:center;
  flex-direction:column;
  padding:50px;
  background:linear-gradient(135deg,#ffffff,#fff7fd);
  position:relative;
}

.logo{
  font-size:42px;
  font-weight:700;
  margin-bottom:25px;
  display:flex;
  align-items:center;
  gap:2px;
}

.logo span:nth-child(1){ color:#ff82b6; }
.logo span:nth-child(2){ color:#12c7ff; }

.logo .emoji-inline{
  display:inline-block;
  animation:wiggle 3s ease-in-out infinite;
}

@keyframes wiggle{
  0%,100%{ transform:rotate(0deg); }
  10%{ transform:rotate(12deg); }
  20%{ transform:rotate(-8deg); }
  30%{ transform:rotate(0deg); }
}

.tag{
  font-size:18px;
  color:#666;
  text-align:center;
  line-height:30px;
  margin-bottom:45px;
  opacity:0;
  animation:fadeUp .8s ease forwards .3s;
}

@keyframes fadeUp{
  from{ opacity:0; transform:translateY(10px); }
  to{ opacity:1; transform:translateY(0); }
}

.emoji{
  font-size:140px;
  animation:bounce 2.4s ease-in-out infinite;
  cursor:pointer;
  transition:filter .3s;
  user-select:none;
}

.emoji:hover{
  filter:drop-shadow(0 10px 15px rgba(18,199,255,.35));
}

.emoji:active{
  animation:none;
  transform:scale(.85) rotate(-8deg);
}

@keyframes bounce{
  0%,100%{ transform:translateY(0) rotate(0deg); }
  50%{ transform:translateY(-14px) rotate(3deg); }
}

.badge-row{
  display:flex;
  gap:10px;
  margin-top:20px;
  flex-wrap:wrap;
  justify-content:center;
}

.badge{
  font-size:12px;
  font-weight:500;
  color:#666;
  background:white;
  padding:6px 14px;
  border-radius:20px;
  box-shadow:0 4px 12px rgba(0,0,0,.05);
  display:flex;
  align-items:center;
  gap:5px;
  opacity:0;
  animation:fadeUp .6s ease forwards;
}

.badge:nth-child(1){ animation-delay:.5s; }
.badge:nth-child(2){ animation-delay:.65s; }
.badge:nth-child(3){ animation-delay:.8s; }

/* Right */

.right{
  width:45%;
  display:flex;
  justify-content:center;
  align-items:center;
  padding:40px;
  position:relative;
}

.form{
  width:100%;
  max-width:380px;
  margin:0 auto;
  opacity:0;
  animation:fadeUp .8s ease forwards .2s;
}

.form h1{
  font-size:36px;
  line-height:1.15;
  color:#444;
  margin:0 0 10px 0;
}

.form p.subtitle{
  color:#777;
  margin-bottom:35px;
}

.input{
  margin-bottom:22px;
  position:relative;
}

.input label{
  display:block;
  font-size:14px;
  margin-bottom:8px;
  color:#666;
  transition:color .25s;
}

.input-wrap{
  position:relative;
  display:flex;
  align-items:center;
}

.input input{
  width:100%;
  padding:16px 44px 16px 16px;
  border:1.5px solid transparent;
  outline:none;
  border-radius:14px;
  background:#f7f9fc;
  font-size:15px;
  transition:.3s;
}

.input input::placeholder{
  color:#aab2c0;
}

.input input:focus{
  background:white;
  border-color:#12c7ff;
  box-shadow:0 0 0 4px rgba(18,199,255,.15);
}

.input.has-error input{
  border-color:#ff6b81;
  box-shadow:0 0 0 4px rgba(255,107,129,.12);
  animation:shake .35s;
}

@keyframes shake{
  0%,100%{ transform:translateX(0); }
  25%{ transform:translateX(-6px); }
  75%{ transform:translateX(6px); }
}

.error-text{
  font-size:12.5px;
  color:#ff6b81;
  margin-top:6px;
  display:none;
  font-weight:500;
}

.input.has-error .error-text{ display:block; }

.input-icon{
  position:absolute;
  right:14px;
  font-size:17px;
  color:#9aa3b2;
  cursor:pointer;
  user-select:none;
  transition:color .2s, transform .2s;
}

.input-icon:hover{
  color:#12c7ff;
}

.status-icon{
  position:absolute;
  right:14px;
  font-size:15px;
  opacity:0;
  transition:opacity .25s, transform .25s;
  transform:scale(.5);
  pointer-events:none;
}

.status-icon.show{
  opacity:1;
  transform:scale(1);
}

.status-icon.valid{ color:#27c98a; }

/* strength meter */
.strength-meter{
  height:4px;
  border-radius:4px;
  background:#eef1f6;
  margin-top:8px;
  overflow:hidden;
  display:none;
}

.input.password-active .strength-meter{ display:block; }

.strength-bar{
  height:100%;
  width:0%;
  border-radius:4px;
  background:#ff6b81;
  transition:width .35s ease, background .35s ease;
}

.row{
  display:flex;
  justify-content:space-between;
  align-items:center;
  font-size:14px;
  margin-bottom:30px;
}

.row label{
  display:flex;
  align-items:center;
  gap:8px;
  cursor:pointer;
  color:#666;
  user-select:none;
}

.checkbox{
  width:18px;
  height:18px;
  border-radius:6px;
  border:1.5px solid #d4d9e3;
  display:flex;
  align-items:center;
  justify-content:center;
  transition:.25s;
  flex-shrink:0;
}

.checkbox.checked{
  background:linear-gradient(135deg,#12c7ff,#29b6ff);
  border-color:transparent;
}

.checkbox svg{
  width:11px;
  height:11px;
  opacity:0;
  transform:scale(.5);
  transition:.2s;
}

.checkbox.checked svg{
  opacity:1;
  transform:scale(1);
}

.row a{
  text-decoration:none;
  color:#12c7ff;
  font-weight:500;
  position:relative;
}

.row a::after{
  content:"";
  position:absolute;
  left:0; bottom:-3px;
  width:0%;
  height:1.5px;
  background:#12c7ff;
  transition:width .25s;
}

.row a:hover::after{ width:100%; }

button{
  width:100%;
  padding:16px;
  border:none;
  border-radius:40px;
  font-size:17px;
  font-weight:600;
  cursor:pointer;
  background:linear-gradient(90deg,#10c9ff,#29b6ff);
  color:white;
  transition:transform .25s, box-shadow .25s;
  box-shadow:0 10px 25px rgba(18,199,255,.35);
  position:relative;
  overflow:hidden;
  isolation:isolate;
}

button span.btn-label{
  display:inline-flex;
  align-items:center;
  gap:8px;
  transition:opacity .2s;
}

button.loading span.btn-label{
  opacity:0;
}

.spinner{
  position:absolute;
  inset:0;
  display:flex;
  align-items:center;
  justify-content:center;
  opacity:0;
  transition:opacity .2s;
}

button.loading .spinner{
  opacity:1;
}

.spinner div{
  width:20px;
  height:20px;
  border:2.5px solid rgba(255,255,255,.4);
  border-top-color:white;
  border-radius:50%;
  animation:spin .7s linear infinite;
}

@keyframes spin{ to{ transform:rotate(360deg); } }

button:hover:not(:disabled){
  transform:translateY(-3px);
  box-shadow:0 14px 30px rgba(18,199,255,.45);
}

button:active:not(:disabled){
  transform:translateY(-1px) scale(.98);
}

button:disabled{
  cursor:default;
}

button.success{
  background:linear-gradient(90deg,#27c98a,#1fdc9d);
  box-shadow:0 10px 25px rgba(39,201,138,.35);
}

/* ripple effect */
.ripple{
  position:absolute;
  border-radius:50%;
  background:rgba(255,255,255,.55);
  transform:scale(0);
  animation:rippleAnim .6s ease-out;
  pointer-events:none;
}

@keyframes rippleAnim{
  to{ transform:scale(3); opacity:0; }
}

.or{
  text-align:center;
  margin:28px 0;
  color:#888;
  position:relative;
  font-size:13px;
}

.or::before, .or::after{
  content:"";
  position:absolute;
  top:50%;
  width:38%;
  height:1px;
  background:#e3e7ee;
}

.or::before{ left:0; }
.or::after{ right:0; }

.social{
  display:flex;
  gap:15px;
}

.social button{
  flex:1;
  background:white;
  color:#555;
  box-shadow:none;
  border:1.5px solid #eee;
  display:flex;
  align-items:center;
  justify-content:center;
  gap:8px;
  font-size:14px;
  font-weight:500;
}

.social button:hover{
  border-color:#12c7ff;
  background:#f7fdff;
  box-shadow:0 6px 16px rgba(18,199,255,.12);
}

.social button svg{
  width:18px;
  height:18px;
}

.signup{
  text-align:center;
  margin-top:30px;
  color:#666;
  font-size:14.5px;
}

.signup a{
  text-decoration:none;
  font-weight:600;
  color:#ff72aa;
  position:relative;
}

.signup a::after{
  content:"";
  position:absolute;
  left:0; bottom:-3px;
  width:0%;
  height:1.5px;
  background:#ff72aa;
  transition:width .25s;
}

.signup a:hover::after{ width:100%; }

/* toast */
.toast{
  position:fixed;
  top:24px;
  right:24px;
  background:white;
  padding:14px 20px;
  border-radius:14px;
  box-shadow:0 14px 35px rgba(0,0,0,.12);
  display:flex;
  align-items:center;
  gap:10px;
  font-size:14px;
  color:#444;
  transform:translateX(120%);
  transition:transform .4s cubic-bezier(.16,1,.3,1);
  z-index:999;
  border-left:4px solid #27c98a;
}

.toast.show{
  transform:translateX(0);
}

.toast.error{
  border-left-color:#ff6b81;
}

@media(max-width:900px){
  .container{
    flex-direction:column;
    height:auto;
    width:95%;
  }
  .left,.right{ width:100%; }
  .left{ padding:35px; }
  .logo{ font-size:34px; }
  .emoji{ font-size:90px; }
  .toast{ left:16px; right:16px; top:16px; }
}

</style>

</head>

<body>

<div class="circle c1"></div>
<div class="circle c2"></div>
<div class="circle c3"></div>
<div class="circle c4"></div>
<div class="circle c5"></div>

<div id="sparkleLayer"></div>

<div class="container" id="card">

  <div class="left">

    <div class="logo">
      <span>First</span><span>Smile</span><span class="emoji-inline">😊</span>
    </div>

    <p class="tag">
      Everything your little one needs.<br>
      Safe • Gentle • Trusted by Parents
    </p>

    <div class="emoji" id="bear" title="Click me!">🧸</div>

    <div class="badge-row">
      <div class="badge">🛡️ Safety Tested</div>
      <div class="badge">🚚 Fast Delivery</div>
      <div class="badge">⭐ 50k+ Parents</div>
    </div>

  </div>

  <div class="right">

    <div class="form">

      <h1>Welcome Back</h1>
      <p class="subtitle">Login to continue shopping for your little one.</p>

      <form id="loginForm" novalidate>

        <div class="input" id="emailField">
          <label for="email">Email Address</label>
          <div class="input-wrap">
            <input
              type="email"
              id="email"
              name="email"
              placeholder="Enter your email"
              autocomplete="email"
              required>
            <span class="status-icon" id="emailStatus">✓</span>
          </div>
          <div class="error-text">Please enter a valid email address.</div>
        </div>

        <div class="input" id="passwordField">
          <label for="password">Password</label>
          <div class="input-wrap">
            <input
              type="password"
              id="password"
              name="password"
              placeholder="Enter your password"
              autocomplete="current-password"
              required>
            <span class="input-icon" id="togglePassword">👁️</span>
          </div>
          <div class="error-text">Password must be at least 6 characters.</div>
          <div class="strength-meter"><div class="strength-bar" id="strengthBar"></div></div>
        </div>

        <div class="row">
          <label>
            <span class="checkbox" id="rememberBox">
              <svg viewBox="0 0 24 24" fill="none"><path d="M5 13l4 4L19 7" stroke="white" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/></svg>
            </span>
            Remember Me
          </label>
          <a href="#" id="forgotLink">Forgot Password?</a>
        </div>

        <button type="submit" id="loginBtn">
          <span class="btn-label">Login</span>
          <div class="spinner"><div></div></div>
        </button>

        <div class="or">OR</div>

        <div class="social">
          <button type="button" id="googleBtn">
            <svg viewBox="0 0 48 48"><path fill="#FFC107" d="M43.6 20.5H42V20H24v8h11.3C33.7 32.9 29.3 36 24 36c-6.6 0-12-5.4-12-12s5.4-12 12-12c3.1 0 5.8 1.1 8 3l6-6C34.4 5.1 29.5 3 24 3 12.4 3 3 12.4 3 24s9.4 21 21 21 21-9.4 21-21c0-1.2-.1-2.4-.4-3.5z"/><path fill="#FF3D00" d="M6.3 14.7l6.6 4.8C14.6 16 18.9 13 24 13c3.1 0 5.8 1.1 8 3l6-6C34.4 6.1 29.5 4 24 4 16 4 9.1 8.5 6.3 14.7z"/><path fill="#4CAF50" d="M24 44c5.4 0 10.3-2 14-5.5l-6.5-5.5C29.4 35 26.8 36 24 36c-5.3 0-9.7-3.1-11.3-7.6l-6.6 5C9 39.6 16 44 24 44z"/><path fill="#1976D2" d="M43.6 20.5H42V20H24v8h11.3c-.8 2.3-2.3 4.3-4.3 5.7l6.5 5.5C40.9 36.3 44 30.7 44 24c0-1.2-.1-2.4-.4-3.5z"/></svg>
            Google
          </button>
          <button type="button" id="fbBtn">
            <svg viewBox="0 0 24 24" fill="#1877F2"><path d="M22 12.06C22 6.5 17.52 2 12 2S2 6.5 2 12.06c0 5 3.66 9.16 8.44 9.94v-7.03H7.9v-2.91h2.54V9.84c0-2.5 1.49-3.89 3.78-3.89 1.1 0 2.24.2 2.24.2v2.46h-1.26c-1.24 0-1.63.77-1.63 1.56v1.88h2.78l-.44 2.91h-2.34V22c4.78-.78 8.44-4.94 8.44-9.94z"/></svg>
            Facebook
          </button>
        </div>

        <div class="signup">
          Don't have an account? <a href="signup.jsp">Create Account</a>
        </div>

      </form>

    </div>

  </div>

</div>

<div class="toast" id="toast">
  <span id="toastIcon">✅</span>
  <span id="toastMsg">Logged in successfully!</span>
</div>

<script>
// ---------- Sparkles around the teddy bear ----------
const bear = document.getElementById('bear');
const sparkleLayer = document.getElementById('sparkleLayer');
const sparkleChars = ['✨','💫','⭐'];

bear.addEventListener('click', () => {
  for (let i = 0; i < 6; i++) {
    const s = document.createElement('span');
    s.className = 'sparkle';
    s.textContent = sparkleChars[Math.floor(Math.random()*sparkleChars.length)];
    const rect = bear.getBoundingClientRect();
    s.style.left = (rect.left + rect.width/2 + (Math.random()*80-40)) + 'px';
    s.style.top = (rect.top + rect.height/2 + (Math.random()*40-20)) + 'px';
    s.style.animationDelay = (Math.random()*0.2) + 's';
    document.body.appendChild(s);
    setTimeout(() => s.remove(), 2800);
  }
});

// ---------- Custom checkbox ----------
const rememberBox = document.getElementById('rememberBox');
let remembered = false;
rememberBox.addEventListener('click', () => {
  remembered = !remembered;
  rememberBox.classList.toggle('checked', remembered);
});

// ---------- Password show/hide ----------
const passwordInput = document.getElementById('password');
const toggleBtn = document.getElementById('togglePassword');
toggleBtn.addEventListener('click', () => {
  const isPassword = passwordInput.type === 'password';
  passwordInput.type = isPassword ? 'text' : 'password';
  toggleBtn.textContent = isPassword ? '🙈' : '👁️';
});

// ---------- Email live validation ----------
const emailInput = document.getElementById('email');
const emailField = document.getElementById('emailField');
const emailStatus = document.getElementById('emailStatus');
const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

emailInput.addEventListener('input', () => {
  const valid = emailPattern.test(emailInput.value.trim());
  emailField.classList.remove('has-error');
  if (emailInput.value.trim().length === 0) {
    emailStatus.classList.remove('show');
  } else if (valid) {
    emailStatus.classList.add('show');
    emailStatus.classList.add('valid');
  } else {
    emailStatus.classList.remove('show');
  }
});

// ---------- Password strength meter ----------
const passwordField = document.getElementById('passwordField');
const strengthBar = document.getElementById('strengthBar');

passwordInput.addEventListener('focus', () => passwordField.classList.add('password-active'));
passwordInput.addEventListener('input', () => {
  passwordField.classList.remove('has-error');
  const val = passwordInput.value;
  let score = 0;
  if (val.length >= 6) score++;
  if (val.length >= 10) score++;
  if (/[A-Z]/.test(val) && /[0-9]/.test(val)) score++;
  if (/[^A-Za-z0-9]/.test(val)) score++;

  const pct = Math.min(100, (score / 4) * 100);
  strengthBar.style.width = (val.length === 0 ? 0 : Math.max(15, pct)) + '%';

  if (score <= 1) strengthBar.style.background = '#ff6b81';
  else if (score === 2) strengthBar.style.background = '#ffb648';
  else strengthBar.style.background = '#27c98a';
});

// ---------- Ripple effect on buttons ----------
document.querySelectorAll('button').forEach(btn => {
  btn.addEventListener('click', function(e) {
    const rect = btn.getBoundingClientRect();
    const ripple = document.createElement('span');
    const size = Math.max(rect.width, rect.height);
    ripple.className = 'ripple';
    ripple.style.width = ripple.style.height = size + 'px';
    ripple.style.left = (e.clientX - rect.left - size/2) + 'px';
    ripple.style.top = (e.clientY - rect.top - size/2) + 'px';
    btn.appendChild(ripple);
    setTimeout(() => ripple.remove(), 650);
  });
});

// ---------- Toast helper ----------
const toast = document.getElementById('toast');
const toastIcon = document.getElementById('toastIcon');
const toastMsg = document.getElementById('toastMsg');
let toastTimer;

function showToast(message, type = 'success') {
  clearTimeout(toastTimer);
  toast.classList.remove('error');
  if (type === 'error') {
    toast.classList.add('error');
    toastIcon.textContent = '⚠️';
  } else {
    toastIcon.textContent = '✅';
  }
  toastMsg.textContent = message;
  toast.classList.add('show');
  toastTimer = setTimeout(() => toast.classList.remove('show'), 3200);
}

// ---------- Form submit (demo / front-end only) ----------
const form = document.getElementById('loginForm');
const loginBtn = document.getElementById('loginBtn');
const btnLabel = loginBtn.querySelector('.btn-label');

form.addEventListener('submit', function(e) {
  e.preventDefault();

  let valid = true;

  if (!emailPattern.test(emailInput.value.trim())) {
    emailField.classList.add('has-error');
    valid = false;
  }
  if (passwordInput.value.length < 6) {
    passwordField.classList.add('password-active');
    passwordField.classList.add('has-error');
    valid = false;
  }

  if (!valid) {
    showToast('Please fix the highlighted fields.', 'error');
    return;
  }

  // simulate a network request
  loginBtn.classList.add('loading');
  loginBtn.disabled = true;

  setTimeout(() => {
    loginBtn.classList.remove('loading');
    loginBtn.classList.add('success');
    btnLabel.innerHTML = '✓ Welcome!';
    showToast('Logged in successfully! Redirecting…', 'success');

    setTimeout(() => {
      loginBtn.classList.remove('success');
      loginBtn.disabled = false;
      btnLabel.textContent = 'Login';
      // form.submit(); // uncomment to actually submit to the Login endpoint
    }, 1800);
  }, 1400);
});

// ---------- Social buttons (demo) ----------
document.getElementById('googleBtn').addEventListener('click', () => showToast('Connecting to Google…', 'success'));
document.getElementById('fbBtn').addEventListener('click', () => showToast('Connecting to Facebook…', 'success'));

// ---------- Forgot password (demo) ----------
document.getElementById('forgotLink').addEventListener('click', (e) => {
  e.preventDefault();
  showToast("A reset link would be sent to your email.", 'success');
});
</script>

</body>
</html>
