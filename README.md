Here’s the **updated and enriched `README.md`** with additional sections for the **Student Admission Page** and **Course Detail Page** under the **Features** section:

---

```markdown
# 🎓 OD & College Management App

A modern, cross-platform **Flutter** application integrated with **Firebase** backend services to streamline **OD (On-Duty) management**, internal mark handling, admission processes, and overall academic administration for educational institutions.

---

## 🚀 Features

### 🔐 Multi-Role Login System
- 👨‍🎓 **Student Login & Signup**
- 👨‍🏫 **Subject Staff Login**
- 👔 **Chairperson Login**

---

### 📝 Student Admission Page
A dynamic and easy-to-use student admission interface that allows new students to register and apply for admission.

- 🧾 **Admission Form** with fields such as:
  - Full Name
  - Date of Birth
  - Email & Phone Number
  - Address
  - Previous Qualification
  - Course Selection
- 🗂️ Data stored securely in Firebase Firestore
- 🔍 Admin access for viewing, verifying, or approving admission requests

---

### 📚 Course Detail Page
This page provides detailed information about all available academic courses.


- 🎓 **Course List Display:**
  - Course Name
  - Duration
  - Eligibility
  - Subject Overview
  - Credit Details
- 🔎 Filter by department or level (UG/PG)
- 📂 Optional PDF syllabus download (Firebase Storage)

---

### 👨‍🎓 Student Portal
- 🏠 **Dashboard**

  - 📄 Apply for OD with a structured form
  - 👤 View & update student bio-data
  - 📊 View internal marks securely
- 📨 OD application directly routed to Subject Staff and Chairperson for approval


---

### 🧑‍🏫 Subject Staff Dashboard
- 👥 View list of students who applied for OD
- 🔍 Student details: Name, Roll Number, Reason
- 📤 Forward/Recommend OD to Chairperson

---

### 🧑‍💼 Chairperson Dashboard
- ✅ Approve or reject OD forms
- 📝 Enter internal marks using Registration Number
- 📋 View OD applicant history and academic records

---

## 🛠️ Technology Stack

| Component       | Technology          |
|----------------|---------------------|
| **Frontend**    | Flutter (Dart)      |
| **Backend**     | Firebase Firestore  |
| **Authentication** | Firebase Auth   |
| **Storage**     | Firebase Storage    |
| **Hosting**     | Firebase Hosting    |

---

## 📁 Folder Structure

```

lib/
├── main.dart
├── screens/
│   ├── auth/
│   ├── admission/
│   │   ├── admission\_form.dart
│   ├── courses/
│   │   ├── course\_detail.dart
│   ├── student/
│   │   ├── dashboard.dart
│   │   ├── od\_application.dart
│   │   ├── marks\_view\.dart
│   ├── staff/
│   ├── chairperson/
├── services/
├── widgets/

````

---

## 📲 UI Preview

> 📷 Add screenshots of:
- Admission form
- Course detail layout
- Login screens
- OD application flow

---

## 🧑‍💻 How to Run the Project

```bash
git clone https://github.com/your-username/od-management-app.git
cd od-management-app
flutter pub get
flutter run
````

✅ Set up Firebase as described in previous section.

---

## 🔮 Future Enhancements

* 🔔 Push notifications for OD approval
* 📊 Dashboard analytics for admin
* 🧾 Attendance tracking integration
* 📥 Export OD/Internal data as PDF or Excel

---

## 🙋‍♂️ Contributors

* **Developer:** \[Mariselvam.k]
* **Institution:** \[Kamaraj College of Engineering & tech,virudhunager]

---

## 📄 License

Licensed under the [MIT License](LICENSE)

---

> 💡 *“Simplifying student administration through smart mobile technology.”*

```

---

Would you like me to help you generate UI code (like Flutter widgets) for the admission form or course detail page?
```
