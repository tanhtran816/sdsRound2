# 🚀 AnhTT Project Interview

### 🐘 PostgreSQL Docker Setup
```bash
# 🏗️ Build PostgreSQL image (From the position of the Dockerfile)
docker build . -t postgres_db

# 🚢 Run Postgres container from image
docker run -d -p 5432:5432 --name user postgres_db
```

### ☕ Spring Backend Setup
```bash
# 🔧 Build project
mvn clean install
```

### ☕Run java app
```bash
java -jar anhtt-0.0.1-SNAPSHOT.jar
```

### 📜 Backend Swagger
After running the project, access Swagger to view api instruction
```bash
🔗 http://localhost:8080/swagger-ui/index.html
```

### 🚀 Flutter
Go to user_application/lib/main.dart run command below for chrome app:
```agsl
flutter pub get
flutter run -t lib/main.dart -d chrome
```
