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
      $products = array(
          array("Amazing Spider-Man", 121, 7.5, 2.00),
          array("Amazing Spider-Man", 122, 4.5, 1.00),
          array("Amazing Spider-Man", 198, 8.5, 4.00),
          array("Amazing Spider-Man", 212, 9.0, 2.00),
          array("Amazing Spider-Man", 300, 9.6, 2143.00)
      );

      foreach ($products as $product) {
          echo '<tr>';
          foreach ($product as $value) {
              echo '<td>' . $value . '</td>';
          }
          echo '</tr>';
      }
      ?>
    </table>
  </section>

  <?php include 'inc_footer.php'; ?>
</body>
</html>
