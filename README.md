# JFSW.L.A101 - User Management System

## 📋 Mô Tả

Ứng dụng quản lý người dùng được xây dựng với Spring MVC, MySQL, và JSP.

## ✨ Tính Năng Chính

- ✅ Quản lý danh sách người dùng
- ✅ Thêm, sửa, xóa người dùng
- ✅ Enable/Disable trạng thái người dùng
- ✅ Hiển thị trạng thái (Enabled/Disabled) trong bảng

## 🛠️ Công Nghệ

- **Backend:** Spring Framework 5.3.39
- **Frontend:** JSP, HTML5, CSS3
- **Database:** MySQL
- **Build Tool:** Maven
- **Java Version:** 21

## 📁 Cấu Trúc Project

```
src/
├── main/
│   ├── java/
│   │   └── com/aipo/
│   │       ├── config/        # Database configuration
│   │       ├── controller/    # Spring controllers
│   │       ├── entity/        # Data models
│   │       ├── repository/    # Data access layer
│   │       └── service/       # Business logic
│   ├── resources/             # Configuration files
│   └── webapp/
│       ├── resources/css/     # Stylesheets
│       └── WEB-INF/
│           ├── views/         # JSP templates
│           ├── web.xml        # Web deployment descriptor
│           └── dispatcher-servlet.xml  # Spring MVC config
```

## 🚀 Chạy Project

```bash
# Build
mvn clean package

# Run (requires Tomcat or similar servlet container)
mvn tomcat7:run
```

## 💾 Database

Database: `aipo_db`
Table: `turbine_user`

### Trạng Thái Người Dùng

- `disabled = 'F'` hoặc `NULL` → **Enabled** (Xanh)
- `disabled = 'T'` → **Disabled** (Đỏ)

## 🔧 Tính Năng Chính

### User Management
- Danh sách người dùng với các cột: State, Username, Name, Department, Status
- Nút hành động: Remove, Enable, Disable
- Checkbox để chọn người dùng
- Bộ lọc theo trạng thái

## 📝 Ghi Chú

Tất cả các file cấu hình và tài liệu hướng dẫn đã được loại bỏ để giữ project gọn gàng.

Các thay đổi chính:
- Thêm trường `disabled` vào User entity
- Cập nhật Repository để lấy giá trị `disabled` từ database
- Thay đổi cột "Title" → "Status" để hiển thị trạng thái Enable/Disable
- Enable/Disable buttons hoạt động đầy đủ

---

**Last Updated:** March 10, 2026

