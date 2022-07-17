# Opensea Single NFT Minter

- This gives you full control over newly deployed NFT collections.
- It helps to deploy a customized NFT contract and display / trade on opensea
- It supports images/videos nft format.
- Currently only support ERC721, for ERC1155, you need to add other interfaces e.g. uri(uint256) etc.

## Instructions
1. uplaod video/image to ipfs, got the ipfs:// link

2. edit video_nft_sample.json and upload to ipfs
- 'animation_url': the video file url
- 'image': the preview image when video is provided, otherwise it's the main metadata

3. edit contract
- update tokenURI to the json file link
- need mint/burn interfaces, otherwise opensea can't recognize it

4. deploy to testnet/mainnet
- note: deploy to rinkeby rather than goerli, opensea's support for goerli is buggy

5. view it on opensea
- https://testnets.opensea.io/assets/rinkeby/0x<contract_addr>/<token_id>
- token_id default 1
- wait for ~20 sec if 404
