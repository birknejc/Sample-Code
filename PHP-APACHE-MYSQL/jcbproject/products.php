<!DOCTYPE html>
<html>
<head>
  <title>Products</title>
  <style>
    /* CSS styling */
    body {
      font-family: Arial, sans-serif;
      background-color: #f5f5f5;
      margin: 0;
      padding: 0;
    }

    header {
      background-color: #2058b0;
      padding: 20px;
      color: #fff;
    }

    h1 {
      margin: 0;
    }

    nav {
      background-color: #555;
      padding: 10px;
    }

    nav a {
      color: #fff;
      text-decoration: none;
      margin-right: 10px;
    }

    section {
      padding: 20px;
    }

    img {
      width: 200px;
      height: auto;
    }

    /* Additional styles for the products table */
    table {
      width: 65%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      border: 5px solid #ccc;
      padding: 10px;
      text-align: left;
    }

    th {
      background-color: #555;
      color: #fff;
    }

    footer {
      background-color: #2058b0;
      padding: 10px;
      color: #fff;
      text-align: center;
    }
  </style>
</head>
<body>
  <?php include 'inc_welcome.php'; ?>

  <header>
    <h1>Welcome to Webhead Comics!</h1>
  </header>

  <nav>
    <!-- Navigation links -->
    <?php include 'inc_navigation.php'; ?>
  </nav>

  <section>
    <!-- Products Table -->
    <h2>Featured Products</h2>
    <table>
      <tr>
        <th>Name</th>
        <th>Issue</th>
        <th>Grade</th>
        <th>Price</th>
      </tr>
      <?php
      // Define the products as a two-dimensional array
      $products = array(
          array("name" => "Amazing Spider-Man", "issue" => 121, "grade" => 7.5, "price" => 2.00),
          array("name" => "Amazing Spider-Man", "issue" => 122, "grade" => 4.5, "price" => 1.00),
          array("name" => "Amazing Spider-Man", "issue" => 198, "grade" => 8.5, "price" => 4.00),
          array("name" => "Amazing Spider-Man", "issue" => 212, "grade" => 9.0, "price" => 2.00),
          array("name" => "Amazing Spider-Man", "issue" => 300, "grade" => 9.6, "price" => 2143.00)
      );

      // Iterate over the products and display them in the table
      foreach ($products as $product) {
          echo '<tr>';
          echo '<td>' . $product["name"] . '</td>';
          echo '<td>' . $product["issue"] . '</td>';
          echo '<td>' . $product["grade"] . '</td>';
          echo '<td>' . $product["price"] . '</td>';
          echo '</tr>';
      }
      ?>
    </table>
  </section>

  <?php include 'inc_footer.php'; ?>
</body>
</html>
