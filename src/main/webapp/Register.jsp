<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FirstSmile - Register</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body{
            font-family:'Poppins',sans-serif;
            background:linear-gradient(135deg,#fdfdfd,#eef9ff,#fff3f9);
        }

        .glass{
            background:rgba(255,255,255,.75);
            backdrop-filter:blur(20px);
        }

        .blob{
            position:absolute;
            border-radius:50%;
            filter:blur(35px);
            opacity:.5;
            animation:float 6s ease-in-out infinite;
        }

        @keyframes float{
            0%,100%{transform:translateY(0);}
            50%{transform:translateY(-20px);}
        }
    </style>

</head>

<body class="relative min-h-screen flex justify-center items-center p-6 overflow-x-hidden overflow-y-auto"></body>
<!-- Background -->
<div class="blob w-48 h-48 bg-sky-200 left-0 top-0"></div>
<div class="blob w-40 h-40 bg-pink-200 right-10 bottom-10" style="animation-delay:1s"></div>
<div class="blob w-24 h-24 bg-purple-200 right-44 top-40" style="animation-delay:2s"></div>

<div class="glass rounded-[35px] shadow-2xl w-full max-w-7xl min-h-[780px] grid lg:grid-cols-2"></div>
    <!-- Left Section -->
<div class="flex flex-col justify-center items-center text-center p-8 lg:p-10"></div>
        <h1 class="text-6xl font-bold">
            <span class="text-pink-500">First</span><span class="text-sky-500">Smile</span> 😊
        </h1>
<% String val=(String)request.getAttribute("baby"); %>
<%if(val!=null){ %>
<%=val %>
<%} %>
        <p class="mt-8 text-2xl text-gray-600">
            Create your account today.
        </p>

        <p class="text-gray-500 mt-2">
            Shopping made easy for your little one.
        </p>

        <div class="text-9xl mt-14 animate-bounce">
    🧸
</div>

        <div class="grid grid-cols-2 gap-5 mt-14">

            <div class="bg-white rounded-2xl shadow-lg p-5">
                🚚<br>
                Fast Delivery
            </div>

            <div class="bg-white rounded-2xl shadow-lg p-5">
                🛡️<br>
                Safe Products
            </div>

            <div class="bg-white rounded-2xl shadow-lg p-5">
                💳<br>
                Easy Payments
            </div>

            <div class="bg-white rounded-2xl shadow-lg p-5">
                ⭐<br>
                Trusted Parents
            </div>

        </div>

    </div>

    <!-- Right Section -->
<div class="bg-white/70 p-8 lg:p-10"></div>
        <h2 class="text-5xl font-bold text-gray-800">
            Create Account
        </h2>

        <p class="text-gray-500 mt-2">
            Join the FirstSmile family.
        </p>

        <form action="Register" method="post" class="mt-8 space-y-5">

            <div class="grid md:grid-cols-2 gap-5">

                <div>

    <label class="font-medium text-gray-700">

        Full Name

    </label>

    <input
        type="text"
        name="name"
        placeholder="Enter your full name"
        class="w-full mt-2 bg-slate-100 rounded-2xl p-4 focus:ring-4 focus:ring-sky-200 outline-none">

</div>

                

            </div>

            <div>
                <label>Email Address</label>
                <input type="email" name="email"
                class="w-full mt-2 bg-slate-100 rounded-2xl p-4 focus:ring-4 focus:ring-sky-200 outline-none">
            </div>

            <div>
                <label>Phone Number</label>
                <input type="text" name="phone"
                class="w-full mt-2 bg-slate-100 rounded-2xl p-4 focus:ring-4 focus:ring-sky-200 outline-none">
            </div>

            <div>
                <label>Address</label>
                <textarea name="address"
                class="w-full mt-2 bg-slate-100 rounded-2xl p-4 h-24 resize-none focus:ring-4 focus:ring-pink-200 outline-none"></textarea>
            </div>

            <div class="grid md:grid-cols-2 gap-5">

                <div>
                    <label>Password</label>
                    <input type="password" id="password" name="password"
                    class="w-full mt-2 bg-slate-100 rounded-2xl p-4 outline-none focus:ring-4 focus:ring-pink-200">
                </div>

                <div>
                    <label>Confirm Password</label>
                    <input type="password" id="confirmPassword"
                    class="w-full mt-2 bg-slate-100 rounded-2xl p-4 outline-none focus:ring-4 focus:ring-pink-200">
                </div>

            </div>

            <div class="flex items-center gap-2">

                <input type="checkbox" required>

                <span class="text-sm text-gray-600">
                    I agree to the Terms & Conditions
                </span>

            </div>

            <button
            class="w-full py-4 rounded-full text-white text-lg font-semibold bg-gradient-to-r from-pink-400 to-sky-400 hover:scale-105 duration-300 shadow-xl">

                Create Account

            </button>

        </form>

        <div class="flex items-center my-8">

            <hr class="flex-1">

            <span class="mx-4 text-gray-400">OR</span>

            <hr class="flex-1">

        </div>

        <div class="grid grid-cols-2 gap-4">

            <button class="border rounded-full py-4 hover:bg-gray-100 transition">
                🌐 Google
            </button>

            <button class="border rounded-full py-4 hover:bg-gray-100 transition">
                📘 Facebook
            </button>

        </div>

        <p class="text-center mt-8 text-gray-600">

            Already have an account?

            <a href="Login.jsp" class="text-sky-500 font-semibold hover:underline">
                Login
            </a>

        </p>

    </div>

</div>

</body>
</html>