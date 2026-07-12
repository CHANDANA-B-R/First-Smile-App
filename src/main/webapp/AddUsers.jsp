<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FirstSmile | Admin Dashboard</title>

<script src="https://cdn.tailwindcss.com"></script>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

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
transform:translateY(0);
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

<body class="relative h-screen w-screen overflow-hidden flex justify-center items-center">

<!-- Background -->

<div class="blob bg-sky-300 w-72 h-72 -left-16 -top-10 absolute"></div>

<div class="blob bg-pink-300 w-80 h-80 right-0 -bottom-10 absolute"
style="animation-delay:2s;"></div>

<div class="blob bg-blue-200 w-56 h-56 top-20 right-72 absolute"
style="animation-delay:3s;"></div>

<div class="blob bg-pink-200 w-40 h-40 left-20 bottom-32 absolute"
style="animation-delay:5s;"></div>

<!-- Main Container -->

<div class="glass
w-[96vw]
h-[94vh]
rounded-[35px]
overflow-hidden
flex
flex-col
z-10">

<!-- HEADER -->

<header class="bg-pink-300 text-gray-700 shadow-md">

<div class="max-w-7xl mx-auto px-8 py-5 flex justify-between items-center">

<div>

<h1 class="text-4xl font-bold">

😊 FirstSmile

</h1>

<p class="text-sm">

Admin Dashboard

</p>

</div>

<nav class="flex gap-8 text-lg">

<a href="adminDashboard.jsp"
class="hover:text-pink-500">

<i class="fa-solid fa-house"></i>

Dashboard

</a>

<a href="addProduct.jsp"
class="font-semibold hover:text-pink-500">

<i class="fa-solid fa-box"></i>

Products

</a>

<a href="users.jsp"
class="hover:text-pink-500">

<i class="fa-solid fa-users"></i>

Users

</a>

<a href="payments.jsp"
class="hover:text-pink-500">

<i class="fa-solid fa-credit-card"></i>

Payments

</a>

<a href="LogoutServlet"
class="hover:text-red-500">

<i class="fa-solid fa-right-from-bracket"></i>

Logout

</a>

</nav>

</div>

</header>

<!-- MAIN -->

<main class="flex-1 overflow-y-auto">

<div class="max-w-7xl mx-auto p-8">

<div class="flex justify-between items-center">

<div>

<h2 class="text-4xl font-bold text-pink-400">

Hello, Welcome Admin 👋

</h2>

<p class="text-gray-600 mt-2">

Add and manage products for FirstSmile.

</p>

</div>

<div class="w-16 h-16 rounded-full bg-pink-300 text-white flex justify-center items-center text-2xl">

<i class="fa-solid fa-user"></i>

</div>

</div>

<div class="mt-10">

<h2 class="text-3xl font-bold text-pink-400">

<i class="fa-solid fa-circle-plus"></i>

Add Product

</h2>

<p class="text-gray-500 mt-2">

Enter the product details below.

</p>

</div>

<div class="glass rounded-3xl mt-8 p-8">

<form
action="AddProductServlet"
method="post"
enctype="multipart/form-data"
id="addProductForm">

<div class="grid grid-cols-2 gap-8">

<!-- Product Name -->

<div>

<label
for="productName"
class="block text-lg font-semibold text-gray-700 mb-2">

Product Name

</label>

<input
type="text"
id="productName"
name="productName"
placeholder="Enter Product Name"
required
class="w-full px-4 py-3 rounded-xl border-2 border-pink-300
focus:outline-none
focus:border-pink-300">

</div>

<!-- Product Price -->

<div>

<label
for="productPrice"
class="block text-lg font-semibold text-gray-700 mb-2">

Product Price

</label>

<input
type="number"
id="productPrice"
name="productPrice"
placeholder="Enter Product Price"
required
class="w-full px-4 py-3 rounded-xl border-2 border-pink-300
focus:outline-none
focus:border-pink-300">

</div>

<!-- Upload Image -->

<div class="col-span-2">

<label
for="productImage"
class="block text-lg font-semibold text-gray-700 mb-2">

Upload Product Image

</label>

<input
type="file"
id="productImage"
name="productImage"
accept="image/*"
required
class="w-full border-2 border-pink-300 rounded-xl px-4 py-3
file:bg-pink-300
file:text-white
file:border-0
file:px-5
file:py-2
file:rounded-lg
file:cursor-pointer
file:hover:bg-pink-400">

</div>

<!-- Buttons -->

<div class="col-span-2 flex justify-end gap-5 mt-6">

<button
type="reset"
class="px-8 py-3 rounded-xl bg-gray-300 hover:bg-gray-400">

Reset

</button>

<button
type="submit"
class="px-8 py-3 rounded-xl bg-pink-300 hover:bg-pink-400 text-white font-semibold shadow-lg">

<i class="fa-solid fa-circle-plus mr-2"></i>

Add Product

</button>

</div>
                    </div>

                </form>

            </div>

        </div>

    </main>

    <!-- FOOTER -->

    <footer class="bg-pink-300 shadow-inner">

        <div class="max-w-7xl mx-auto py-5 text-center">

            <h2 class="text-2xl font-bold text-gray-700">

                😊 FirstSmile

            </h2>

            <p class="text-gray-600 mt-2">

                Making Every Baby Smile with Love ❤️

            </p>

            <p class="text-sm text-gray-500 mt-2">

                © 2026 FirstSmile | Admin Dashboard

            </p>

        </div>

    </footer>

</div>

</body>

</html>


    