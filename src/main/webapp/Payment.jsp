<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" name="paymentHtml">

<head name="paymentHead">
    <meta charset="UTF-8" name="charsetMeta">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title name="paymentTitle">Payment</title>

    <script src="https://cdn.tailwindcss.com" name="tailwindScript"></script>
</head>

<body
    name="paymentBody"
    class="h-screen overflow-hidden bg-gradient-to-br from-pink-50 via-white to-sky-50 text-slate-800">

    <!-- Small Navbar -->
    <nav
        name="paymentNavbar"
        class="h-14 px-8 bg-white border-b border-pink-100 flex items-center justify-between">

        <h1 name="brandName" class="text-xl font-bold">
            <span name="brandPink" class="text-pink-400">First</span>
            <span name="brandBlue" class="text-sky-500">Smile</span>
        </h1>

        <p name="secureNavbarText" class="text-sm font-medium text-slate-500">
            🔒 Secure Payment
        </p>
    </nav>

    <!-- Main Container -->
    <main
        name="paymentMain"
        class="h-[calc(100vh-3.5rem)] flex items-center justify-center px-6 py-4">

        <section
            name="paymentSection"
            class="w-full max-w-4xl grid grid-cols-1 md:grid-cols-5 gap-4">

            <!-- Payment Card -->
            <div
                name="paymentCard"
                class="md:col-span-3 bg-white rounded-2xl border border-pink-100 shadow-md p-5">

                <div name="paymentHeader" class="mb-4">
                    <h2 name="paymentHeading" class="text-xl font-bold">
                        Payment
                    </h2>

                    <p name="paymentSubtitle" class="text-xs text-slate-500 mt-1">
                        Select your payment method.
                    </p>
                </div>

                <form name="paymentForm" action="#" method="post">

                    <!-- Card -->
                    <label
                        name="cardOption"
                        class="flex items-center justify-between border-2 border-pink-300 bg-pink-50 rounded-xl px-4 py-3 mb-2 cursor-pointer">

                        <div name="cardOptionContent" class="flex items-center gap-3">
                            <span
                                name="cardIcon"
                                class="w-8 h-8 bg-pink-100 text-pink-500 rounded-lg flex items-center justify-center">
                                💳
                            </span>

                            <span name="cardText" class="text-sm font-semibold">
                                Credit / Debit Card
                            </span>
                        </div>

                        <input
                            name="paymentMethod"
                            type="radio"
                            value="card"
                            checked
                            class="w-4 h-4 accent-pink-500">
                    </label>

                    <!-- PhonePe -->
                    <label
                        name="phonePeOption"
                        class="flex items-center justify-between border border-slate-200 rounded-xl px-4 py-3 mb-2 cursor-pointer hover:bg-pink-50">

                        <div name="phonePeContent" class="flex items-center gap-3">
                            <span
                                name="phonePeIcon"
                                class="w-8 h-8 bg-purple-600 text-white rounded-full flex items-center justify-center text-xs font-bold">
                                पे
                            </span>

                            <span name="phonePeText" class="text-sm font-semibold">
                                PhonePe
                            </span>
                        </div>

                        <input
                            name="paymentMethod"
                            type="radio"
                            value="phonepe"
                            class="w-4 h-4 accent-pink-500">
                    </label>

                    <!-- UPI -->
                    <label
                        name="upiOption"
                        class="flex items-center justify-between border border-slate-200 rounded-xl px-4 py-3 mb-2 cursor-pointer hover:bg-sky-50">

                        <div name="upiContent" class="flex items-center gap-3">
                            <span
                                name="upiIcon"
                                class="w-8 h-8 bg-sky-100 text-sky-600 rounded-lg flex items-center justify-center text-xs font-bold">
                                UPI
                            </span>

                            <span name="upiText" class="text-sm font-semibold">
                                UPI
                            </span>
                        </div>

                        <input
                            name="paymentMethod"
                            type="radio"
                            value="upi"
                            class="w-4 h-4 accent-sky-500">
                    </label>

                    <!-- Net Banking -->
                    <label
                        name="netBankingOption"
                        class="flex items-center justify-between border border-slate-200 rounded-xl px-4 py-3 mb-4 cursor-pointer hover:bg-sky-50">

                        <div name="netBankingContent" class="flex items-center gap-3">
                            <span
                                name="netBankingIcon"
                                class="w-8 h-8 bg-sky-100 text-sky-600 rounded-lg flex items-center justify-center text-sm">
                                🏦
                            </span>

                            <span name="netBankingText" class="text-sm font-semibold">
                                Net Banking
                            </span>
                        </div>

                        <input
                            name="paymentMethod"
                            type="radio"
                            value="netbanking"
                            class="w-4 h-4 accent-sky-500">
                    </label>

                    <!-- Card Number -->
                    <div name="cardNumberContainer" class="mb-4">
                        <label
                            name="cardNumberLabel"
                            for="cardNumber"
                            class="block text-xs font-semibold text-slate-500 mb-1">
                            Card Number
                        </label>

                        <input
                            name="cardNumber"
                            id="cardNumber"
                            type="text"
                            placeholder="1234 5678 9012 3456"
                            class="w-full border border-slate-200 rounded-lg px-3 py-2.5 text-sm outline-none focus:border-pink-400 focus:ring-2 focus:ring-pink-100">
                    </div>

                    <!-- Pay Button -->
                    <button
                        name="payButton"
                        type="submit"
                        class="w-full bg-pink-400 hover:bg-pink-500 text-white text-sm font-semibold py-3 rounded-lg transition">
                        Pay ₹2,490
                    </button>

                    <p
                        name="securityText"
                        class="text-center text-[11px] text-slate-400 mt-3">
                        🔒 Secure and encrypted payment
                    </p>

                </form>
            </div>

            <!-- Small Order Summary -->
            <aside
                name="orderSummary"
                class="md:col-span-2 bg-white rounded-2xl border border-sky-100 shadow-md overflow-hidden">

                <div
                    name="summaryHeader"
                    class="bg-sky-50 px-5 py-4">

                    <h2 name="summaryHeading" class="text-lg font-bold">
                        Order Summary
                    </h2>
                </div>

                <div name="summaryBody" class="p-5">

                    <div
                        name="productRow"
                        class="flex justify-between text-sm mb-3">

                        <span name="productLabel" class="text-slate-500">
                            Product
                        </span>

                        <span name="productPrice" class="font-medium">
                            ₹2,200
                        </span>
                    </div>

                    <div
                        name="deliveryRow"
                        class="flex justify-between text-sm mb-3">

                        <span name="deliveryLabel" class="text-slate-500">
                            Delivery
                        </span>

                        <span name="deliveryPrice" class="font-medium">
                            ₹40
                        </span>
                    </div>

                    <div
                        name="discountRow"
                        class="flex justify-between text-sm mb-4">

                        <span name="discountLabel" class="text-slate-500">
                            Discount
                        </span>

                        <span name="discountPrice" class="font-medium text-pink-500">
                            - ₹250
                        </span>
                    </div>

                    <hr name="summaryDivider" class="border-slate-200 mb-4">

                    <div
                        name="totalRow"
                        class="flex justify-between items-center">

                        <span name="totalLabel" class="font-bold">
                            Total Amount
                        </span>

                        <span name="totalPrice" class="text-xl font-bold text-pink-500">
                            ₹2,490
                        </span>
                    </div>

                    <div
                        name="secureBox"
                        class="mt-5 bg-sky-50 border border-sky-100 rounded-xl p-3">

                        <p
                            name="secureBoxHeading"
                            class="text-sm font-semibold text-sky-600">
                            100% Secure Payment
                        </p>

                        <p
                            name="secureBoxText"
                            class="text-[11px] text-slate-500 mt-1">
                            Your payment information is protected.
                        </p>
                    </div>

                </div>
            </aside>

        </section>
    </main>

</body>

</html>
```

