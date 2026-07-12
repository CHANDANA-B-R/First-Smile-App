<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>FirstSmile | Update Product</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

</head>

<body class="bg-pink-50 h-screen overflow-hidden">

<div class="flex flex-col h-screen">

    <!-- HEADER -->

    <header class="bg-pink-400 shadow-lg text-white">

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

                <a href="admin-dashboard.html"
                   class="hover:text-pink-200">

                    <i class="fa-solid fa-house"></i>

                    Dashboard

                </a>

                <a href="add-product.html"
                   class="hover:text-pink-200">

                    <i class="fa-solid fa-box"></i>

                    Products

                </a>

                <a href="view-users.html"
                   class="hover:text-pink-200">

                    <i class="fa-solid fa-users"></i>

                    Users

                </a>

                <a href="payments.html"
                   class="hover:text-pink-200">

                    <i class="fa-solid fa-credit-card"></i>

                    Payments

                </a>

                <a href="login.html"
                   class="hover:text-red-200">

                    <i class="fa-solid fa-right-from-bracket"></i>

                    Logout

                </a>

            </nav>

        </div>

    </header>

    <!-- MAIN -->

    <main class="flex-1 overflow-y-auto">

        <div class="max-w-6xl mx-auto p-8">

            <div class="flex justify-between items-center">

                <div>

                    <h2 class="text-4xl font-bold text-pink-400">

                        Hello, Welcome Admin 👋

                    </h2>

                    <p class="text-gray-500 mt-2">

                        Update existing product details.

                    </p>

                </div>

                <div class="w-16 h-16 rounded-full bg-pink-400 text-white
                            flex justify-center items-center text-2xl">

                    <i class="fa-solid fa-user"></i>

                </div>

            </div>

            <!-- PAGE TITLE -->

            <div class="mt-10">

                <h2 class="text-3xl font-bold text-pink-400">

                    <i class="fa-solid fa-pen-to-square"></i>

                    Update Product

                </h2>

                <p class="text-gray-500">

                    Edit the selected product details.

                </p>

            </div>

            <!-- FORM -->

            <div class="bg-white rounded-2xl shadow-lg mt-8 p-8">

                <form
                    action="UpdateProductServlet"
                    method="post"
                    enctype="multipart/form-data">

                    <input
                        type="hidden"
                        id="productId"
                        name="productId">

                    <div class="grid grid-cols-2 gap-8">
<!-- Product Name -->

<div>

    <label for="productName"
        class="block text-lg font-semibold text-gray-700 mb-2">

        Product Name

    </label>

    <input
        type="text"
        id="productName"
        name="productName"
        placeholder="Enter Product Name"
        required
        class="w-full border-2 border-pink-200 rounded-lg px-4 py-3 focus:outline-none focus:border-pink-400">

</div>

<!-- Product Price -->

<div>

    <label for="productPrice"
        class="block text-lg font-semibold text-gray-700 mb-2">

        Product Price

    </label>

    <input
        type="number"
        id="productPrice"
        name="productPrice"
        placeholder="Enter Product Price"
        required
        class="w-full border-2 border-pink-200 rounded-lg px-4 py-3 focus:outline-none focus:border-pink-400">

</div>

<!-- Current Product Image -->

<div>

    <label
        class="block text-lg font-semibold text-gray-700 mb-2">

        Current Product Image

    </label>

    <div class="border-2 border-pink-200 rounded-xl p-4 bg-pink-50">

        <img
            id="currentImage"
            src="images/no-image.png"
            alt="Product Image"
            class="w-48 h-48 object-cover rounded-lg mx-auto">

    </div>

</div>

<!-- Upload New Image -->

<div>

    <label for="productImage"
        class="block text-lg font-semibold text-gray-700 mb-2">

        Choose New Image

    </label>

    <input
        type="file"
        id="productImage"
        name="productImage"
        accept="image/*"
        class="w-full border-2 border-pink-200 rounded-lg px-4 py-3
        file:bg-pink-400
        file:text-white
        file:border-0
        file:px-5
        file:py-2
        file:rounded-lg
        file:cursor-pointer">

</div>

<!-- Buttons -->

<div class="col-span-2 flex justify-end gap-4 mt-6">

    <button
        type="reset"
        class="px-8 py-3 rounded-lg bg-gray-300 hover:bg-gray-400">

        Cancel

    </button>

    <button
        type="submit"
        class="px-8 py-3 rounded-lg bg-pink-400 text-white hover:bg-pink-300">

        <i class="fa-solid fa-pen-to-square"></i>

        Update Product

    </button>

</div>

                </div>

            </form>    </div>

        <!-- FOOTER -->

        <footer
            class="mt-10 bg-pink-400 text-white rounded-xl shadow-lg">

            <div class="py-5 text-center">

                <h3 class="text-xl font-semibold">

                    😊 FirstSmile

                </h3>

                <p class="mt-2 text-sm">

                    Admin Dashboard | Manage Products Easily

                </p>

                <p class="mt-3 text-sm">

                    © 2026 FirstSmile | All Rights Reserved

                </p>

            </div>

        </footer>

    </main>

</div>

</body>

</html>
    