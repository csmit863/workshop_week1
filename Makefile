-include .env


clean :; forge clean

update :; forge update

build :; forge clean && forge build --optimize --optimizer-runs 1000000

deployContracts :; forge create Friegeld_USDC --constructor-args 0xaf88d065e77c8cC2239327C5EDb3A432268e5831 100 100 100 --private-key ${PRIVATE_KEY} --rpc-url ${ARBITRUM_URL} 

claimDemurrage :; cast send ${DUSDC_ADDRESS} "claimDemurrageFee(address)" 0x4d15d67C0e82375eED9A8b313b6d1302D3C8F4F5 --private-key ${PRIVATE_KEY} --rpc-url ${ARBITRUM_URL} 

approve :; cast send ${USDC_ADDRESS} "approve(address, uint256)" ${DUSDC_ADDRESS} 4000000 --private-key ${PRIVATE_KEY} --rpc-url ${ARBITRUM_URL} 
deposit :; cast send ${DUSDC_ADDRESS} "deposit(uint256)" 4000000 --private-key ${PRIVATE_KEY} --rpc-url ${ARBITRUM_URL} 

withdraw :; cast send ${DUSDC_ADDRESS} "withdraw(uint256)" 8000000 --private-key ${PRIVATE_KEY} --rpc-url ${ARBITRUM_URL} 

owner :; cast send ${DUSDC_ADDRESS} "owner()" --private-key ${PRIVATE_KEY} --rpc-url ${ARBITRUM_URL} 