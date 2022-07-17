// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/**
 * @dev ERC721 token for FLC
 */
 contract FLCabal is ERC721 {
    using Strings for uint256;

    // Optional mapping for token URIs
    mapping(uint256 => string) private _tokenURIs;
    address owner;

    constructor() ERC721("FLCTest", "FLC"){
        owner = msg.sender;
        _mint(msg.sender, 1);
        _setTokenURI(1, "ipfs://bafkreiepmhrl3izl3oerqk7wftdphenrmsruv6hoav4f7ry4xzkmo5cmi4");
    }

    function mint(uint256 tokenId, string memory _uri) public {
        require(msg.sender == owner);
        require(!_exists(tokenId));
        _mint(msg.sender, tokenId);
        _setTokenURI(tokenId, _uri);
    }
    
    /**
     * @dev See {IERC721Metadata-tokenURI}.
     */
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        _requireMinted(tokenId);

        string memory _tokenURI = _tokenURIs[tokenId];
        string memory base = _baseURI();

        // If there is no base URI, return the token URI.
        if (bytes(base).length == 0) {
            return _tokenURI;
        }
        // If both are set, concatenate the baseURI and tokenURI (via abi.encodePacked).
        if (bytes(_tokenURI).length > 0) {
            return string(abi.encodePacked(base, _tokenURI));
        }

        return super.tokenURI(tokenId);
    }

    function burn(uint256 tokenId) external {
        require(msg.sender == ERC721.ownerOf(tokenId), "FLCabal: not owner");
        _burn(tokenId);

        if (bytes(_tokenURIs[tokenId]).length != 0) {
            delete _tokenURIs[tokenId];
        }
    }

    /**
     * @dev Sets `_tokenURI` as the tokenURI of `tokenId`.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal {
        require(_exists(tokenId), "FLCabal: URI set of nonexistent token");
        _tokenURIs[tokenId] = _tokenURI;
    }

    function contractURI() public pure returns (string memory) {
        return "ipfs://bafkreig3hhlbwwcnp4v5r3xwm5742qdnw25p7fjld4lodj6u3t34twrnlq";
    }
}
