FROM openjdk:17

# Set the working directory
WORKDIR /app

# Copy jar file
COPY target/book_Store_app.jar app.jar

# Expose port (if your app runs on 8080)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]