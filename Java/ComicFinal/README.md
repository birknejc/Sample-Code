# Comic Database Web Application

The Comic Database Web Application is a Spring Boot-based web application for managing a collection of comic books. It allows users to view, add, edit, and delete comic book records in a database.

## Features

- List all comic books in the database.
- View details of a specific comic book.
- Add new comic books to the database.
- Edit existing comic book details.
- Delete comic books from the database.

## Technologies Used

- Java
- Spring Boot
- Thymeleaf (HTML templating)
- MySQL (Database)
- IntelliJ IDEA (IDE)

## Getting Started

1. Clone this repository to your local machine.
2. Open the project in IntelliJ IDEA or your preferred IDE.
3. Configure the MySQL database connection in `src/main/resources/application.properties`.
4. Run the application using the main class `ComicFinalApplication`.
5. Access the application in your web browser at `http://localhost:8080`.

## Project Structure

- `src/main/java/com/example/comicfinal`: Java source code.
- `src/main/resources`: Application configuration files and static resources.
- `src/main/resources/templates`: Thymeleaf HTML templates.
- `src/main/resources/comic.json`: JSON data file for initial comic data.
- `src/main/resources/static`: Static files (CSS, JS, etc.).

## How to Use

1. Launch the application and access it in your web browser.
2. Launch SQL Workbench. Username root, password root
2. Navigate to different sections using localhost:8080:
    - `/comics/index`: Home page with navigation links.
    - `/comics`: List all comics.
    - `/comics/view`: View details of a specific comic.
    - `/comics/new`: Add a new comic.
    - `/comics/edit`: Edit existing comics. You must edit all fields.
3. Follow on-screen instructions to perform actions.

## Credits

This project was developed by Jeff Birkner.



