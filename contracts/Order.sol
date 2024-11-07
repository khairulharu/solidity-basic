// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Order {
    enum Status {
        Pending,
        Shipped,
        Delivered,
        Canceled
    }

    struct OrderDetails {
        uint id;
        Status status;
    }

    OrderDetails[] public orders;

    function createOrder(uint _id) public {
        orders.push(OrderDetails({id: _id, status: Status.Pending}));
    }

    function updateOrderStatus(uint _orderID, Status _status) public {
      orders[_orderID].status = _status;
    }

    function getOrderStatus(uint _orderID) public view returns (Status) {
      return orders[_orderID].status;
    }
}
