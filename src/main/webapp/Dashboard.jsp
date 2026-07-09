<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.firstsmile.dto.Product"%>
<%@page import="com.firstsmile.dto.Image"%>
<%@page import="com.firstsmile.daoimpl.ProductDAOImpl"%>
<%@page import="com.firstsmile.daoimpl.ImageDAOImpl"%>

<%
ProductDAOImpl productDAO = new ProductDAOImpl();
ImageDAOImpl imageDAO = new ImageDAOImpl();

List<Product> products = productDAO.getAllProducts();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>FirstSmile</title>

<script src="https://cdn.tailwindcss.com"></script>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>

<style>

body{

font-family:'Poppins',sans-serif;

background:#FFF8FB;

}

.logo{

font-size:42px;

font-weight:700;

line-height:36px;

}

.shadow-card{

box-shadow:0px 5px 20px rgba(0,0,0,.08);

}

</style>

</head>

<body>

<!-- NAVBAR -->

<nav class="bg-white sticky top-0 z-50 shadow">

<div class="max-w-7xl mx-auto flex justify-between items-center py-5 px-8">

<!-- Logo -->

<div class="flex items-center">

<div>

<h1 class="logo text-pink-500">

First

</h1>

<h1 class="logo text-sky-400 ml-8">

Smile

</h1>

<div class="flex justify-center">

<div class="w-28 h-3 border-b-[6px] border-pink-500 rounded-full"></div>

</div>

</div>

</div>

<!-- Search -->

<div class="w-[450px]">

<div class="relative">

<input

type="text"

placeholder="Search Baby Products..."

class="w-full rounded-full border-2 border-pink-200 py-3 pl-12 pr-5 outline-none focus:border-pink-400">

<i class="fa-solid fa-magnifying-glass absolute left-5 top-4 text-pink-400"></i>

</div>

</div>

<!-- Right -->

<div class="flex gap-8 items-center">

<a href="#" class="font-medium hover:text-pink-500">

Home

</a>

<a href="#" class="font-medium hover:text-pink-500">

Categories

</a>

<a href="#" class="font-medium hover:text-pink-500">

Orders

</a>

<div class="relative">

<i class="fa-solid fa-cart-shopping text-2xl text-pink-500"></i>

<span class="absolute -top-2 -right-3 bg-sky-400 text-white rounded-full w-5 h-5 text-xs flex justify-center items-center">

0

</span>

</div>

<i class="fa-solid fa-user-circle text-3xl text-sky-400"></i>

</div>

</div>

</nav>

<!-- HERO -->

<section class="max-w-7xl mx-auto mt-10">

<div class="rounded-3xl bg-gradient-to-r from-pink-100 to-sky-100">

<div class="grid md:grid-cols-2 items-center">

<div class="p-12">

<h1 class="text-6xl font-bold text-pink-500 leading-tight">

Everything Your Little One Needs

</h1>

<p class="text-gray-600 mt-6 text-lg">

Shop premium baby products with love, comfort and happiness only at FirstSmile.

</p>

<div class="mt-8 flex gap-5">

<button class="bg-pink-500 text-white px-8 py-4 rounded-full hover:bg-pink-600">

Shop Now

</button>

<button class="bg-sky-400 text-white px-8 py-4 rounded-full hover:bg-sky-500">

Explore

</button>

</div>

</div>

<div>

<img src="images/banner.png"

class="mx-auto w-[470px]">

</div>

</div>

</div>

</section>

<!-- Categories -->

<section class="max-w-7xl mx-auto mt-14">

<h2 class="text-3xl font-bold text-pink-500">

Shop by Category

</h2>

<div class="grid grid-cols-6 gap-6 mt-8">

<div class="bg-pink-100 rounded-3xl p-6 text-center shadow-card hover:scale-105 duration-300">

<div class="text-5xl">🍼</div>

<p class="mt-4 font-semibold">

Feeding

</p>

</div>

<div class="bg-sky-100 rounded-3xl p-6 text-center shadow-card hover:scale-105 duration-300">

<div class="text-5xl">🧸</div>

<p class="mt-4 font-semibold">

Toys

</p>

</div>

<div class="bg-pink-100 rounded-3xl p-6 text-center shadow-card hover:scale-105 duration-300">

<div class="text-5xl">🧼</div>

<p class="mt-4 font-semibold">

Soap

</p>

</div>

<div class="bg-sky-100 rounded-3xl p-6 text-center shadow-card hover:scale-105 duration-300">

<div class="text-5xl">👕</div>

<p class="mt-4 font-semibold">

Clothes

</p>

</div>

<div class="bg-pink-100 rounded-3xl p-6 text-center shadow-card hover:scale-105 duration-300">

<div class="text-5xl">🩲</div>

<p class="mt-4 font-semibold">

Diapers

</p>

</div>

<div class="bg-sky-100 rounded-3xl p-6 text-center shadow-card hover:scale-105 duration-300">

<div class="text-5xl">🎁</div>

<p class="mt-4 font-semibold">

Gift Sets

</p>

</div>

</div>

</section>

<!-- FEATURED PRODUCTS -->

<section class="max-w-7xl mx-auto mt-16">

<div class="flex justify-between items-center">

<h2 class="text-3xl font-bold text-pink-500">

Featured Products

</h2>

<a href="#" class="text-pink-500 font-semibold">

View All

</a>

</div>

<div class="grid grid-cols-4 gap-8 mt-10">
<%
for(Product p : products){

    Image img = imageDAO.getImageById(p.getImage_id());

    String imagePath="images/noimage.png";

    if(img!=null){
        imagePath=img.getFile_path();
    }
%>

<!-- Product Card -->

<div class="bg-white rounded-3xl shadow-card overflow-hidden hover:shadow-2xl hover:-translate-y-2 duration-300 relative">

    <!-- NEW Badge -->

    <div class="absolute top-4 left-4 z-10">

        <span class="bg-green-500 text-white text-xs px-3 py-1 rounded-full">

            NEW

        </span>

    </div>

    <!-- Wishlist -->

    <div class="absolute top-4 right-4 z-10">

        <button class="bg-white w-10 h-10 rounded-full shadow hover:bg-pink-500 hover:text-white duration-300">

            <i class="fa-regular fa-heart"></i>

        </button>

    </div>

    <!-- Image -->

    <div class="bg-pink-50 flex justify-center items-center h-64">

        <img src="<%=imagePath%>"

        class="h-52 object-contain hover:scale-110 duration-300">

    </div>

    <!-- Details -->

    <div class="p-5">

        <h3 class="text-lg font-semibold text-gray-700 h-14">

            <%=p.getProduct_name()%>

        </h3>

        <!-- Rating -->

        <div class="flex items-center mt-2">

            <div class="text-yellow-400">

                <i class="fa-solid fa-star"></i>

                <i class="fa-solid fa-star"></i>

                <i class="fa-solid fa-star"></i>

                <i class="fa-solid fa-star"></i>

                <i class="fa-solid fa-star-half-stroke"></i>

            </div>

            <span class="ml-2 text-gray-500 text-sm">

                (4.8)

            </span>

        </div>

        <!-- Price -->

        <div class="mt-3">

            <span class="text-3xl font-bold text-pink-500">

                ₹ <%=p.getProduct_price()%>

            </span>

        </div>

        <!-- Description -->

        <p class="text-gray-500 text-sm mt-3">

            Premium quality baby product specially designed for newborn babies.

        </p>

        <!-- Buttons -->

        <div class="grid grid-cols-2 gap-3 mt-6">

            <a href="CartServlet?action=add&id=<%=p.getProduct_id()%>"

            class="bg-sky-400 text-white py-3 rounded-full text-center font-semibold hover:bg-sky-500 duration-300">

                <i class="fa-solid fa-cart-shopping"></i>

                Add Cart

            </a>

            <a href="BuyNowServlet?id=<%=p.getProduct_id()%>"

            class="bg-pink-500 text-white py-3 rounded-full text-center font-semibold hover:bg-pink-600 duration-300">

                Buy Now

            </a>

        </div>

    </div>

</div>

<%
}
%>

</div>

</section>

<!-- Offer Banner -->

<section class="max-w-7xl mx-auto mt-20">

<div class="rounded-3xl bg-gradient-to-r from-pink-200 to-sky-200">

<div class="grid md:grid-cols-2 items-center">

<div class="p-12">

<div class="inline-block bg-white rounded-full px-5 py-2">

<span class="text-pink-500 font-bold">

FLAT 50% OFF

</span>

</div>

<h1 class="text-5xl font-bold text-pink-600 mt-5">

On Baby Care Essentials

</h1>

<p class="text-gray-700 mt-4 text-lg">

Hurry! Limited time offer for your little one's favourite products.

</p>

<button class="mt-8 bg-pink-500 text-white px-8 py-4 rounded-full hover:bg-pink-600">

Shop Deals

</button>

</div>

<div>

<img src="images/offer.png"

class="mx-auto w-[430px]">

</div>

</div>

</div>

</section>
<!-- WHY CHOOSE FIRSTSMILE -->

<section class="max-w-7xl mx-auto mt-20">

    <h2 class="text-3xl font-bold text-pink-500 text-center">
        Why Choose FirstSmile?
    </h2>

    <div class="grid md:grid-cols-4 gap-8 mt-12">

        <div class="bg-white rounded-3xl p-8 shadow-card text-center hover:scale-105 duration-300">

            <div class="w-20 h-20 bg-pink-100 rounded-full flex items-center justify-center mx-auto">

                <i class="fa-solid fa-truck text-4xl text-pink-500"></i>

            </div>

            <h3 class="font-bold text-xl mt-6">
                Free Delivery
            </h3>

            <p class="text-gray-500 mt-3">
                Free shipping on all orders above ₹499.
            </p>

        </div>

        <div class="bg-white rounded-3xl p-8 shadow-card text-center hover:scale-105 duration-300">

            <div class="w-20 h-20 bg-sky-100 rounded-full flex items-center justify-center mx-auto">

                <i class="fa-solid fa-credit-card text-4xl text-sky-500"></i>

            </div>

            <h3 class="font-bold text-xl mt-6">
                Secure Payment
            </h3>

            <p class="text-gray-500 mt-3">
                100% secure online payment with multiple options.
            </p>

        </div>

        <div class="bg-white rounded-3xl p-8 shadow-card text-center hover:scale-105 duration-300">

            <div class="w-20 h-20 bg-pink-100 rounded-full flex items-center justify-center mx-auto">

                <i class="fa-solid fa-rotate-left text-4xl text-pink-500"></i>

            </div>

            <h3 class="font-bold text-xl mt-6">
                Easy Returns
            </h3>

            <p class="text-gray-500 mt-3">
                Hassle-free returns within 7 days.
            </p>

        </div>

        <div class="bg-white rounded-3xl p-8 shadow-card text-center hover:scale-105 duration-300">

            <div class="w-20 h-20 bg-sky-100 rounded-full flex items-center justify-center mx-auto">

                <i class="fa-solid fa-headset text-4xl text-sky-500"></i>

            </div>

            <h3 class="font-bold text-xl mt-6">
                24 × 7 Support
            </h3>

            <p class="text-gray-500 mt-3">
                Friendly customer support whenever you need us.
            </p>

        </div>

    </div>

</section>

<!-- NEWSLETTER -->

<section class="max-w-7xl mx-auto mt-20">

<div class="rounded-3xl bg-gradient-to-r from-pink-100 to-sky-100 p-12">

<div class="grid md:grid-cols-2 items-center">

<div>

<h2 class="text-4xl font-bold text-pink-500">

Stay Updated!

</h2>

<p class="text-gray-600 mt-4">

Subscribe to receive parenting tips, offers and latest arrivals.

</p>

</div>

<div class="mt-8 md:mt-0">

<div class="flex">

<input
type="email"
placeholder="Enter your email"

class="w-full rounded-l-full py-4 px-6 outline-none">

<button

class="bg-pink-500 text-white px-8 rounded-r-full hover:bg-pink-600">

Subscribe

</button>

</div>

</div>

</div>

</div>

</section>

<!-- FOOTER -->

<footer class="bg-white mt-20 shadow-inner">

<div class="max-w-7xl mx-auto py-14 px-8">

<div class="grid md:grid-cols-4 gap-10">

<!-- Logo -->

<div>

<h1 class="text-5xl font-bold text-pink-500">

First

</h1>

<h1 class="text-5xl font-bold text-sky-400 -mt-2 ml-10">

Smile

</h1>

<div class="w-28 h-2 bg-pink-400 rounded-full mt-2 ml-2"></div>

<p class="text-gray-500 mt-6">

Your trusted shopping destination for baby essentials.

</p>

</div>

<!-- Quick Links -->

<div>

<h2 class="font-bold text-xl text-pink-500 mb-5">

Quick Links

</h2>

<ul class="space-y-3">

<li><a href="#" class="hover:text-pink-500">Home</a></li>

<li><a href="#" class="hover:text-pink-500">Categories</a></li>

<li><a href="#" class="hover:text-pink-500">Offers</a></li>

<li><a href="#" class="hover:text-pink-500">Contact</a></li>

</ul>

</div>

<!-- Customer -->

<div>

<h2 class="font-bold text-xl text-pink-500 mb-5">

Customer Care

</h2>

<ul class="space-y-3">

<li>Help Center</li>

<li>Shipping Policy</li>

<li>Returns</li>

<li>Privacy Policy</li>

<li>Terms & Conditions</li>

</ul>

</div>

<!-- Contact -->

<div>

<h2 class="font-bold text-xl text-pink-500 mb-5">

Connect

</h2>

<div class="flex gap-5 text-3xl">

<i class="fab fa-facebook text-blue-600 hover:scale-125 duration-300 cursor-pointer"></i>

<i class="fab fa-instagram text-pink-500 hover:scale-125 duration-300 cursor-pointer"></i>

<i class="fab fa-twitter text-sky-500 hover:scale-125 duration-300 cursor-pointer"></i>

<i class="fab fa-youtube text-red-500 hover:scale-125 duration-300 cursor-pointer"></i>

</div>

<p class="mt-6 text-gray-500">

📞 +91 9876543210

</p>

<p class="mt-2 text-gray-500">

✉ support@firstsmile.com

</p>

</div>

</div>

<hr class="my-8">

<div class="flex flex-col md:flex-row justify-between items-center">

<p class="text-gray-500">

© 2026 FirstSmile. All Rights Reserved.

</p>

<p class="text-pink-500 font-semibold mt-4 md:mt-0">

Made with ❤️ for Happy Babies

</p>

</div>

</div>

</footer>

</body>
</html>