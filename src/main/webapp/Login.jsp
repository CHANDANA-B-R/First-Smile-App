<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FirstSmile Login</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body{
            font-family:'Poppins',sans-serif;
            background:linear-gradient(135deg,#fefefe,#eef9ff,#fff4fb);
        }

        .glass{
            background:rgba(255,255,255,.75);
            backdrop-filter:blur(20px);
        }

        .blob{
            position:absolute;
            border-radius:50%;
            filter:blur(30px);
            opacity:.5;
            animation:float 6s ease-in-out infinite;
        }

        @keyframes float{
            0%{transform:translateY(0);}
            50%{transform:translateY(-20px);}
            100%{transform:translateY(0);}
        }
    </style>

</head>

<body class="relative min-h-screen overflow-hidden flex items-center justify-center p-8">

    <!-- Background Circles -->

    <div class="blob w-44 h-44 bg-sky-200 left-0 top-0"></div>

    <div class="blob w-36 h-36 bg-pink-200 bottom-0 right-10"
        style="animation-delay:1s"></div>

    <div class="blob w-24 h-24 bg-purple-200 right-52 top-36"
        style="animation-delay:2s"></div>

    <div class="blob w-24 h-24 bg-green-100 bottom-20 left-16"
        style="animation-delay:3s"></div>

    <!-- Card -->

    <div class="glass shadow-2xl rounded-[35px] overflow-hidden w-full max-w-6xl grid md:grid-cols-2">

        <!-- Left Side -->

        <div class="flex flex-col justify-center items-center px-12 py-16 text-center">

            <h1 class="text-6xl font-bold">
                <span class="text-pink-500">First</span><span class="text-sky-500">Smile</span>
                😊
            </h1>

            <p class="mt-8 text-2xl text-gray-600">
                Everything your little one needs.
            </p>

            <p class="text-gray-500 mt-2">
                Safe • Gentle • Trusted by Parents
            </p>

            <div class="text-9xl mt-16 animate-bounce">
                🧸
            </div>

            <div class="flex gap-4 mt-16 flex-wrap justify-center">

                <div class="bg-white rounded-full shadow-lg px-5 py-3">
                    🛡️ Safety Tested
                </div>

                <div class="bg-white rounded-full shadow-lg px-5 py-3">
                    🚚 Fast Delivery
                </div>

                <div class="bg-white rounded-full shadow-lg px-5 py-3">
                    ⭐ 50k+ Parents
                </div>

            </div>

        </div>

        <!-- Right Side -->
        <%String val=(String)request.getAttribute("baby"); %>
        <%if(val!=null){ %>
        <%=val %>
        <%} %>

        <div class="bg-white/70 px-14 py-14">

            <h2 class="text-5xl font-bold text-gray-800">
                Welcome Back
            </h2>

            <p class="text-gray-500 mt-2">
                Login to continue shopping for your little one.
            </p>

            <form action="Login" method="post" class="mt-10 space-y-6">

                <div>
                    <label class="font-medium text-gray-700">
                        Email Address
                    </label>

                    <input
                        type="email"
                        name="email"
                        placeholder="Enter your email"
                        required
                        class="w-full mt-2 rounded-2xl bg-slate-100 p-4 outline-none focus:ring-4 focus:ring-sky-200">
                </div>

                <div>

                    <label class="font-medium text-gray-700">
                        Password
                    </label>

                    <div class="relative">

                        <input
                            type="password"
                            id="password"
                            name="password"
                            placeholder="Enter your password"
                            required
                            class="w-full mt-2 rounded-2xl bg-slate-100 p-4 pr-12 outline-none focus:ring-4 focus:ring-pink-200">

                        <button
                            type="button"
                            onclick="togglePassword()"
                            class="absolute right-4 top-6">

                            👁️

                        </button>

                    </div>

                </div>

                <div class="flex justify-between items-center text-sm">

                    <label class="flex items-center gap-2">

                        <input type="checkbox">

                        Remember Me

                    </label>

                    <a href="#" class="text-sky-500 font-semibold hover:underline">
                        Forgot Password?
                    </a>

                </div>

                <button type="submit" 
                    class="w-full py-4 rounded-full text-white font-semibold text-lg bg-gradient-to-r from-sky-400 to-sky-500 hover:scale-105 transition duration-300 shadow-xl">

                    Login

                </button>

            </form>

            <div class="flex items-center gap-4 my-8">

                <hr class="flex-1">

                <span class="text-gray-400">OR</span>

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

            <p class="text-center mt-10 text-gray-600">

                Don't have an account?

                <a href="register.jsp"
                    class="text-pink-500 font-semibold">

                    Create Account

                </a>

            </p>

        </div>

    </div>

<script>

function togglePassword(){

    var pass=document.getElementById("password");

    if(pass.type==="password")
        pass.type="text";
    else
        pass.type="password";

}

</script>

</body>
</html>