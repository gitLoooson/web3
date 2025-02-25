// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract RedTreeBend is ERC20, ERC20Permit {
    uint256 private _totalSupply;  // 声明一个变量来存储总供应量

    // 构造函数，初始化代币名称、符号、初始供应量，并将初始代币铸造给部署者和指定的地址
    constructor(uint256 initialSupply, address recipient) ERC20("RedTreeBend", "RTB") ERC20Permit("RTB") {
        _totalSupply = initialSupply; // 设置总供应量为初始供应量的两倍
        _mint(msg.sender, initialSupply); // 给部署合约的地址分配初始供应量
        _mint(recipient, initialSupply);  // 给指定地址（recipient）分配代币
    }

    // 覆盖 ERC20 合约中的 totalSupply 方法，返回固定的总供应量
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;  // 返回我们设置的总供应量
    }

}
