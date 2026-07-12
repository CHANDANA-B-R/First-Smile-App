<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>FirstSmile | View Users</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

</head>

<body class="bg-pink-50 overflow-hidden">

<!-- Paste the SAME HEADER from add-product.html -->

<!-- Paste the SAME NAVBAR from add-product.html -->
<header class="bg-pink-400 text-white shadow-md">

        <div class="max-w-7xl mx-auto px-8 py-5 flex justify-between items-center">

            <div>

                <h1 class="text-3xl font-bold">

                    😊 FirstSmile

                </h1>

                <p class="text-sm">

                    Admin Dashboard

                </p>

            </div>

            <nav class="flex items-center gap-8 text-lg">

                <a href="adminDashboard.jsp" class="hover:text-pink-200">

                    <i class="fa-solid fa-house"></i>

                    Dashboard

                </a>

                <a href="addProduct.jsp" class="font-semibold">

                    <i class="fa-solid fa-box"></i>

                    Products

                </a>

                <a href="users.jsp" class="hover:text-pink-200">

                    <i class="fa-solid fa-users"></i>

                    Users

                </a>

                <a href="payments.jsp" class="hover:text-pink-200">

                    <i class="fa-solid fa-credit-card"></i>

                    Payments

                </a>

                <a href="logout" class="hover:text-red-200">

                    <i class="fa-solid fa-right-from-bracket"></i>

                    Logout

                </a>

            </nav>

        </div>

    </header>

    <!-- MAIN CONTENT -->
<!-- ================= VIEW USERS ================= -->

<div class="max-w-7xl mx-auto px-8 py-8">

    <div class="flex justify-between items-center mb-8">

        <div>

            <h2 class="text-4xl font-bold text-pink-400">

                <i class="fa-solid fa-users"></i>

                Registered Users

            </h2>

            <p class="text-gray-500 mt-2">

                View all users registered in FirstSmile.

            </p>

        </div>

        <form
            action="SearchUserServlet"
            method="get"
            class="flex gap-3">

            <input
                type="text"
                id="searchUser"
                name="searchUser"
                placeholder="Search by Name or Email"
                class="w-72 px-4 py-3 border-2 border-pink-300 rounded-lg focus:outline-none focus:border-pink-500">

            <button
                type="submit"
                class="bg-pink-400 hover:bg-pink-400 text-white px-6 rounded-lg">

                <i class="fa-solid fa-magnifying-glass"></i>

                Search

            </button>

        </form>

    </div>

    <div class="bg-white rounded-2xl shadow-lg overflow-hidden">

        <table class="w-full">

            <thead class="bg-pink-400 text-white">

                <tr>

                    <th class="py-4">User ID</th>

                    <th>Name</th>

                    <th>Email</th>

                    <th>Phone</th>

                    <th>Actions</th>

                </tr>

            </thead>

            <tbody>

                <!--

                Servlet/JSP will display users here.

                Example:

                <tr>

                    <td>1</td>

                    <td>John</td>

                    <td>john@gmail.com</td>

                    <td>9876543210</td>

                    <td>

                        👁️ 🗑️

                    </td>

                </tr>

                -->

            </tbody>

        </table>

    </div>

</div>

<!-- Paste the SAME FOOTER from add-product.html -->
    