// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract MintNFT is ERC721Enumerable {
    mapping(uint => string) metadataURIs;
// 1:1 mapping 한걸 메타데이터 주소로 활용 숫자를 입력하면 아웃풋으로 문자열이 나옴  id 1번 => URL (이것과 같음)
    constructor(string memory _symbol, string memory _name) ERC721(_name,_symbol) {}

    

    function mintNFT(string memory _metadataURI) public{
            uint tokenId=totalSupply() + 1;

        _mint(msg.sender,tokenId);

        metadataURIs[tokenId] = _metadataURI;
     
    }
    
    function tokenURI(uint _tokenId) public view override returns(string memory) {
    // 데이터를 저장하는 형태  string을 반환해주는  할아버지와 이름이랑 매개변수 개수가 둘다 같으면 오버라이드 에러 -> 내가 만들었따고 하겠다 . override써줌
        return metadataURIs[_tokenId];
    }
}


// 주소와 아이디값 msg.sender = 콜한주체 위에 컨트랙트 한 함수에 따라 달라질수있음
// totalsupply 발행한 총량
// 코드블럭안에서 함수실행 코드블럭밖에서 변수 설정.