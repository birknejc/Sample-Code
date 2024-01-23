<!-- inc_navigation.php -->

<nav>
  <!-- Navigation links -->
  <?php
  $navItems = array(
      array("caption" => "Home", "link" => "index.php"),
      array("caption" => "Products", "link" => "products.php"),
      array("caption" => "About Us", "link" => "about.php"),
      array("caption" => "Contact", "link" => "contact.php"),
      array("caption" => "Item Display", "link" => "itemdisplay.php"), // Add link to itemdisplay.php
      array("caption" => "Orders Display", "link" => "ordersdisplay.php") // Add link to ordersdisplay.php
  );

  foreach ($navItems as $item) {
      echo '<a href="' . $item["link"] . '">' . $item["caption"] . '</a>';
  }
  ?>
</nav>
