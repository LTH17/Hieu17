// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CeloGive is Ownable {
    IERC20 public constant CUSD = IERC20(0x874069Fa1Eb16D44d622F2e0Ca25eeA172369bC1);

    address public beneficiary;
    uint256 public totalDonated;
    uint256 public goalAmount = 1000 * 1e18;
    bool public goalReached;

    event Donated(address indexed donor, uint256 amount);
    event GoalReached(uint256 total);
    event Withdrawn(address indexed to, uint256 amount);

    // GỌI Ownable(msg.sender) ĐÚNG CÁCH
    constructor(address _beneficiary) Ownable(msg.sender) {
        require(_beneficiary != address(0), "Invalid beneficiary");
        beneficiary = _beneficiary;
    }

    function donate(uint256 amount) external {
        require(!goalReached, "Goal reached");
        require(amount > 0, "Amount > 0");
        require(CUSD.transferFrom(msg.sender, address(this), amount), "Transfer failed");

        totalDonated += amount;

        if (totalDonated >= goalAmount && !goalReached) {
            goalReached = true;
            emit GoalReached(totalDonated);
        }
        emit Donated(msg.sender, amount);
    }

    function withdraw() external onlyOwner {
        uint256 balance = CUSD.balanceOf(address(this));
        require(balance > 0, "No funds");
        require(CUSD.transfer(beneficiary, balance), "Withdraw failed");
        emit Withdrawn(beneficiary, balance);
    }

    function setGoal(uint256 _newGoal) external onlyOwner {
        goalAmount = _newGoal;
    }

    function setBeneficiary(address _new) external onlyOwner {
        require(_new != address(0), "Zero address");
        beneficiary = _new;
    }
}