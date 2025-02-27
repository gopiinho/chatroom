// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Test} from "../lib/forge-std/src/Test.sol";
import {Chatroom} from "../src/Chatroom.sol";

contract ChatroomTest is Test {
    Chatroom public chatroom;
    address public USER;


    function setUp() public {
        chatroom = new Chatroom();
        USER = makeAddr("USER");
    }

    function testCanSendMessage() public {
        vm.startPrank(USER);
        chatroom.sendMessage("Hello world!");
        vm.stopPrank();
        assertEq(chatroom.getAllMessages()[0].message, "Hello world!");
    }
}