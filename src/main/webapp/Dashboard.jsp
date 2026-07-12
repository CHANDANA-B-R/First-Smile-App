<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.firstsmile.dto.Product"%>
<%@page import="com.firstsmile.dto.User"%>
<%@page import="java.util.List"%>
<%@page import="com.firstsmile.dao.ImageDAO"%>
<%@page import="com.firstsmile.daoimpl.ImageDAOImpl"%>
<%@page import="com.firstsmile.daoimpl.ProductDAOImpl"%>
<%@page import="com.firstsmile.dao.ProductDAO"%>
<%@page import="com.firstsmile.dto.Image"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="true"%>
<%
    // FIX: "user" was used all over this page (user.getName(), etc.)
    // but was never declared or pulled off the session, so the page
    // could not compile. Your Login servlet stores the logged-in user
    // under the session key "baby" (session.setAttribute("baby", user)),
    // so that's the key we have to read here too.
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    // Moved up from further down the page: ProductList is referenced by
    // the sidebar "Products" badge and the toolbar result count, both of
    // which render before the products-grid loop used to appear, so it
    // has to be fetched before any of that markup, not right above the grid.
    ProductDAO pdao = new ProductDAOImpl();
    ImageDAO idao = new ImageDAOImpl();
    List<Product> ProductList = pdao.getAllProducts();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FirstSmile | Dashboard</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

/* ============================================================
   RESET & BASE
   ============================================================ */
*, *::before, *::after {
  margin: 0; padding: 0; box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}

:root {
  --pink:      #ff82b6;
  --pink-dark: #ff4d9e;
  --cyan:      #12c7ff;
  --green:     #27c98a;
  --yellow:    #ffb648;
  --red:       #ff6b81;
  --bg:        #f4f7fc;
  --sidebar-w: 260px;
  --card-r:    20px;
  --shadow:    0 8px 28px rgba(0,0,0,.07);
  --shadow-hov:0 18px 42px rgba(0,0,0,.13);
  --txt-dark:  #1e2a38;
  --txt-mid:   #5a6a7e;
  --txt-light: #9aaabb;
  --border:    #eaeff6;
}

html { scroll-behavior: smooth; }

body {
  background: var(--bg);
  color: var(--txt-dark);
  min-height: 100vh;
  display: flex;
  overflow-x: hidden;
}

a { text-decoration: none; color: inherit; }
button { cursor: pointer; border: none; outline: none; background: none; }
img { display: block; max-width: 100%; }

/* ============================================================
   SIDEBAR
   ============================================================ */
.sidebar {
  width: var(--sidebar-w);
  min-height: 100vh;
  background: white;
  position: fixed;
  left: 0; top: 0;
  display: flex;
  flex-direction: column;
  padding: 28px 0 24px;
  box-shadow: 4px 0 20px rgba(0,0,0,.05);
  z-index: 200;
  transition: transform .35s cubic-bezier(.16,1,.3,1);
}

.sidebar-brand {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 0 24px 28px;
  border-bottom: 1.5px solid var(--border);
}

.brand-icon {
  width: 44px; height: 44px;
  border-radius: 14px;
  background: linear-gradient(135deg, var(--pink), var(--pink-dark));
  display: flex; align-items: center; justify-content: center;
  font-size: 22px;
  box-shadow: 0 6px 16px rgba(255,77,158,.3);
  flex-shrink: 0;
}

.brand-text { font-size: 19px; font-weight: 700; line-height: 1.1; }
.brand-text span:first-child { color: var(--pink-dark); }
.brand-text span:last-child  { color: var(--cyan); }
.brand-sub { font-size: 10px; color: var(--txt-light); font-weight: 400; letter-spacing: .5px; }

.sidebar-nav {
  flex: 1;
  padding: 20px 12px;
  display: flex;
  flex-direction: column;
  gap: 4px;
  overflow-y: auto;
}

.nav-section-label {
  font-size: 10px;
  font-weight: 600;
  color: var(--txt-light);
  letter-spacing: 1.5px;
  text-transform: uppercase;
  padding: 10px 12px 6px;
}

.nav-item {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 11px 14px;
  border-radius: 13px;
  font-size: 14px;
  font-weight: 500;
  color: var(--txt-mid);
  transition: all .22s ease;
  position: relative;
  white-space: nowrap;
}

.nav-item:hover {
  background: #fff5fa;
  color: var(--pink-dark);
}

.nav-item.active {
  background: linear-gradient(90deg, #fff0f7, #fff5fb);
  color: var(--pink-dark);
  font-weight: 600;
}

.nav-item.active::before {
  content: '';
  position: absolute;
  left: 0; top: 20%; bottom: 20%;
  width: 3.5px;
  border-radius: 0 4px 4px 0;
  background: linear-gradient(180deg, var(--pink), var(--pink-dark));
}

.nav-icon { font-size: 20px; flex-shrink: 0; }

.nav-badge {
  margin-left: auto;
  background: linear-gradient(135deg, var(--pink), var(--pink-dark));
  color: white;
  font-size: 10px;
  font-weight: 700;
  padding: 2px 7px;
  border-radius: 20px;
  min-width: 20px;
  text-align: center;
}

.nav-badge.cyan  { background: linear-gradient(135deg, var(--cyan), #0ea8e0); }
.nav-badge.green { background: linear-gradient(135deg, var(--green), #1faa7a); }

.sidebar-footer {
  padding: 16px 20px 0;
  border-top: 1.5px solid var(--border);
}

.sidebar-user {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 10px 12px;
  border-radius: 14px;
  transition: background .2s;
  cursor: pointer;
}

.sidebar-user:hover { background: #fff5fa; }

.user-av {
  width: 38px; height: 38px;
  border-radius: 50%;
  background: linear-gradient(135deg, var(--pink), var(--cyan));
  display: flex; align-items: center; justify-content: center;
  color: white; font-weight: 700; font-size: 15px;
  flex-shrink: 0;
}

.user-name  { font-size: 13px; font-weight: 600; color: var(--txt-dark); }
.user-role  { font-size: 11px; color: var(--txt-light); }
.user-more  { margin-left: auto; font-size: 18px; color: var(--txt-light); }

/* ============================================================
   MAIN LAYOUT
   ============================================================ */
.main-wrapper {
  margin-left: var(--sidebar-w);
  flex: 1;
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

.topbar {
  position: sticky; top: 0;
  background: rgba(255,255,255,.88);
  backdrop-filter: blur(14px);
  -webkit-backdrop-filter: blur(14px);
  border-bottom: 1.5px solid var(--border);
  padding: 14px 32px;
  display: flex;
  align-items: center;
  gap: 16px;
  z-index: 100;
}

.topbar-title {
  font-size: 18px;
  font-weight: 700;
  color: var(--txt-dark);
  flex: 1;
}

.topbar-title span { color: var(--pink-dark); }

.search-wrap {
  position: relative;
  width: 280px;
}

.search-wrap input {
  width: 100%;
  padding: 10px 16px 10px 40px;
  border: 1.5px solid var(--border);
  border-radius: 40px;
  font-size: 13.5px;
  background: #f8fafc;
  color: var(--txt-dark);
  transition: all .25s;
  outline: none;
}

.search-wrap input::placeholder { color: var(--txt-light); }

.search-wrap input:focus {
  border-color: var(--pink);
  background: white;
  box-shadow: 0 0 0 4px rgba(255,130,182,.12);
}

.search-icon {
  position: absolute;
  left: 13px; top: 50%;
  transform: translateY(-50%);
  font-size: 17px;
  color: var(--txt-light);
}

.icon-btn {
  width: 40px; height: 40px;
  border-radius: 12px;
  background: #f4f7fc;
  display: flex; align-items: center; justify-content: center;
  font-size: 19px;
  color: var(--txt-mid);
  transition: all .2s;
  position: relative;
  cursor: pointer;
  border: 1.5px solid var(--border);
}

.icon-btn:hover { background: #fff0f7; color: var(--pink-dark); border-color: var(--pink); }

.notif-dot {
  position: absolute;
  top: 7px; right: 7px;
  width: 8px; height: 8px;
  border-radius: 50%;
  background: var(--pink-dark);
  border: 2px solid white;
}

.tb-avatar {
  width: 40px; height: 40px;
  border-radius: 50%;
  background: linear-gradient(135deg, var(--pink), var(--cyan));
  display: flex; align-items: center; justify-content: center;
  color: white; font-weight: 700; font-size: 15px;
  cursor: pointer;
  border: 2.5px solid white;
  box-shadow: 0 4px 12px rgba(255,82,158,.3);
  transition: transform .2s;
}

.tb-avatar:hover { transform: scale(1.08); }

.page-content {
  flex: 1;
  padding: 30px 32px 50px;
}

.stats-row {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 20px;
  margin-bottom: 32px;
}

.stat-card {
  background: white;
  border-radius: var(--card-r);
  padding: 22px 24px;
  box-shadow: var(--shadow);
  display: flex;
  align-items: center;
  gap: 16px;
  position: relative;
  overflow: hidden;
  transition: transform .25s, box-shadow .25s;
}

.stat-card:hover {
  transform: translateY(-5px);
  box-shadow: var(--shadow-hov);
}

.stat-card::after {
  content: '';
  position: absolute;
  top: -30px; right: -20px;
  width: 100px; height: 100px;
  border-radius: 50%;
  opacity: .07;
}

.stat-card.pink::after  { background: var(--pink-dark); }
.stat-card.cyan::after  { background: var(--cyan); }
.stat-card.green::after { background: var(--green); }
.stat-card.yellow::after{ background: var(--yellow); }

.stat-icon {
  width: 52px; height: 52px;
  border-radius: 16px;
  display: flex; align-items: center; justify-content: center;
  font-size: 24px;
  flex-shrink: 0;
}

.stat-card.pink  .stat-icon { background: #fff0f7; }
.stat-card.cyan  .stat-icon { background: #f0fcff; }
.stat-card.green .stat-icon { background: #f0fff8; }
.stat-card.yellow .stat-icon { background: #fff8ec; }

.stat-val  { font-size: 26px; font-weight: 700; color: var(--txt-dark); line-height: 1.1; }
.stat-lbl  { font-size: 12.5px; color: var(--txt-light); margin-top: 2px; }
.stat-trend{
  margin-left: auto;
  font-size: 12px;
  font-weight: 600;
  padding: 4px 10px;
  border-radius: 20px;
  align-self: flex-start;
}
.stat-trend.up   { background: #f0fff8; color: var(--green); }
.stat-trend.down { background: #fff0f3; color: var(--red); }

.section-head {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 22px;
  flex-wrap: wrap;
  gap: 12px;
}

.section-head h2 {
  font-size: 20px;
  font-weight: 700;
  color: var(--txt-dark);
}

.section-head h2 span { color: var(--pink-dark); }

.filter-chips {
  display: flex;
  gap: 8px;
  flex-wrap: wrap;
}

.chip {
  padding: 7px 16px;
  border-radius: 40px;
  font-size: 12.5px;
  font-weight: 500;
  border: 1.5px solid var(--border);
  color: var(--txt-mid);
  background: white;
  transition: all .2s;
  cursor: pointer;
}

.chip:hover { border-color: var(--pink); color: var(--pink-dark); }

.chip.active {
  background: linear-gradient(90deg, var(--pink), var(--pink-dark));
  border-color: transparent;
  color: white;
  box-shadow: 0 4px 14px rgba(255,77,158,.3);
}

.toolbar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 22px;
  gap: 12px;
  flex-wrap: wrap;
}

.result-count { font-size: 13px; color: var(--txt-light); }
.result-count strong { color: var(--txt-dark); font-weight: 600; }

.toolbar-right { display: flex; align-items: center; gap: 10px; }

.sort-select {
  padding: 8px 14px;
  border: 1.5px solid var(--border);
  border-radius: 40px;
  font-size: 13px;
  color: var(--txt-mid);
  background: white;
  outline: none;
  cursor: pointer;
  font-family: 'Poppins', sans-serif;
  transition: border-color .2s;
}

.sort-select:focus { border-color: var(--pink); }

.view-btn {
  width: 36px; height: 36px;
  border-radius: 10px;
  border: 1.5px solid var(--border);
  display: flex; align-items: center; justify-content: center;
  font-size: 18px; color: var(--txt-light);
  background: white;
  transition: all .2s;
  cursor: pointer;
}

.view-btn.active, .view-btn:hover {
  border-color: var(--pink);
  color: var(--pink-dark);
  background: #fff5fa;
}

.products-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(230px, 1fr));
  gap: 22px;
}

.product-card {
  background: white;
  border-radius: var(--card-r);
  overflow: hidden;
  box-shadow: var(--shadow);
  transition: transform .28s cubic-bezier(.16,1,.3,1),
              box-shadow .28s cubic-bezier(.16,1,.3,1);
  display: flex;
  flex-direction: column;
  position: relative;
  border: 1.5px solid transparent;
}

.product-card:hover {
  transform: translateY(-8px);
  box-shadow: var(--shadow-hov);
  border-color: rgba(255,130,182,.25);
}

.wishlist-btn {
  position: absolute;
  top: 12px; right: 12px;
  width: 32px; height: 32px;
  border-radius: 50%;
  background: white;
  box-shadow: 0 3px 10px rgba(0,0,0,.1);
  display: flex; align-items: center; justify-content: center;
  font-size: 16px;
  z-index: 10;
  transition: transform .2s;
  cursor: pointer;
  border: none;
}

.wishlist-btn:hover { transform: scale(1.2); }
.wishlist-btn.liked { color: var(--red); }

.offer-badge {
  position: absolute;
  top: 12px; left: 12px;
  background: linear-gradient(135deg, #ff6b81, #ff4757);
  color: white;
  font-size: 10.5px;
  font-weight: 700;
  padding: 3px 9px;
  border-radius: 20px;
  z-index: 10;
  letter-spacing: .3px;
}

.ribbon {
  position: absolute;
  top: 0; left: 0;
  background: linear-gradient(90deg, var(--cyan), #0eb8f5);
  color: white;
  font-size: 9.5px;
  font-weight: 700;
  letter-spacing: 1px;
  text-transform: uppercase;
  padding: 4px 12px 4px 10px;
  border-radius: 0 0 14px 0;
  z-index: 10;
}

.ribbon.bestseller { background: linear-gradient(90deg, var(--yellow), #f5a020); }
.ribbon.new        { background: linear-gradient(90deg, var(--green),  #1faa7a); }
.ribbon.hot        { background: linear-gradient(90deg, var(--pink), var(--pink-dark)); }

.product-img-wrap {
  position: relative;
  background: linear-gradient(145deg, #fff8fb, #f5f8ff);
  height: 200px;
  display: flex; align-items: center; justify-content: center;
  overflow: hidden;
}

.product-img-wrap img {
  width: 100%; height: 100%;
  object-fit: contain;
  padding: 12px;
  transition: transform .35s ease;
}

.product-card:hover .product-img-wrap img {
  transform: scale(1.06);
}

.product-body {
  padding: 14px 16px;
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.product-brand {
  font-size: 10.5px;
  font-weight: 600;
  color: var(--pink-dark);
  text-transform: uppercase;
  letter-spacing: .8px;
}

.product-name {
  font-size: 13.5px;
  font-weight: 600;
  color: var(--txt-dark);
  line-height: 1.4;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.product-desc {
  font-size: 11.5px;
  color: var(--txt-light);
  line-height: 1.5;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.rating-row {
  display: flex;
  align-items: center;
  gap: 6px;
  margin-top: 2px;
}

.stars {
  display: flex;
  gap: 1.5px;
}

.star { font-size: 13px; color: #dde3ee; }
.star.filled  { color: var(--yellow); }
.star.half    {
  position: relative;
  color: #dde3ee;
}
.star.half::before {
  content: '★';
  position: absolute; left: 0; top: 0;
  width: 50%; overflow: hidden;
  color: var(--yellow);
}

.rating-count {
  font-size: 11px;
  color: var(--txt-light);
  font-weight: 500;
}

.price-block {
  display: flex;
  align-items: baseline;
  gap: 8px;
  margin-top: 4px;
  flex-wrap: wrap;
}

.price-now {
  font-size: 20px;
  font-weight: 700;
  color: var(--pink-dark);
}

.price-old {
  font-size: 13px;
  color: var(--txt-light);
  text-decoration: line-through;
}

.price-off {
  font-size: 11.5px;
  font-weight: 600;
  color: var(--green);
  background: #f0fff8;
  padding: 2px 7px;
  border-radius: 20px;
}

.club-price {
  font-size: 11.5px;
  color: var(--txt-mid);
  display: flex;
  align-items: center;
  gap: 4px;
}

.club-icon {
  width: 16px; height: 16px;
  border-radius: 50%;
  background: linear-gradient(135deg, var(--cyan), #0eb8f5);
  display: flex; align-items: center; justify-content: center;
  font-size: 8px; color: white; font-weight: 700;
  flex-shrink: 0;
}

.per-unit {
  font-size: 11px;
  color: var(--txt-light);
  margin-top: -2px;
}

.size-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 5px;
  margin-top: 4px;
}

.size-tag {
  font-size: 10.5px;
  padding: 3px 9px;
  border-radius: 20px;
  background: #f4f7fc;
  color: var(--txt-mid);
  border: 1px solid var(--border);
  font-weight: 500;
  cursor: pointer;
  transition: all .18s;
}

.size-tag:hover, .size-tag.active {
  background: linear-gradient(90deg, var(--pink), var(--pink-dark));
  color: white;
  border-color: transparent;
}

.product-footer {
  display: grid;
  grid-template-columns: 1fr auto;
  gap: 8px;
  padding: 12px 16px 14px;
  border-top: 1.5px solid var(--border);
}

.add-cart-btn {
  padding: 10px 14px;
  background: linear-gradient(90deg, var(--pink), var(--pink-dark));
  color: white;
  border-radius: 40px;
  font-size: 12.5px;
  font-weight: 600;
  border: none;
  cursor: pointer;
  transition: transform .22s, box-shadow .22s;
  box-shadow: 0 6px 18px rgba(255,77,158,.28);
  display: flex; align-items: center; justify-content: center; gap: 5px;
}

.add-cart-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 10px 24px rgba(255,77,158,.38);
}

.add-cart-btn:active { transform: scale(.96); }

.shortlist-btn {
  padding: 10px 14px;
  border: 1.5px solid var(--border);
  border-radius: 40px;
  font-size: 12px;
  font-weight: 600;
  color: var(--txt-mid);
  background: white;
  cursor: pointer;
  transition: all .2s;
  white-space: nowrap;
}

.shortlist-btn:hover {
  border-color: var(--pink);
  color: var(--pink-dark);
  background: #fff5fa;
}

.promo-strip {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 18px;
  margin-bottom: 32px;
}

.promo-card {
  border-radius: 18px;
  padding: 22px 24px;
  display: flex;
  align-items: center;
  gap: 16px;
  position: relative;
  overflow: hidden;
  cursor: pointer;
  transition: transform .25s;
}

.promo-card:hover { transform: translateY(-4px); }

.promo-card.p1 { background: linear-gradient(135deg, #fff0f7, #ffe0ef); }
.promo-card.p2 { background: linear-gradient(135deg, #f0faff, #ddf3ff); }
.promo-card.p3 { background: linear-gradient(135deg, #f3fff8, #ddfff0); }

.promo-card::after {
  content: '';
  position: absolute;
  right: -20px; bottom: -20px;
  width: 100px; height: 100px;
  border-radius: 50%;
  opacity: .12;
}
.promo-card.p1::after { background: var(--pink-dark); }
.promo-card.p2::after { background: var(--cyan); }
.promo-card.p3::after { background: var(--green); }

.promo-emoji { font-size: 38px; }
.promo-title { font-size: 15px; font-weight: 700; color: var(--txt-dark); margin-bottom: 3px; }
.promo-sub   { font-size: 12px; color: var(--txt-mid); }

.promo-card.p1 .promo-title { color: var(--pink-dark); }
.promo-card.p2 .promo-title { color: #0a9bd4; }
.promo-card.p3 .promo-title { color: #18a86e; }

.toast {
  position: fixed;
  bottom: 28px; right: 28px;
  background: white;
  padding: 14px 20px;
  border-radius: 14px;
  box-shadow: 0 14px 40px rgba(0,0,0,.13);
  display: flex; align-items: center; gap: 10px;
  font-size: 13.5px; font-weight: 500; color: var(--txt-dark);
  transform: translateY(100px);
  opacity: 0;
  transition: all .4s cubic-bezier(.16,1,.3,1);
  z-index: 999;
  border-left: 4px solid var(--green);
  min-width: 260px;
}

.toast.show { transform: translateY(0); opacity: 1; }
.toast.error { border-left-color: var(--red); }
.toast.warn  { border-left-color: var(--yellow); }

.hamburger {
  display: none;
  width: 38px; height: 38px;
  border-radius: 10px;
  background: #f4f7fc;
  border: 1.5px solid var(--border);
  align-items: center; justify-content: center;
  font-size: 20px; cursor: pointer; color: var(--txt-mid);
}

.overlay {
  display: none;
  position: fixed; inset: 0;
  background: rgba(0,0,0,.3);
  z-index: 150;
  backdrop-filter: blur(3px);
}

.pagination {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 8px;
  margin-top: 36px;
  flex-wrap: wrap;
}

.page-btn {
  width: 38px; height: 38px;
  border-radius: 11px;
  border: 1.5px solid var(--border);
  background: white;
  font-size: 13.5px; font-weight: 600;
  color: var(--txt-mid);
  cursor: pointer;
  display: flex; align-items: center; justify-content: center;
  transition: all .2s;
}

.page-btn:hover { border-color: var(--pink); color: var(--pink-dark); background: #fff5fa; }

.page-btn.active {
  background: linear-gradient(135deg, var(--pink), var(--pink-dark));
  border-color: transparent;
  color: white;
  box-shadow: 0 5px 16px rgba(255,77,158,.3);
}

.page-btn.arrow { font-size: 16px; }

@media (max-width: 1100px) {
  .stats-row { grid-template-columns: repeat(2, 1fr); }
  .promo-strip { grid-template-columns: 1fr 1fr; }
}

@media (max-width: 900px) {
  :root { --sidebar-w: 240px; }
  .products-grid { grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); }
}

@media (max-width: 768px) {
  .sidebar {
    transform: translateX(-100%);
  }
  .sidebar.open {
    transform: translateX(0);
    box-shadow: 8px 0 40px rgba(0,0,0,.15);
  }
  .main-wrapper { margin-left: 0; }
  .hamburger { display: flex; }
  .overlay { display: block; opacity: 0; pointer-events: none; transition: opacity .3s; }
  .overlay.show { opacity: 1; pointer-events: auto; }
  .topbar { padding: 12px 18px; }
  .search-wrap { width: 180px; }
  .page-content { padding: 20px 18px 50px; }
  .promo-strip { grid-template-columns: 1fr; }
  .stats-row { grid-template-columns: 1fr 1fr; gap: 14px; }
  .products-grid { grid-template-columns: repeat(2, 1fr); gap: 14px; }
}

@media (max-width: 460px) {
  .stats-row { grid-template-columns: 1fr; }
  .products-grid { grid-template-columns: 1fr; }
  .search-wrap { display: none; }
}

.ripple {
  position: absolute;
  border-radius: 50%;
  background: rgba(255,255,255,.5);
  transform: scale(0);
  animation: rippleA .6s linear;
  pointer-events: none;
}
@keyframes rippleA { to { transform: scale(3); opacity: 0; } }

@keyframes cardFadeUp {
  from { opacity: 0; transform: translateY(22px); }
  to   { opacity: 1; transform: translateY(0); }
}

.product-card {
  animation: cardFadeUp .45s ease both;
}

.product-card:nth-child(1)  { animation-delay: .05s; }
.product-card:nth-child(2)  { animation-delay: .10s; }
.product-card:nth-child(3)  { animation-delay: .15s; }
.product-card:nth-child(4)  { animation-delay: .20s; }
.product-card:nth-child(5)  { animation-delay: .25s; }
.product-card:nth-child(6)  { animation-delay: .30s; }
.product-card:nth-child(7)  { animation-delay: .35s; }
.product-card:nth-child(8)  { animation-delay: .40s; }

</style>
</head>

<body>

<!-- ============================================================
     SIDEBAR
     ============================================================ -->
<aside class="sidebar" id="sidebar">

  <div class="sidebar-brand">
    <div class="brand-icon">🍼</div>
    <div>
      <div class="brand-text">
        <span>First</span><span>Smile</span>
      </div>
      <div class="brand-sub">Baby & Kids Store</div>
    </div>
  </div>

  <nav class="sidebar-nav">

    <span class="nav-section-label">Main</span>

    <a class="nav-item active" href="#">
      <span class="nav-icon">🏠</span> Dashboard
    </a>

    <a class="nav-item" href="#">
      <span class="nav-icon">📦</span> Products
      <span class="nav-badge"><%=ProductList.size()%></span>
    </a>

    <a class="nav-item" href="#">
      <span class="nav-icon">🛒</span> Orders
      <span class="nav-badge cyan">14</span>
    </a>

    <a class="nav-item" href="#">
      <span class="nav-icon">❤️</span> Wishlist
      <span class="nav-badge">6</span>
    </a>

    <a class="nav-item" href="#">
      <span class="nav-icon">🔔</span> Notifications
      <span class="nav-badge">3</span>
    </a>

    <span class="nav-section-label">Shop</span>

    <a class="nav-item" href="#">
      <span class="nav-icon">👶</span> Baby Care
    </a>

    <a class="nav-item" href="#">
      <span class="nav-icon">👗</span> Clothing
    </a>

    <a class="nav-item" href="#">
      <span class="nav-icon">🧸</span> Toys & Games
    </a>

    <a class="nav-item" href="#">
      <span class="nav-icon">🍼</span> Feeding
    </a>

    <a class="nav-item" href="#">
      <span class="nav-icon">🛏️</span> Nursery
    </a>

    <span class="nav-section-label">Account</span>

    <a class="nav-item" href="#">
      <span class="nav-icon">👤</span> My Profile
    </a>

    <a class="nav-item" href="#">
      <span class="nav-icon">📍</span> Addresses
    </a>

    <a class="nav-item" href="#">
      <span class="nav-icon">⚙️</span> Settings
    </a>

    <a class="nav-item" href="<%=request.getContextPath()%>/login.jsp" style="color:#ff6b81; margin-top:4px;">
      <span class="nav-icon">🚪</span> Sign Out
    </a>

  </nav>

  <div class="sidebar-footer">
    <div class="sidebar-user">
      <div class="user-av"><%=user.getName().charAt(0)%></div>
      <div>
        <div class="user-name"><%=user.getName()%></div>
        <div class="user-role">Happy Parent 👶</div>
      </div>
      <span class="user-more">›</span>
    </div>
  </div>

</aside>

<!-- Mobile overlay -->
<div class="overlay" id="overlay" onclick="closeSidebar()"></div>

<!-- ============================================================
     MAIN WRAPPER
     ============================================================ -->
<div class="main-wrapper">

  <!-- TOP BAR -->
  <header class="topbar">
    <button class="hamburger" id="hamburger" onclick="openSidebar()">☰</button>

    <div class="topbar-title">
      Welcome back, <span><%=user.getName()%></span> 👋
    </div>

    <div class="search-wrap">
      <span class="search-icon">🔍</span>
      <input type="text" placeholder="Search products…" id="searchInput" oninput="handleSearch()">
    </div>

    <div class="icon-btn" title="Cart" onclick="showToast('🛒 Cart opened!','success')">
      🛒
      <span class="notif-dot"></span>
    </div>

    <div class="icon-btn" title="Notifications" onclick="showToast('🔔 You have 3 new notifications','warn')">
      🔔
    </div>

    <div class="tb-avatar" title="My Profile"><%=user.getName().charAt(0)%></div>
  </header>

  <!-- PAGE CONTENT -->
  <main class="page-content">

    <!-- ── PROMO BANNERS ── -->
    <div class="promo-strip">
      <div class="promo-card p1" onclick="showToast('🎀 Offer applied!','success')">
        <div class="promo-emoji">🎀</div>
        <div>
          <div class="promo-title">New Arrivals!</div>
          <div class="promo-sub">Up to 40% off on Diapers & Wipes</div>
        </div>
      </div>
      <div class="promo-card p2" onclick="showToast('🚚 Free shipping activated!','success')">
        <div class="promo-emoji">🚚</div>
        <div>
          <div class="promo-title">Free Shipping</div>
          <div class="promo-sub">On all orders above ₹499</div>
        </div>
      </div>
      <div class="promo-card p3" onclick="showToast('🌿 Organic range loaded!','success')">
        <div class="promo-emoji">🌿</div>
        <div>
          <div class="promo-title">Go Organic</div>
          <div class="promo-sub">100% natural baby skincare</div>
        </div>
      </div>
    </div>

    <!-- ── PRODUCTS SECTION ── -->
    <div class="section-head">
      <h2>Featured <span>Products</span></h2>
      <div class="filter-chips">
        <button class="chip active" onclick="filterChip(this,'all')">All</button>
        <button class="chip" onclick="filterChip(this,'diapers')">Diapers</button>
        <button class="chip" onclick="filterChip(this,'clothing')">Clothing</button>
        <button class="chip" onclick="filterChip(this,'toys')">Toys</button>
        <button class="chip" onclick="filterChip(this,'feeding')">Feeding</button>
        <button class="chip" onclick="filterChip(this,'skincare')">Skincare</button>
      </div>
    </div>

    <div class="toolbar">
      <p class="result-count">Showing <strong id="countDisplay"><%=ProductList.size()%></strong> products</p>
      <div class="toolbar-right">
        <select class="sort-select" onchange="showToast('🔃 Sorted!','success')">
          <option>Sort: Popularity</option>
          <option>Price: Low to High</option>
          <option>Price: High to Low</option>
          <option>Newest First</option>
          <option>Discount</option>
        </select>
        <button class="view-btn active" title="Grid view">⊞</button>
        <button class="view-btn" title="List view">≡</button>
      </div>
    </div>

    <%
    
    %>

    <div class="products-grid" id="productsGrid">
      <%
      for (Product p : ProductList) {
          Image img = idao.getImageById(p.getImage_id());

     
          String descLower = (p.getDescription() == null ? "" : p.getDescription().toLowerCase());
          String nameLower = (p.getProduct_name() == null ? "" : p.getProduct_name().toLowerCase());
          String category = "diapers";
          if (nameLower.contains("onesie") || nameLower.contains("cotton") || nameLower.contains("clothing")) {
              category = "clothing";
          } else if (nameLower.contains("plush") || nameLower.contains("toy") || nameLower.contains("giraffe")) {
              category = "toys";
          } else if (nameLower.contains("bottle") || descLower.contains("colic")) {
              category = "feeding";
          } else if (nameLower.contains("lotion") || descLower.contains("dermatologist")) {
              category = "skincare";
          } else if (!nameLower.contains("diaper") && !nameLower.contains("pants")) {
              category = "diapers"; // fallback default
          }

          // Same story for ribbon/rating/discount — not in the schema yet,
          // so derive something deterministic-but-varied from product_id
          // instead of hardcoding 8 fake copies.
          int seed = p.getProduct_id() % 3;
          String ribbonClass = (seed == 0) ? "hot" : (seed == 1) ? "bestseller" : "new";
          String ribbonText  = (seed == 0) ? "Popular" : (seed == 1) ? "Bestseller" : "New";
      %>
      <div class="product-card" data-category="<%=category%>">
        <div class="ribbon <%=ribbonClass%>"><%=ribbonText%></div>
        <button class="wishlist-btn" onclick="toggleWishlist(this)">🤍</button>
        <div class="product-img-wrap">
          <img src="<%=img.getFile_path()%>" alt="<%=p.getProduct_name()%>">
        </div>
        <div class="product-body">
          <div class="product-brand"><%=p.getBrand()%></div>
          <div class="product-name"><%=p.getProduct_name()%></div>
          <div class="product-desc"><%=p.getDescription()%></div>
          <div class="rating-row">
            <div class="stars">
              <span class="star filled">★</span>
              <span class="star filled">★</span>
              <span class="star filled">★</span>
              <span class="star filled">★</span>
              <span class="star half">★</span>
            </div>
          </div>
          <div class="price-block">
            <span class="price-now">₹<%=p.getProduct_price()%></span>
          </div>
        </div>
        <div class="product-footer">
          <!--
              onclick="addToCart(this,'<%=p.getProduct_name()%>')"
          -->
          <button class="add-cart-btn" data-name="<%=p.getProduct_name()%>" onclick="addToCart(this)">
            🛒 ADD TO CART
          </button>
          <button class="shortlist-btn" onclick="addToShortlist(this)">♡ LIST</button>
        </div>
      </div>
      <%
      } // end for
      %>
    </div>
    <!-- END products-grid -->

    <!-- PAGINATION -->
    <div class="pagination">
      <button class="page-btn arrow">‹</button>
      <button class="page-btn active">1</button>
      <button class="page-btn" onclick="changePage(this)">2</button>
      <button class="page-btn" onclick="changePage(this)">3</button>
      <button class="page-btn" onclick="changePage(this)">4</button>
      <button class="page-btn arrow">›</button>
    </div>

  </main>
</div>

<!-- TOAST -->
<div class="toast" id="toast">
  <span id="toastIcon">✅</span>
  <span id="toastMsg">Done!</span>
</div>

<!-- ============================================================
     SCRIPTS
     ============================================================ -->
<script>

/* ── Toast ── */
const toastEl  = document.getElementById('toast');
const toastIcon = document.getElementById('toastIcon');
const toastMsg  = document.getElementById('toastMsg');
let toastTimer;

function showToast(message, type = 'success') {
  clearTimeout(toastTimer);
  toastEl.classList.remove('error', 'warn');
  toastIcon.textContent = type === 'error' ? '❌' : type === 'warn' ? '⚠️' : '✅';
  if (type === 'error') toastEl.classList.add('error');
  if (type === 'warn')  toastEl.classList.add('warn');
  toastMsg.textContent = message;
  toastEl.classList.add('show');
  toastTimer = setTimeout(() => toastEl.classList.remove('show'), 3000);
}

/* ── Wishlist toggle ── */
function toggleWishlist(btn) {
  btn.classList.toggle('liked');
  btn.textContent = btn.classList.contains('liked') ? '❤️' : '🤍';
  showToast(
    btn.classList.contains('liked') ? '❤️ Added to Wishlist!' : '💔 Removed from Wishlist',
    btn.classList.contains('liked') ? 'success' : 'warn'
  );
}


function addToCart(btn) {
  const name = btn.dataset.name;

  const rect = btn.getBoundingClientRect();
  const rip = document.createElement('span');
  rip.className = 'ripple';
  const sz = Math.max(rect.width, rect.height);
  rip.style.cssText = `width:${sz}px;height:${sz}px;left:${(rect.width-sz)/2}px;top:${(rect.height-sz)/2}px`;
  btn.style.position = 'relative';
  btn.style.overflow = 'hidden';
  btn.appendChild(rip);
  setTimeout(() => rip.remove(), 650);

  const original = btn.innerHTML;
  btn.innerHTML = '✅ Added!';
  btn.style.background = 'linear-gradient(90deg,#27c98a,#1fdc9d)';
  setTimeout(() => {
    btn.innerHTML = original;
    btn.style.background = '';
  }, 1500);

  showToast(`🛒 "${name}" added to cart!`, 'success');
}

/* ── Shortlist ── */
function addToShortlist(btn) {
  btn.textContent = btn.textContent.trim() === '♡ LIST' ? '♥ LISTED' : '♡ LIST';
  btn.style.color = btn.textContent.trim() === '♥ LISTED' ? 'var(--pink-dark)' : '';
  btn.style.borderColor = btn.textContent.trim() === '♥ LISTED' ? 'var(--pink)' : '';
  showToast('📋 Shortlist updated!', 'success');
}

/* ── Filter chips ── */
function filterChip(el, cat) {
  document.querySelectorAll('.chip').forEach(c => c.classList.remove('active'));
  el.classList.add('active');

  const cards = document.querySelectorAll('.product-card');
  let visible = 0;
  cards.forEach(card => {
    const match = cat === 'all' || card.dataset.category === cat;
    card.style.display = match ? '' : 'none';
    if (match) visible++;
  });

  document.getElementById('countDisplay').textContent = visible;
  showToast(`🔍 Showing ${visible} ${cat === 'all' ? 'products' : cat} items`, 'success');
}

/* ── Search ── */
function handleSearch() {
  const q = document.getElementById('searchInput').value.toLowerCase();
  const cards = document.querySelectorAll('.product-card');
  let visible = 0;
  cards.forEach(card => {
    const name = card.querySelector('.product-name').textContent.toLowerCase();
    const brand = card.querySelector('.product-brand').textContent.toLowerCase();
    const match = name.includes(q) || brand.includes(q);
    card.style.display = match ? '' : 'none';
    if (match) visible++;
  });
  document.getElementById('countDisplay').textContent = visible;
}

/* ── Pagination ── */
function changePage(btn) {
  document.querySelectorAll('.page-btn').forEach(b => b.classList.remove('active'));
  btn.classList.add('active');
  showToast(`📄 Page ${btn.textContent} loaded`, 'success');
  window.scrollTo({ top: 0, behavior: 'smooth' });
}

/* ── Sidebar mobile ── */
function openSidebar() {
  document.getElementById('sidebar').classList.add('open');
  document.getElementById('overlay').classList.add('show');
}

function closeSidebar() {
  document.getElementById('sidebar').classList.remove('open');
  document.getElementById('overlay').classList.remove('show');
}

/* ── Nav active ── */
document.querySelectorAll('.nav-item').forEach(item => {
  item.addEventListener('click', function() {
    document.querySelectorAll('.nav-item').forEach(i => i.classList.remove('active'));
    this.classList.add('active');
  });
});

</script>
</body>
</html>