# 📚 Library Management System (SQL Database)

A **relational database design** for a small to medium-sized **Library Management System**.  
It manages **books, users, borrowing, reservations, payments, and fines** efficiently.

---
## Relation Schema using drawIO
<img width="766" height="550" alt="smallLibraryRS" src="https://github.com/user-attachments/assets/245826e8-39f9-4d1c-a884-45ee8ad56218" />


## 🗂️ ERD Overview

This project implements a well-structured **Relational Schema (RS)** that supports:
- Tracking book copies and availability
- Managing user borrowing and reservations
- Applying fines and payments for overdue books
- Adjustable settings for library rules (borrow duration, fine per day)

---

## 🧩 Database Structure

### 🏛️ Main Entities

| Table | Description |
|--------|--------------|
| **BOOK** 📘 | Stores information about each book (title, author, genre, publication date, etc.) |
| **COPY** 🔖 | Represents individual copies of books and their availability status |
| **USER** 👤 | Contains user details such as name, card number, and contact information |
| **BORROWING** 📅 | Tracks which user borrowed which copy, with due and return dates |
| **RESERVATION** ⏳ | Records when users reserve copies that are currently unavailable |
| **FINE** 💰 | Handles fines for overdue books and links to payments |
| **PAYMENT** 💳 | Stores payment information for fines |
| **SETTINGS** ⚙️ | Contains configurable values like fine per day and borrowing period |

---

## 🔗 Relationships

- One **book** can have many **copies**  
- One **copy** can be **borrowed** or **reserved** by users  
- One **borrowing** can generate one or more **fines**  
- One **fine** can have one or more **payments**  
- **Settings** table allows adjusting system rules without modifying data structures

---

## 🧱 Schema Highlights

| Feature | Description |
|----------|--------------|
| **Normalization** | 3NF — avoids redundancy, improves integrity |
| **Foreign Keys** | Ensures referential consistency |
| **Configurable Design** | Fine and borrow period easily adjustable |
| **Simple Scalability** | Supports small and mid-size libraries |

---

## 🗃️ Example Table Columns

### **BOOK**
| Column | Type | Description |
|--------|------|-------------|
| `bookID` | `int` | Primary key |
| `title` | `nvarchar(50)` | Book title |
| `author` | `nvarchar(30)` | Author name |
| `genre` | `nvarchar(20)` | Book genre |
| `ISBN` | `nvarchar(100)` | ISBN code |
| `publicationDate` | `date` | Publication date |
| `additionalDetail` | `nvarchar(200)` | Notes or description |

---

### **BORROWING**
| Column | Type | Description |
|--------|------|-------------|
| `borrowID` | `int` | Primary key |
| `borrowDate` | `date` | When book was borrowed |
| `dueDate` | `date` | When book should be returned |
| `returnDate` | `date` | Actual return date |
| `userID` | `int` | Linked to USER |
| `copyID` | `int` | Linked to COPY |

---

## 🧮 Settings Example

| settingID | finePerDay | borrowDay |
|------------|-------------|-----------|
| 1 | 10 | 14 |

💡 *This means a user can borrow a book for 14 days, and pays 10 units per day after the due date.*

---

## ⚙️ Tech Notes

- **Database Engine:** SQL Server / MySQL compatible  
- **Normalization:** Up to **3NF**  
- **Supports Triggers & Procedures:** (e.g., auto fine calculation, payment update)

---

## 🚀 Future Enhancements

- Add librarian management 👨‍💼  
- Add audit logs for borrowing/returning 📜  
- Build front-end (React, Angular, or Blazor) 💻  
- Add stored procedures for fine automation ⚡  
