 ![home screen](https://github.com/user-attachments/assets/9c82d56f-6c4d-4069-b9e6-1c25a8ad6786)
![frame_firefox_mac_dark (1)](https://user-images.githubusercontent.com/aasets/login dashboard.png)

Sure! Here's an enriched version with additional content for **CampusConnect - College Management App**, including sections on **Future Enhancements** and **How to Run the Project**:
login dashboard .png
![Screenshot](assets/login dashboard .png)
![UI Preview](https://user-images.githubusercontent.com/aasets/login dashboard.png)



---


**🎓 CampusConnect - College Management App**

CampusConnect is a modern, cross-platform **Flutter** application integrated with **Firebase** backend services to streamline **OD (On-Duty) management**, internal mark handling, admission processes, and overall academic administration for educational institutions.

---

### **🚀 Features**

#### **🔐 Multi-Role Login System**

* 👨‍🎓 **Student Login & Signup**
* 👨‍🏫 **Subject Staff Login**
* 👔 **Chairperson Login**

---

#### **📝 Student Admission Page**

A dynamic and easy-to-use student admission interface that allows new students to register and apply for admission.

* 🧾 **Admission Form** with fields such as:

  * Full Name
  * Date of Birth
  * Email & Phone Number
  * Address
  * Previous Qualification
  * Course Selection
* 🗂️ Data stored securely in Firebase Firestore
* 🔍 Admin access for viewing, verifying, or approving admission requests

---

#### **📚 Course Detail Page**

This page provides detailed information about all available academic courses.

* 🎓 **Course List Display:**

  * Course Name
  * Duration
  * Eligibility
  * Subject Overview
  * Credit Details
* 🔎 Filter by department or level (UG/PG)
* 📂 Optional PDF syllabus download (Firebase Storage)

---

#### **👨‍🎓 Student Portal**

* 🏠 **Dashboard**

  * 📄 Apply for OD with a structured form
  * 👤 View & update student bio-data
  * 📊 View internal marks securely
* 📨 OD application directly routed to Subject Staff and Chairperson for approval

---

#### **🧑‍🏫 Subject Staff Dashboard**

* 👥 View list of students who applied for OD
* 🔍 Student details: Name, Roll Number, Reason
* 📤 Forward/Recommend OD to Chairperson

---

#### **🧑‍💼 Chairperson Dashboard**

* ✅ Approve or reject OD forms
* 📝 Enter internal marks using Registration Number
* 📋 View OD applicant history and academic records

---

### **🛠️ Technology Stack**

| **Component**      | **Technology**     |
| ------------------ | ------------------ |
| **Frontend**       | Flutter (Dart)     |
| **Backend**        | Firebase Firestore |
| **Authentication** | Firebase Auth      |
| **Storage**        | Firebase Storage   |
| **Hosting**        | Firebase Hosting   |

---

### **📁 Folder Structure**

```
lib/
├── main.dart
├── screens/
│   ├── auth/
│   ├── admission/
│   │   ├── admission_form.dart
│   ├── courses/
│   │   ├── course_detail.dart
│   ├── student/
│   │   ├── dashboard.dart
│   │   ├── od_application.dart
│   │   ├── marks_view.dart
│   ├── staff/
│   ├── chairperson/
├── services/
├── widgets/
```

---

### **📲 UI Preview**

> 📷 Add screenshots of:

* Admission form
* Course detail layout
* Login screens
* OD application flow

---

### **🔮 Future Enhancements**

* 🔔 **Push Notifications:** Implement push notifications for OD approval/rejection and important announcements.
* 📊 **Dashboard Analytics:** Add dashboard analytics for administrators to track OD trends, internal marks, and admission status.
* 🧾 **Attendance Tracking:** Integrate attendance tracking and notify students about their attendance status.
* 📥 **Export Data:** Enable export functionality for OD and internal data to **PDF/Excel** for easy reporting.
* 📝 **Multilingual Support:** Add multilingual support for students and staff from diverse regions.

---

### **🧑‍💻 How to Run the Project**

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/campusconnect.git
   cd campusconnect
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the app:**

   ```bash
   flutter run
   ```

4. **Set up Firebase:**

   * Visit [Firebase Console](https://console.firebase.google.com/).
   * Create a new Firebase project.
   * Integrate Firebase SDK into the Flutter project by following [this guide](https://firebase.flutter.dev/docs/overview).
   * Add the necessary configurations in `android/app/google-services.json` and `ios/Runner/GoogleService-Info.plist`.
 5.**Screenshot**
   1) **home screen**
  ![home screen](https://github.com/user-attachments/assets/9c82d56f-6c4d-4069-b9e6-1c25a8ad6786)
   2)**admission**
      ![admission detail](https://github.com/user-attachments/assets/a794452f-1179-449e-8d6f-b00e343265f9)
      ![admission form](https://github.com/user-attachments/assets/ea34aa61-0118-4529-882e-f6ea3ae31fb2)


   3)**student dashborad**
  ![sutdent dashboard](https://github.com/user-attachments/assets/4f7a1942-295f-4747-ab52-cb5fb7a29b2d)



   4)**student od apply**
   ![Uploading OD APPLYING.png…]()
   ![OD bending screen](https://github.com/user-attachments/assets/4809c461-019a-4268-b1f7-9b95bbdd05d1)

   5) **student login**
       ![login dashboard ](https://github.com/user-attachments/assets/50b1ca62-828b-4eeb-af50-3fd0559c8870)
  6) **student bio & internal mark**
   ![student bio screen and internal mark ](https://github.com/user-attachments/assets/92809b98-9a63-4659-91f7-82e2f89d18ed)
  7) **chairperson_approval od**
     ![approval od in chairperson ](https://github.com/user-attachments/assets/4d14ecf0-2800-47ea-a9c0-e5b2594e94df)
   8)**upload_mark based on stud reg no**
     ![upload mark based on student rollnumber](https://github.com/user-attachments/assets/3940334b-2ca4-4e70-a129-9ee19566c599)

  9) **staff_dashboard**
     ![subject incharge dashboard ](https://github.com/user-attachments/assets/52b981eb-836a-4049-8696-e9d301c5dca2)

   

---

### **🙋‍♂️ Contributors**

* **Developer:** Mariselvam K
* **Institution:** Kamaraj College of Engineering & Technology, Virudhunagar

---

### **📄 License**

Licensed under the [MIT License](LICENSE)

---

> 💡 *“Simplifying student administration through smart mobile technology.”*

---

This updated version now includes additional sections on **Future Enhancements** and **How to Run the Project**, ensuring that the **CampusConnect** app is future-proof and user-friendly! Would you like to add anything else or need more help with any part of the project?
