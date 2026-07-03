<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FirstSmile | Create Account</title>

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

/* Left panel */

.left{
  width:45%;
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
  font-size:17px;
  color:#666;
  text-align:center;
  line-height:30px;
  margin-bottom:40px;
  opacity:0;
  animation:fadeUp .8s ease forwards .3s;
}

@keyframes fadeUp{
  from{ opacity:0; transform:translateY(10px); }
  to{ opacity:1; transform:translateY(0); }
}

.emoji{
  font-size:130px;
  animation:bounce 2.4s ease-in-out infinite;
  cursor:pointer;
  transition:filter .3s;
  user-select:none;
}

.emoji:hover{
  filter:drop-shadow(0 10px 15px rgba(255,130,182,.35));
}

.emoji:active{
  animation:none;
  transform:scale(.85) rotate(-8deg);
}

@keyframes bounce{
  0%,100%{ transform:translateY(0) rotate(0deg); }
  50%{ transform:translateY(-14px) rotate(3deg); }
}

.steps{
  display:flex;
  flex-direction:column;
  gap:10px;
  margin-top:22px;
  width:100%;
}

.step{
  display:flex;
  align-items:center;
  gap:12px;
  background:white;
  border-radius:14px;
  padding:10px 16px;
  box-shadow:0 4px 12px rgba(0,0,0,.05);
  font-size:13px;
  color:#555;
  font-weight:500;
  opacity:0;
  animation:fadeUp .6s ease forwards;
}

.step:nth-child(1){ animation-delay:.5s; }
.step:nth-child(2){ animation-delay:.65s; }
.step:nth-child(3){ animation-delay:.8s; }

.step-num{
  width:26px;
  height:26px;
  border-radius:50%;
  background:linear-gradient(135deg,#ff82b6,#ff4d9e);
  color:white;
  font-size:12px;
  font-weight:700;
  display:flex;
  align-items:center;
  justify-content:center;
  flex-shrink:0;
}

/* Right panel — form */

.right{
  width:55%;
  display:flex;
  justify-content:center;
  align-items:center;
  padding:40px;
  position:relative;
}

.form{
  width:100%;
  max-width:420px;
  margin:0 auto;
  opacity:0;
  animation:fadeUp .8s ease forwards .2s;
}

.form h1{
  font-size:32px;
  line-height:1.2;
  color:#444;
  margin:0 0 8px 0;
}

.form p.subtitle{
  color:#777;
  margin-bottom:28px;
  font-size:14.5px;
}

/* Two-column row */
.field-row{
  display:grid;
  grid-template-columns:1fr 1fr;
  gap:16px;
}

.input{
  margin-bottom:18px;
  position:relative;
}

.input label{
  display:block;
  font-size:13.5px;
  margin-bottom:7px;
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
  padding:14px 44px 14px 16px;
  border:1.5px solid transparent;
  outline:none;
  border-radius:14px;
  background:#f7f9fc;
  font-size:14.5px;
  transition:.3s;
}

.input input::placeholder{
  color:#aab2c0;
}

.input input:focus{
  background:white;
  border-color:#ff82b6;
  box-shadow:0 0 0 4px rgba(255,130,182,.15);
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
  font-size:12px;
  color:#ff6b81;
  margin-top:5px;
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
  transition:color .2s;
}

.input-icon:hover{ color:#ff82b6; }

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

.strength-label{
  font-size:11.5px;
  margin-top:4px;
  color:#999;
  display:none;
}

.input.password-active .strength-label{ display:block; }

/* terms */
.terms-row{
  display:flex;
  align-items:flex-start;
  gap:10px;
  margin-bottom:22px;
  font-size:13.5px;
  color:#666;
  cursor:pointer;
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
  margin-top:1px;
}

.checkbox.checked{
  background:linear-gradient(135deg,#ff82b6,#ff4d9e);
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

.terms-row a{
  color:#ff82b6;
  font-weight:600;
  text-decoration:none;
}

.terms-row a:hover{ text-decoration:underline; }

/* button */
button{
  width:100%;
  padding:15px;
  border:none;
  border-radius:40px;
  font-size:17px;
  font-weight:600;
  cursor:pointer;
  background:linear-gradient(90deg,#ff82b6,#ff4d9e);
  color:white;
  transition:transform .25s, box-shadow .25s;
  box-shadow:0 10px 25px rgba(255,82,158,.35);
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

button.loading span.btn-label{ opacity:0; }

.spinner{
  position:absolute;
  inset:0;
  display:flex;
  align-items:center;
  justify-content:center;
  opacity:0;
  transition:opacity .2s;
}

button.loading .spinner{ opacity:1; }

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
  box-shadow:0 14px 30px rgba(255,82,158,.45);
}

button:active:not(:disabled){
  transform:translateY(-1px) scale(.98);
}

button:disabled{ cursor:default; }

button.success{
  background:linear-gradient(90deg,#27c98a,#1fdc9d);
  box-shadow:0 10px 25px rgba(39,201,138,.35);
}

.ripple{
  position:absolute;
  border-radius:50%;
  background:rgba(255,255,255,.55);
  transform:scale(0);
  animation:rippleAnim .6s ease-out;
  pointer-events:none;
}

@keyframes rippleAnim{ to{ transform:scale(3); opacity:0; } }

.or{
  text-align:center;
  margin:22px 0;
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
  margin-bottom:24px;
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
  padding:12px;
}

.social button:hover{
  border-color:#ff82b6;
  background:#fff7fb;
  box-shadow:0 6px 16px rgba(255,130,182,.12);
}

.social button svg{
  width:18px;
  height:18px;
}

.login-link{
  text-align:center;
  margin-top:20px;
  color:#666;
  font-size:14.5px;
}

.login-link a{
  text-decoration:none;
  font-weight:600;
  color:#12c7ff;
  position:relative;
}

.login-link a::after{
  content:"";
  position:absolute;
  left:0; bottom:-3px;
  width:0%;
  height:1.5px;
  background:#12c7ff;
  transition:width .25s;
}

.login-link a:hover::after{ width:100%; }

/* Success overlay */
.success-overlay{
  position:absolute;
  inset:0;
  background:rgba(255,255,255,.97);
  display:flex;
  flex-direction:column;
  align-items:center;
  justify-content:center;
  gap:16px;
  border-radius:35px;
  opacity:0;
  pointer-events:none;
  transition:opacity .5s ease;
  z-index:10;
}

.success-overlay.show{
  opacity:1;
  pointer-events:auto;
}

.success-overlay .check-circle{
  width:90px;
  height:90px;
  border-radius:50%;
  background:linear-gradient(135deg,#27c98a,#1fdc9d);
  display:flex;
  align-items:center;
  justify-content:center;
  font-size:44px;
  animation:popIn .5s cubic-bezier(.16,1,.3,1);
  box-shadow:0 14px 35px rgba(39,201,138,.35);
}

@keyframes popIn{
  from{ transform:scale(0) rotate(-20deg); opacity:0; }
  to{ transform:scale(1) rotate(0deg); opacity:1; }
}

.success-overlay h2{
  font-size:28px;
  color:#333;
  text-align:center;
}

.success-overlay p{
  font-size:15px;
  color:#777;
  text-align:center;
  max-width:280px;
  line-height:1.6;
}

.success-overlay .back-btn{
  margin-top:8px;
  width:auto;
  padding:13px 36px;
  font-size:15px;
  background:linear-gradient(90deg,#10c9ff,#29b6ff);
  box-shadow:0 10px 25px rgba(18,199,255,.35);
}

.success-overlay .back-btn:hover{
  box-shadow:0 14px 30px rgba(18,199,255,.45);
}

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

.toast.show{ transform:translateX(0); }
.toast.error{ border-left-color:#ff6b81; }

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
  .field-row{ grid-template-columns:1fr; gap:0; }
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

  <!-- Success overlay (shown after account creation) -->
  <div class="success-overlay" id="successOverlay">
    <div class="check-circle">✓</div>
    <h2>Welcome to FirstSmile! 🎉</h2>
    <p>Your account has been created successfully. Start shopping for your little one!</p>
    <button class="back-btn" onclick="window.location.href='firstsmile-login__1_.html'">
      <span class="btn-label">Go to Login</span>
      <div class="spinner"><div></div></div>
    </button>
  </div>

  <!-- Left decorative panel -->
  <div class="left">

    <div class="logo">
      <span>First</span><span>Smile</span><span class="emoji-inline">😊</span>
    </div>

    <p class="tag">
      Join 50,000+ happy parents.<br>
      Safe • Gentle • Trusted
    </p>

    <div class="emoji" id="star" title="Click me!">🌟</div>

    <div class="steps">
      <div class="step">
        <div class="step-num">1</div>
        Create your free account
      </div>
      <div class="step">
        <div class="step-num">2</div>
        Browse curated baby products
      </div>
      <div class="step">
        <div class="step-num">3</div>
        Enjoy fast & safe delivery
      </div>
    </div>

  </div>

  <!-- Right form panel -->
  <div class="right">

    <div class="form">

      <h1>Create Account</h1>
      <p class="subtitle">Set up your FirstSmile account in seconds.</p>

      <div class="or" style="margin-top:0; margin-bottom:20px;">Sign up with</div>

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

      <div class="or">OR fill in your details</div>

      <form id="signupForm" novalidate>

        <div class="field-row">
          <div class="input" id="firstNameField">
            <label for="firstName">First Name</label>
            <div class="input-wrap">
              <input type="text" id="firstName" placeholder="Jane" autocomplete="given-name" required>
              <span class="status-icon" id="firstNameStatus">✓</span>
            </div>
            <div class="error-text">Please enter your first name.</div>
          </div>

          <div class="input" id="lastNameField">
            <label for="lastName">Last Name</label>
            <div class="input-wrap">
              <input type="text" id="lastName" placeholder="Smith" autocomplete="family-name" required>
              <span class="status-icon" id="lastNameStatus">✓</span>
            </div>
            <div class="error-text">Please enter your last name.</div>
          </div>
        </div>

        <div class="input" id="emailField">
          <label for="email">Email Address</label>
          <div class="input-wrap">
            <input type="email" id="email" placeholder="jane@example.com" autocomplete="email" required>
            <span class="status-icon" id="emailStatus">✓</span>
          </div>
          <div class="error-text">Please enter a valid email address.</div>
        </div>

        <div class="input" id="phoneField">
          <label for="phone">Phone Number <span style="color:#aaa;font-weight:400;font-size:12px;">(optional)</span></label>
          <div class="input-wrap">
            <input type="tel" id="phone" placeholder="+91 98765 43210" autocomplete="tel">
          </div>
        </div>

        <div class="input" id="passwordField">
          <label for="password">Password</label>
          <div class="input-wrap">
            <input type="password" id="password" placeholder="Min. 8 characters" autocomplete="new-password" required>
            <span class="input-icon" id="togglePassword">👁️</span>
          </div>
          <div class="error-text">Password must be at least 8 characters.</div>
          <div class="strength-meter"><div class="strength-bar" id="strengthBar"></div></div>
          <div class="strength-label" id="strengthLabel">Strength: Weak</div>
        </div>

        <div class="input" id="confirmField">
          <label for="confirm">Confirm Password</label>
          <div class="input-wrap">
            <input type="password" id="confirm" placeholder="Re-enter password" autocomplete="new-password" required>
            <span class="input-icon" id="toggleConfirm">👁️</span>
          </div>
          <div class="error-text">Passwords do not match.</div>
        </div>

        <label class="terms-row" id="termsRow">
          <span class="checkbox" id="termsBox">
            <svg viewBox="0 0 24 24" fill="none"><path d="M5 13l4 4L19 7" stroke="white" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/></svg>
          </span>
          <span>I agree to the <a href="#" onclick="return false;">Terms of Service</a> and <a href="#" onclick="return false;">Privacy Policy</a></span>
        </label>
        <div class="error-text" id="termsError" style="margin-top:-12px; margin-bottom:14px;">Please accept the terms to continue.</div>

        <button type="submit" id="signupBtn">
          <span class="btn-label">Create Account</span>
          <div class="spinner"><div></div></div>
        </button>

        <div class="login-link">
          Already have an account? <a href="login.jsp">Sign In</a>
        </div>

      </form>

    </div>

  </div>

</div>

<div class="toast" id="toast">
  <span id="toastIcon">✅</span>
  <span id="toastMsg">Account created!</span>
</div>

<script>

// ---------- Sparkles on star click ----------
const star = document.getElementById('star');
const sparkleLayer = document.getElementById('sparkleLayer');
const sparkleChars = ['✨','💫','⭐','🌸','💕'];

star.addEventListener('click', () => {
  for (let i = 0; i < 7; i++) {
    const s = document.createElement('span');
    s.className = 'sparkle';
    s.textContent = sparkleChars[Math.floor(Math.random()*sparkleChars.length)];
    const rect = star.getBoundingClientRect();
    s.style.left = (rect.left + rect.width/2 + (Math.random()*100-50)) + 'px';
    s.style.top = (rect.top + rect.height/2 + (Math.random()*50-25)) + 'px';
    s.style.animationDelay = (Math.random()*0.3) + 's';
    document.body.appendChild(s);
    setTimeout(() => s.remove(), 2800);
  }
});

// ---------- Live validation helpers ----------
const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

function liveText(inputEl, fieldEl, statusEl, validateFn) {
  inputEl.addEventListener('input', () => {
    fieldEl.classList.remove('has-error');
    if (inputEl.value.trim().length === 0) {
      statusEl.classList.remove('show');
    } else if (validateFn(inputEl.value.trim())) {
      statusEl.classList.add('show', 'valid');
    } else {
      statusEl.classList.remove('show');
    }
  });
}

liveText(
  document.getElementById('firstName'),
  document.getElementById('firstNameField'),
  document.getElementById('firstNameStatus'),
  v => v.length >= 1
);

liveText(
  document.getElementById('lastName'),
  document.getElementById('lastNameField'),
  document.getElementById('lastNameStatus'),
  v => v.length >= 1
);

liveText(
  document.getElementById('email'),
  document.getElementById('emailField'),
  document.getElementById('emailStatus'),
  v => emailPattern.test(v)
);

// ---------- Password toggle ----------
function toggleVis(inputId, btnId) {
  const inp = document.getElementById(inputId);
  const btn = document.getElementById(btnId);
  btn.addEventListener('click', () => {
    const isPwd = inp.type === 'password';
    inp.type = isPwd ? 'text' : 'password';
    btn.textContent = isPwd ? '🙈' : '👁️';
  });
}
toggleVis('password', 'togglePassword');
toggleVis('confirm', 'toggleConfirm');

// ---------- Password strength ----------
const passwordInput = document.getElementById('password');
const passwordField = document.getElementById('passwordField');
const strengthBar = document.getElementById('strengthBar');
const strengthLabel = document.getElementById('strengthLabel');
const labels = ['Weak', 'Fair', 'Good', 'Strong'];
const colors = ['#ff6b81','#ffb648','#27c98a','#12c7ff'];

passwordInput.addEventListener('focus', () => passwordField.classList.add('password-active'));
passwordInput.addEventListener('input', () => {
  passwordField.classList.remove('has-error');
  const val = passwordInput.value;
  let score = 0;
  if (val.length >= 8) score++;
  if (val.length >= 12) score++;
  if (/[A-Z]/.test(val) && /[0-9]/.test(val)) score++;
  if (/[^A-Za-z0-9]/.test(val)) score++;
  const pct = val.length === 0 ? 0 : Math.max(15, (score / 4) * 100);
  strengthBar.style.width = pct + '%';
  strengthBar.style.background = colors[Math.min(score, 3)];
  strengthLabel.textContent = 'Strength: ' + (val.length === 0 ? '—' : labels[Math.min(score, 3)]);
});

// ---------- Confirm password live check ----------
const confirmInput = document.getElementById('confirm');
const confirmField = document.getElementById('confirmField');
confirmInput.addEventListener('input', () => {
  confirmField.classList.remove('has-error');
});

// ---------- Terms checkbox ----------
const termsBox = document.getElementById('termsBox');
const termsError = document.getElementById('termsError');
let termsChecked = false;
termsBox.addEventListener('click', () => {
  termsChecked = !termsChecked;
  termsBox.classList.toggle('checked', termsChecked);
  termsError.style.display = 'none';
});

// ---------- Ripple ----------
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

// ---------- Toast ----------
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

// ---------- Form submit ----------
const form = document.getElementById('signupForm');
const signupBtn = document.getElementById('signupBtn');
const btnLabel = signupBtn.querySelector('.btn-label');

form.addEventListener('submit', function(e) {
  e.preventDefault();

  const firstName = document.getElementById('firstName').value.trim();
  const lastName = document.getElementById('lastName').value.trim();
  const email = document.getElementById('email').value.trim();
  const password = passwordInput.value;
  const confirm = confirmInput.value;

  let valid = true;

  if (!firstName) {
    document.getElementById('firstNameField').classList.add('has-error');
    valid = false;
  }
  if (!lastName) {
    document.getElementById('lastNameField').classList.add('has-error');
    valid = false;
  }
  if (!emailPattern.test(email)) {
    document.getElementById('emailField').classList.add('has-error');
    valid = false;
  }
  if (password.length < 8) {
    passwordField.classList.add('password-active', 'has-error');
    valid = false;
  }
  if (confirm !== password || confirm.length === 0) {
    confirmField.classList.add('has-error');
    valid = false;
  }
  if (!termsChecked) {
    termsError.style.display = 'block';
    valid = false;
  }

  if (!valid) {
    showToast('Please fix the highlighted fields.', 'error');
    return;
  }

  // Simulate network request
  signupBtn.classList.add('loading');
  signupBtn.disabled = true;

  setTimeout(() => {
    signupBtn.classList.remove('loading');
    signupBtn.classList.add('success');
    btnLabel.innerHTML = '✓ Account Created!';
    showToast('Welcome to FirstSmile! 🎉', 'success');

    // Show full success overlay after short delay
    setTimeout(() => {
      document.getElementById('successOverlay').classList.add('show');
    }, 700);

  }, 1500);
});

// ---------- Social (demo) ----------
document.getElementById('googleBtn').addEventListener('click', () => showToast('Connecting to Google…'));
document.getElementById('fbBtn').addEventListener('click', () => showToast('Connecting to Facebook…'));

</script>

</body>
</html>
