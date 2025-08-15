# 🛍️ OneStopShop

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat\&logo=flutter\&logoColor=white)](https://flutter.dev)
[![Django](https://img.shields.io/badge/Django-092E20?style=flat\&logo=django\&logoColor=white)](https://www.djangoproject.com/)
[![DRF](https://img.shields.io/badge/DRF-009688?style=flat\&logo=django\&logoColor=white)](https://www.django-rest-framework.org)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

**OneStopShop** is a fully integrated **perfume shopping app** built with **Flutter** (frontend) and **Django** (backend).
Enjoy a smooth, elegant shopping experience with a **points-based system**, where **admins** can top-up points and users can purchase products seamlessly.

---

## ✨ Features

| Feature               | Description                                                        |
| --------------------- | ------------------------------------------------------------------ |
| 🚀 Splash & Welcome   | Animated logo & intro screens                                      |
| 🔐 Authentication     | Sign up, login, reset password, JWT secure login                   |
| 🏠 Home Screen        | Curated perfume list, bottom nav (**Home**, **Cart**, **Profile**) |
| 🛒 Cart & Checkout    | Add products & pay using points                                    |
| 🔍 Search             | Quick search by product name or category                           |
| 💎 Product Details    | Image, name, price, description, buy option                        |
| 👤 Profile & Settings | Update info, check points, view transaction history                |
| 🏅 Points System      | Admin top-ups & user points history                                |

---

## 🏗️ Tech Stack

### Frontend

* Flutter (Dart)
* MVVM Architecture
* Dio (REST API requests)
* Cubit/BLoC (state management)
* GetX (navigation & reactive UI)

### Backend

* Django
* Django REST Framework (DRF)
* JWT Authentication
* Admin-only endpoints for secure point management

---

## 📂 Project Structure

```plaintext
OneStopShop/
├── lib/
│   ├── models/
│   ├── views/
│   ├── viewmodels/
│   ├── services/
│   └── main.dart
├── backend/
│   ├── apps/
│   ├── settings.py
│   └── urls.py
└── README.md
```

---

## 🌟 Notes

* `Profile.points` → current user balance
* `UserPoints` → transaction history
* Admin features are isolated from normal users
* Designed for scalability & future enhancements (push notifications, reviews, analytics)

---

## 🔗 Useful Links

* [Flutter Official](https://flutter.dev)
* [Django Official](https://www.djangoproject.com/)
* [Django REST Framework](https://www.django-rest-framework.org)
 

 # in Arabic

# 🛍️ OneStopShop

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat\&logo=flutter\&logoColor=white)](https://flutter.dev)
[![Django](https://img.shields.io/badge/Django-092E20?style=flat\&logo=django\&logoColor=white)](https://www.djangoproject.com/)
[![DRF](https://img.shields.io/badge/DRF-009688?style=flat\&logo=django\&logoColor=white)](https://www.django-rest-framework.org)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

**OneStopShop** هو تطبيق متكامل للتسوق العطري مبني بـ **Flutter** للواجهة الأمامية و **Django** للواجهة الخلفية.
يوفر تجربة تسوق سلسة وأنيقة مع **نظام نقاط** يسمح للـ **أدمنز** بشحن النقاط للمستخدمين الذين يمكنهم استخدامها لشراء المنتجات بسهولة.

---

## ✨ المميزات

| الميزة                     | الوصف                                                                              |
| -------------------------- | ---------------------------------------------------------------------------------- |
| 🚀 شاشة البداية & الترحيب  | شعار متحرك وشاشات تقديم التطبيق                                                    |
| 🔐 المصادقة                | تسجيل حساب جديد، تسجيل الدخول، إعادة تعيين كلمة المرور، مصادقة JWT آمنة            |
| 🏠 الشاشة الرئيسية         | قائمة مختارة من العطور، شريط تنقل سفلي (**الرئيسية**، **السلة**، **الملف الشخصي**) |
| 🛒 السلة والدفع            | إضافة المنتجات للسلة والدفع باستخدام النقاط                                        |
| 🔍 البحث                   | البحث السريع عن المنتجات بالاسم أو الفئة                                           |
| 💎 تفاصيل المنتج           | عرض الصورة، الاسم، السعر، الوصف، وخيار الشراء                                      |
| 👤 الملف الشخصي والإعدادات | تحديث المعلومات، عرض الرصيد، الاطلاع على تاريخ المعاملات                           |
| 🏅 نظام النقاط             | شحن النقاط من الأدمن وتسجيل تاريخ النقاط لكل مستخدم                                |

---

## 🏗️ التقنية المستخدمة

### الواجهة الأمامية

* Flutter (Dart)
* معماريّة MVVM
* Dio لطلبات REST API
* Cubit/BLoC لإدارة الحالة
* GetX للتنقل والتحديث التفاعلي للواجهة

### الواجهة الخلفية

* Django
* Django REST Framework (DRF)
* JWT Authentication
* نقاط التحكم الخاصة بالأدمن معزولة وآمنة

---

## 📂 هيكل المشروع

```plaintext
OneStopShop/
├── lib/
│   ├── models/
│   ├── views/
│   ├── viewmodels/
│   ├── services/
│   └── main.dart
├── backend/
│   ├── apps/
│   ├── settings.py
│   └── urls.py
└── README.md
```

---

## 🌟 ملاحظات

* `Profile.points` → الرصيد الحالي للمستخدم
* `UserPoints` → سجل معاملات النقاط
* ميزات الأدمن معزولة عن المستخدم العادي
* مصمم للتوسع المستقبلي وإضافة ميزات مثل الإشعارات، التقييمات، والتحليلات

---

## 🔗 روابط مفيدة

* [الموقع الرسمي لـ Flutter](https://flutter.dev)
* [الموقع الرسمي لـ Django](https://www.djangoproject.com/)
* [Django REST Framework](https://www.django-rest-framework.org)