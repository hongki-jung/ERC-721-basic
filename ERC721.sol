pragma solidity >=0.4.24 <=0.5.6;

// ERC 721 실습

/// @title ERC-721 Non-Fungible Token Standard
/// @dev See https://eips.ethereum.org/EIPS/eip-721
///  Note: the ERC-165 identifier for this interface is 0x80ac58cd.
interface ERC721 /* is ERC165 */ {
    event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);
    event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);
    event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);

    
    function balanceOf(address _owner) public view returns (uint256);
    function ownerOf(uint256 _tokenId) public view returns (address);
    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes data) public ;
    function safeTransferFrom(address _from, address _to, uint256 _tokenId) public ;
    // function transferFrom(address _from, address _to, uint256 _tokenId) public ;
    // function approve(address _approved, uint256 _tokenId) public ;
    // function setApprovalForAll(address _operator, bool _approved) public;
    // function getApproved(uint256 _tokenId) public view returns (address);
    // function isApprovedForAll(address _owner, address _operator) public view returns (bool);
}


interface ERC721TokenReceiver {
    function onERC721Received(address _operator, address _from, uint256 _tokenId, bytes _data) public returns(bytes4);
}

contract ERC721Implementation is ERC721 {

    // 토큰의 id를 키값으로 해서 계정을 리턴하는 매핑
    mapping (uint256 => address) tokenOwner;


    // 계정주소를 입력하면 해당 계정이 몇 개의 토큰을 소유하고 있는지 리턴
    mapping (address => uint256) ownedTokensCount;

    // mint : 토큰 발행 /  _to : 발행된 토큰 소유자 /  _tokenId : 토큰 식별자
    function mint(address _to, uint _tokenId) public{
        tokenOwner[_tokenId] = _to;
        ownedTokensCount[_to] += 1; // 특정 계정이 몇 개의 토큰을 가지고 있는지 셈
    }


    // 특정 계정이 가지고 있는 토큰의 갯수
    function balanceOf(address _owner) public view returns(uint256){
        return ownedTokensCount[_owner];
    }
    
    // 토큰 소유자
    function ownerOf(uint256 _tokenId) public view returns(address){
        return tokenOwner[_tokenId];
    }

    // 토큰 전송함수
    function transferFrom(address _from, address _to, uint256 _tokenId) public{
        address owner = ownerOf(_tokenId);
        require(msg.sender == owner);
        require(_from != address(0));       
        require(_to != address(0));         // address(0) : 비어있다
        
        ownedTokensCount[_from] -= 1;       // 토큰 소유량 차감
        tokenOwner[_tokenId] = address(0);  // 토큰 소유권 삭제

        ownedTokensCount[_to] += 1;
        tokenOwner[_tokenId] = _to;

    }
    
    // 토큰 안전 전송 
    function safeTransferFrom(address _from, address _to, uint256 _tokenId) public{
        transferFrom(_from, _to, _tokenId);

        if(isContract(_to)){
            bytes4 returnValue = ERC721TokenReceiver(_to).onERC721Received(msg.sender, _from , _tokenId, '')
        }
    }

    // 토큰 안전 전송
    function safeTransferFrom(Address _from, address _to, uint256 _tokenId, bytes data) public{
        transferFrom(_from, _to, _tokenId);
        if(isContract(_to)){
            bytes4 returnValue = ERC721TokenReceiver(_to).onERC721Received(msg.sender, _from, _tokenId, data);
            require(returnValue == 0x150b7a02);
        } 
    }

    function isContract(address _addr) private view returns (bool){

        uint256 size;
        assembly { size:= extcodesize(_addr)}
        return size > 0;    // 0 이면 일반 계정, 0 보다크면 컨트랙 계정
    }    

}
contract Auction is ERC721TokenReceiver{
    function onERC721Received(address _operator, address _from, uint256 _tokenId, bytes _data) public returns(bytes4){
        return bytes4(keccak256("onERC721Received(address,address,uint256,bytes")); 
    }       

}