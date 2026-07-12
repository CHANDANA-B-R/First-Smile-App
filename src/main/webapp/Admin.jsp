<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>FirstSmile Admin</title>

<script src="https://cdn.tailwindcss.com"></script>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"/>

<style>

body{
font-family:'Poppins',sans-serif;
background:#FFF8FB;
}

.card{
box-shadow:0 10px 30px rgba(0,0,0,.08);
}

</style>

</head>

<body>

<div class="flex min-h-screen">

<!-- Sidebar -->

<div class="w-72 bg-white shadow-xl">

<div class="py-8 text-center border-b">

<h1 class="text-5xl font-bold">

<span class="text-pink-500">First</span>

<span class="text-sky-500">Smile</span>

</h1>

<p class="text-gray-500 mt-2">
Admin Panel
</p>

</div>

<nav class="mt-10">

<a href="#"
class="flex items-center gap-4 px-8 py-4 bg-pink-100 text-pink-600 font-semibold">

<i class="fa-solid fa-house"></i>

Dashboard

</a>

<a href="#"
class="flex items-center gap-4 px-8 py-4 hover:bg-sky-100 hover:text-sky-600">

<i class="fa-solid fa-box"></i>

Products

</a>

<a href="#"
class="flex items-center gap-4 px-8 py-4 hover:bg-pink-100 hover:text-pink-600">

<i class="fa-solid fa-cart-shopping"></i>

Orders

</a>

<a href="#"
class="flex items-center gap-4 px-8 py-4 hover:bg-sky-100 hover:text-sky-600">

<i class="fa-solid fa-users"></i>

Users

</a>

<a href="#"
class="flex items-center gap-4 px-8 py-4 hover:bg-pink-100 hover:text-pink-600">

<i class="fa-solid fa-credit-card"></i>

Payments

</a>

<a href="Logout"
class="flex items-center gap-4 px-8 py-4 hover:bg-red-100 hover:text-red-600">

<i class="fa-solid fa-right-from-bracket"></i>

Logout

</a>

</nav>

</div>

<!-- Main Content -->

<div class="flex-1">

<!-- Navbar -->

<div class="bg-white shadow px-10 py-5 flex justify-between items-center">

<div class="relative w-[420px]">

<input
type="text"
placeholder="Search Products..."

class="w-full border-2 border-pink-200 rounded-full py-3 pl-12 pr-5 outline-none focus:border-pink-400">

<i class="fa-solid fa-magnifying-glass absolute left-5 top-4 text-pink-500"></i>

</div>

<div class="flex items-center gap-8">

<button>

<i class="fa-solid fa-bell text-2xl text-pink-500"></i>

</button>

<div class="flex items-center gap-3">

<div class="w-12 h-12 rounded-full bg-sky-200 flex justify-center items-center">

<i class="fa-solid fa-user text-sky-700"></i>

</div>

<div>

<h2 class="font-semibold">

Admin

</h2>

<p class="text-sm text-gray-500">

Administrator

</p>

</div>

</div>

</div>

</div>

<!-- Welcome Banner -->

<div class="mx-10 mt-10">

<div class="rounded-3xl bg-gradient-to-r from-pink-200 to-sky-200 p-10">

<h1 class="text-4xl font-bold text-pink-600">

Welcome Admin 👋

</h1>

<p class="text-gray-700 mt-4 text-lg">

Manage all baby products, customers and orders from one place.

</p>

<button
class="mt-6 bg-pink-500 text-white px-8 py-3 rounded-full hover:bg-pink-600">

Manage Products

</button>

</div>

</div>

<!-- Statistics -->

<div class="grid grid-cols-4 gap-8 mx-10 mt-10">

<!-- Products -->

<div class="card bg-white rounded-3xl p-8">

<div class="flex justify-between">

<div>

<p class="text-gray-500">

Total Products

</p>

<h1 class="text-4xl font-bold mt-3">

120

</h1>

</div>

<div class="w-16 h-16 rounded-full bg-pink-100 flex justify-center items-center">

<i class="fa-solid fa-box text-3xl text-pink-500"></i>

</div>

</div>

</div>

<!-- Categories -->

<div class="card bg-white rounded-3xl p-8">

<div class="flex justify-between">

<div>

<p class="text-gray-500">

Categories

</p>

<h1 class="text-4xl font-bold mt-3">

12

</h1>

</div>

<div class="w-16 h-16 rounded-full bg-sky-100 flex justify-center items-center">

<i class="fa-solid fa-layer-group text-3xl text-sky-500"></i>

</div>

</div>

</div>

<!-- Orders -->

<div class="card bg-white rounded-3xl p-8">

<div class="flex justify-between">

<div>

<p class="text-gray-500">

Orders

</p>

<h1 class="text-4xl font-bold mt-3">

580

</h1>

</div>

<div class="w-16 h-16 rounded-full bg-pink-100 flex justify-center items-center">

<i class="fa-solid fa-cart-shopping text-3xl text-pink-500"></i>

</div>

</div>

</div>

<!-- Users -->

<div class="card bg-white rounded-3xl p-8">

<div class="flex justify-between">

<div>

<p class="text-gray-500">

Users

</p>

<h1 class="text-4xl font-bold mt-3">

350

</h1>

</div>

<div class="w-16 h-16 rounded-full bg-sky-100 flex justify-center items-center">

<i class="fa-solid fa-users text-3xl text-sky-500"></i>

</div>

</div>

</div>

</div>
<!-- ================= PRODUCT MANAGEMENT ================= -->

<div class="mx-10 mt-12">

    <div class="flex items-center justify-between">

        <h1 class="text-4xl font-bold text-pink-500">

            Product Management

        </h1>

        <span class="bg-pink-100 text-pink-600 px-5 py-2 rounded-full font-semibold">

            Manage Products Easily

        </span>

    </div>

    <p class="text-gray-500 mt-2">

        Choose an action below to manage your store inventory.

    </p>

</div>


<div class="grid grid-cols-2 gap-8 mx-10 mt-10">

    <!-- ADD PRODUCT -->

    <a href="AddProduct.jsp"
       class="group bg-white rounded-3xl p-10 card hover:shadow-2xl hover:-translate-y-2 duration-300">

        <div class="flex justify-between items-center">

            <div>

                <div class="w-20 h-20 rounded-full bg-pink-100 flex justify-center items-center">

                    <i class="fa-solid fa-plus text-4xl text-pink-500"></i>

                </div>

                <h2 class="text-3xl font-bold mt-6">

                    Add Product

                </h2>

                <p class="text-gray-500 mt-3">

                    Add a new baby product to your store.

                </p>

            </div>

            <i class="fa-solid fa-arrow-right text-4xl text-pink-300 group-hover:text-pink-500 duration-300"></i>

        </div>

    </a>



    <!-- UPDATE PRODUCT -->

    <a href="UpdateProduct.jsp"
       class="group bg-white rounded-3xl p-10 card hover:shadow-2xl hover:-translate-y-2 duration-300">

        <div class="flex justify-between items-center">

            <div>

                <div class="w-20 h-20 rounded-full bg-sky-100 flex justify-center items-center">

                    <i class="fa-solid fa-pen text-4xl text-sky-500"></i>

                </div>

                <h2 class="text-3xl font-bold mt-6">

                    Update Product

                </h2>

                <p class="text-gray-500 mt-3">

                    Edit product information and pricing.

                </p>

            </div>

            <i class="fa-solid fa-arrow-right text-4xl text-sky-300 group-hover:text-sky-500 duration-300"></i>

        </div>

    </a>



    <!-- DELETE PRODUCT -->

    <a href="DeleteProduct.jsp"
       class="group bg-white rounded-3xl p-10 card hover:shadow-2xl hover:-translate-y-2 duration-300">

        <div class="flex justify-between items-center">

            <div>

                <div class="w-20 h-20 rounded-full bg-red-100 flex justify-center items-center">

                    <i class="fa-solid fa-trash text-4xl text-red-500"></i>

                </div>

                <h2 class="text-3xl font-bold mt-6">

                    Delete Product

                </h2>

                <p class="text-gray-500 mt-3">

                    Remove unwanted products from inventory.

                </p>

            </div>

            <i class="fa-solid fa-arrow-right text-4xl text-red-300 group-hover:text-red-500 duration-300"></i>

        </div>

    </a>



    <!-- VIEW PRODUCTS -->

    <a href="ViewProducts.jsp"
       class="group bg-white rounded-3xl p-10 card hover:shadow-2xl hover:-translate-y-2 duration-300">

        <div class="flex justify-between items-center">

            <div>

                <div class="w-20 h-20 rounded-full bg-green-100 flex justify-center items-center">

                    <i class="fa-solid fa-box-open text-4xl text-green-500"></i>

                </div>

                <h2 class="text-3xl font-bold mt-6">

                    View Products

                </h2>

                <p class="text-gray-500 mt-3">

                    View all products available in the store.

                </p>

            </div>

            <i class="fa-solid fa-arrow-right text-4xl text-green-300 group-hover:text-green-500 duration-300"></i>

        </div>

    </a>

</div>


<!-- ================= FOOTER ================= -->

<div class="mx-10 mt-16 mb-8">

    <div class="bg-white rounded-3xl shadow-lg px-8 py-6 flex justify-between items-center">

        <div>

            <h2 class="text-xl font-bold">

                FirstSmile Admin Dashboard

            </h2>

            <p class="text-gray-500">

                Manage your baby products with ease.

            </p>

        </div>

        <div class="flex gap-6 text-2xl">

            <i class="fa-brands fa-facebook text-blue-600 hover:scale-125 duration-300 cursor-pointer"></i>

            <i class="fa-brands fa-instagram text-pink-500 hover:scale-125 duration-300 cursor-pointer"></i>

            <i class="fa-brands fa-twitter text-sky-500 hover:scale-125 duration-300 cursor-pointer"></i>

            <i class="fa-brands fa-youtube text-red-500 hover:scale-125 duration-300 cursor-pointer"></i>

        </div>

    </div>

</div>

</div>

</body>

</html>