<?php
// Order.php

class Order {
    private $orderId;
    private $itemDescription;
    private $quantityOrdered;
    private $cost;
    private $orderDate;

    public function __construct($orderId, $itemDescription, $quantityOrdered, $cost, $orderDate) {
        $this->orderId = $orderId;
        $this->itemDescription = $itemDescription;
        $this->quantityOrdered = $quantityOrdered;
        $this->cost = $cost;
        $this->orderDate = $orderDate;
    }

    public function getOrderId() {
        return $this->orderId;
    }

    public function getItemDescription() {
        return $this->itemDescription;
    }

    public function getQuantityOrdered() {
        return $this->quantityOrdered;
    }

    public function getCost() {
        return $this->cost;
    }

    public function getOrderDate() {
        return $this->orderDate;
    }
}
?>
