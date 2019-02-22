// Copyright (C) 2019 Lorenzo Manacorda <lorenzo@mailbox.org>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

pragma solidity ^0.5.4;

contract MomLike {
    function execute(address, bytes memory) public;
}

contract LineSpell {
    MomLike mom;
    address momLib;
    address pit;
    bytes32 ilk;
    uint256 line;
    bool    done;

    constructor(address _mom, address _momLib, address _pit, bytes32 _ilk, uint256 _line) public {
        mom    = MomLike(_mom);
        momLib = _momLib;
        pit    = _pit;
        ilk    = _ilk;
        line   = _line;
    }

    function cast() public {
        require(!done, "spell-already-cast");

        bytes memory sig =
            abi.encodeWithSignature(
                "file(address,bytes32,bytes32,uint256)",
                pit, 
                ilk,
                bytes32("line"),
                line
        );
        mom.execute(momLib, sig);

        done = true;
    }
}
