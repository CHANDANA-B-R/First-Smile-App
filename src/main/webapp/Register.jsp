<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FirstSmile - Register</title>

<script src="https://cdn.tailwindcss.com"></script>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"/>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

html,
body{
    width:100%;
    height:100%;
    overflow:hidden;
}

body{
    background:linear-gradient(135deg,#EDF9FF,#FFF8FC,#FDFEFF);
}

/* Floating Blobs */

.blob{
    position:absolute;
    border-radius:50%;
    filter:blur(65px);
    opacity:.45;
    animation:float 8s ease-in-out infinite;
}

@keyframes float{

0%,100%{
transform:translateY(0px);
}

50%{
transform:translateY(-30px);
}

}

/* Glass */

.glass{
    background:rgba(255,255,255,.72);
    backdrop-filter:blur(20px);
    box-shadow:0 20px 50px rgba(0,0,0,.08);
}

</style>

</head>

<body class="relative h-screen w-screen overflow-hidden flex justify-center items-center bg-gradient-to-br from-sky-50 via-white to-pink-50">

<!-- Background -->

<div class="blob bg-sky-300 w-72 h-72 -left-16 -top-10"></div>

<div class="blob bg-pink-300 w-80 h-80 right-0 -bottom-10"
style="animation-delay:2s;"></div>

<div class="blob bg-blue-200 w-56 h-56 top-20 right-72"
style="animation-delay:3s;"></div>

<div class="blob bg-pink-200 w-40 h-40 left-20 bottom-32"
style="animation-delay:5s;"></div>

<!-- Main Container -->

<div class="glass
w-[95vw]
max-w-7xl
h-[92vh]
max-h-[92vh]
rounded-[35px]
overflow-hidden
grid
lg:grid-cols-2">

<!-- LEFT PANEL -->

<div class="bg-gradient-to-br
from-pink-50
via-white
to-sky-50
p-10
flex
flex-col
justify-center
items-center
relative">

<!-- Logo -->

<h1 class="text-6xl font-bold">

<span class="text-pink-500">First</span>

<span class="text-sky-500">Smile</span>

💗

</h1>

<p class="mt-4 text-2xl font-medium text-gray-700">

Everything your little one needs ❤️

</p>

<!-- Decorative Icons -->

<div class="absolute left-8 top-44 text-pink-300 text-3xl">
♡
</div>

<div class="absolute right-10 top-60 text-sky-300 text-3xl">
✦
</div>

<div class="absolute left-16 bottom-48 text-pink-300 text-2xl">
♥
</div>

<!-- Teddy -->

<div class="mt-8">

<img
src="https://images.unsplash.com/photo-1708440996563-bfbe9617391d?w=600&auto=format&fit=crop&q=60"
alt="Teddy"
class="w-64 lg:w-72 mx-auto hover:scale-105 duration-500">

</div>

<!-- Feature Cards -->

<div class="grid grid-cols-2 gap-4 mt-8 w-full">
    <!-- Card 1 -->

<div class="bg-white rounded-3xl shadow-lg p-4 flex items-center gap-3">

<div class="w-12 h-12 rounded-full bg-pink-500 flex items-center justify-center text-white text-xl">
🚚
</div>

<div>

<h2 class="font-semibold text-base">
Fast Delivery
</h2>

<p class="text-xs text-gray-500">
Across India
</p>

</div>

</div>

<!-- Card 2 -->

<div class="bg-white rounded-3xl shadow-lg p-4 flex items-center gap-3">

<div class="w-12 h-12 rounded-full bg-sky-500 flex items-center justify-center text-white text-xl">
🛡️
</div>

<div>

<h2 class="font-semibold text-base">
Baby Safe
</h2>

<p class="text-xs text-gray-500">
Premium Quality
</p>

</div>

</div>

<!-- Card 3 -->

<div class="bg-white rounded-3xl shadow-lg p-4 flex items-center gap-3">

<div class="w-12 h-12 rounded-full bg-violet-500 flex items-center justify-center text-white text-xl">
💳
</div>

<div>

<h2 class="font-semibold text-base">
Easy Payment
</h2>

<p class="text-xs text-gray-500">
UPI • Card • COD
</p>

</div>

</div>

<!-- Card 4 -->

<div class="bg-white rounded-3xl shadow-lg p-4 flex items-center gap-3">

<div class="w-12 h-12 rounded-full bg-yellow-400 flex items-center justify-center text-white text-xl">
⭐
</div>

<div>

<h2 class="font-semibold text-base">
Trusted
</h2>

<p class="text-xs text-gray-500">
10000+ Parents
</p>

</div>

</div>

</div>

</div>

<!-- ================= RIGHT PANEL ================= -->

<div class="bg-white/80 p-8 overflow-y-auto">

<h1 class="text-5xl font-bold text-gray-800">
Create Account
</h1>

<p class="mt-2 text-lg text-gray-500">

Join the

<span class="text-pink-500 font-semibold">
First
</span>

<span class="text-sky-500 font-semibold">
Smile
</span>

family.

</p>

<form action="Register" method="post" class="mt-6 space-y-4">

<div class="grid grid-cols-2 gap-4">

<!-- Name -->

<div>

<label class="font-semibold">
Full Name
</label>

<div class="relative mt-2">

<i class="fa-solid fa-user absolute left-4 top-4 text-gray-400"></i>

<input
type="text"
name="name"
placeholder="Enter your full name"
class="w-full pl-12 py-3 pr-4 rounded-2xl border border-gray-200 focus:ring-4 focus:ring-pink-200 outline-none">

</div>

</div>

<!-- Email -->

<div>

<label class="font-semibold">
Email Address
</label>

<div class="relative mt-2">

<i class="fa-solid fa-envelope absolute left-4 top-4 text-gray-400"></i>

<input
type="email"
name="email"
placeholder="Enter email"
class="w-full pl-12 py-3 pr-4 rounded-2xl border border-gray-200 focus:ring-4 focus:ring-sky-200 outline-none">

</div>

</div>

<!-- Phone -->

<div>

<label class="font-semibold">
Phone Number
</label>

<div class="relative mt-2">

<i class="fa-solid fa-phone absolute left-4 top-4 text-gray-400"></i>

<input
type="tel"
name="phone"
placeholder="Phone Number"
class="w-full pl-12 py-3 pr-4 rounded-2xl border border-gray-200 focus:ring-4 focus:ring-pink-200 outline-none">

</div>

</div>

<!-- Address -->

<div>

<label class="font-semibold">
Address
</label>

<div class="relative mt-2">

<i class="fa-solid fa-location-dot absolute left-4 top-4 text-gray-400"></i>

<textarea
rows="1"
name="address"
placeholder="Address"
class="w-full pl-12 py-3 pr-4 rounded-2xl border border-gray-200 resize-none focus:ring-4 focus:ring-sky-200 outline-none"></textarea>

</div>

</div>

</div>

<!-- Password Section -->

<div class="grid grid-cols-2 gap-4"><!-- Password -->

<div>

<label class="font-semibold">
Password
</label>

<div class="relative mt-2">

<i class="fa-solid fa-lock absolute left-4 top-4 text-gray-400"></i>

<input
id="password"
type="password"
name="password"
placeholder="Password"
class="w-full pl-12 pr-12 py-3 rounded-2xl border border-gray-200 outline-none focus:ring-4 focus:ring-pink-200">

<button
type="button"
onclick="togglePassword('password',this)"
class="absolute right-4 top-4 text-gray-400">

<i class="fa-solid fa-eye"></i>

</button>

</div>

</div>

<!-- Confirm Password -->

<div>

<label class="font-semibold">
Confirm Password
</label>

<div class="relative mt-2">

<i class="fa-solid fa-lock absolute left-4 top-4 text-gray-400"></i>

<input
id="confirmPassword"
type="password"
placeholder="Confirm Password"
class="w-full pl-12 pr-12 py-3 rounded-2xl border border-gray-200 outline-none focus:ring-4 focus:ring-sky-200">

<button
type="button"
onclick="togglePassword('confirmPassword',this)"
class="absolute right-4 top-4 text-gray-400">

<i class="fa-solid fa-eye"></i>

</button>

</div>

</div>

</div>

<!-- Terms -->

<div class="flex items-center gap-3 mt-2">

<input
type="checkbox"
required
class="accent-pink-500 w-5 h-5">

<p class="text-gray-600 text-sm">

I agree to the

<a href="#" class="text-pink-500 font-semibold hover:underline">

Terms & Conditions

</a>

</p>

</div>

<!-- Register Button -->

<button
type="submit"
class="w-full py-3 rounded-full bg-gradient-to-r from-pink-500 to-sky-500 text-white text-lg font-semibold shadow-lg hover:scale-105 transition duration-300">

<i class="fa-solid fa-user-plus mr-2"></i>

Create Account

</button>

</form>

<!-- OR -->

<div class="flex items-center my-5">

<hr class="flex-1">

<span class="mx-4 text-gray-400">

OR

</span>

<hr class="flex-1">

</div>

<!-- Social Buttons -->

<div class="grid grid-cols-2 gap-4">

<button
class="border rounded-2xl py-3 hover:bg-gray-100 transition">

<i class="fa-brands fa-google text-red-500 mr-2"></i>

Google

</button>

<button
class="border rounded-2xl py-3 hover:bg-gray-100 transition">

<i class="fa-brands fa-facebook text-blue-600 mr-2"></i>

Facebook

</button>

</div>

<p class="text-center mt-6 text-gray-600">

Already have an account?

<a
href="login.jsp"
class="text-sky-500 font-semibold hover:underline">

Login

</a>

</p>

</div>

</div>

<script>

function togglePassword(id,button){

const input=document.getElementById(id);

const icon=button.querySelector("i");

if(input.type==="password"){

input.type="text";

icon.classList.remove("fa-eye");

icon.classList.add("fa-eye-slash");

}else{

input.type="password";

icon.classList.remove("fa-eye-slash");

icon.classList.add("fa-eye");

}

}

</script>

</body>

</html>