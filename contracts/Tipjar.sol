// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract TipJar {
    address public owner;
    uint256 public totalTips;

    event Tipped(address indexed sender, uint256 amount, string message);

    constructor() {
        owner = msg.sender;
    }

    function tip(string memory message)  external payable {
        require(msg.value > 0, "Tip must be greater than 0");

        totalTips += msg.value;

        emit Tipped(msg.sender, msg.value, message);
    }

function withdraw( ) external {
    require(msg.sender == owner, "only owner can withdraw");
    uint256 amount = address(this).balance;
    require(amount > 0, "Nothing to withdraw");

    payable(owner).transfer(amount);

}
function getBalance() external view returns (uint256) {
    return address(this).balance;
}
}


