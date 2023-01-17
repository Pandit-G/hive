// SPDX-License-Identifier: MIT
//
// ╭━━━━╮╱╱╭╮╱╱╱╱╱╭╮╱╱╱╱╱╭╮
// ┃╭╮╭╮┃╱╱┃┃╱╱╱╱╱┃┃╱╱╱╱╱┃┃
// ╰╯┃┃┣┻━┳┫┃╭┳━━╮┃┃╱╱╭━━┫╰━┳━━╮
// ╱╱┃┃┃╭╮┣┫╰╯┫╭╮┃┃┃╱╭┫╭╮┃╭╮┃━━┫
// ╱╱┃┃┃╭╮┃┃╭╮┫╰╯┃┃╰━╯┃╭╮┃╰╯┣━━┃
// ╱╱╰╯╰╯╰┻┻╯╰┻━━╯╰━━━┻╯╰┻━━┻━━╯
// note: this file should be consistent with https://github.com/taikoxyz/taiko-mono/blob/main/packages/protocol/contracts/libs/LibSharedConfig.sol.
pragma solidity ^0.8.9;

import "../L1/TaikoData.sol";

library LibSharedConfig {
    /// Returns shared configs for both TaikoL1 and TaikoL2 for production.
    function getConfig() internal pure returns (TaikoData.Config memory) {
        return
            TaikoData.Config({
                chainId: 167001, // for hive test, should be consistent with DefaultConfig().L2.ChainID in "taiko/config.go"
                maxNumBlocks: 30, // up to 2048 pending blocks, change for hive test
                blockHashHistory: 100000,
                // This number is calculated from maxNumBlocks to make
                // the 'the maximum value of the multiplier' close to 20.0
                zkProofsPerBlock: 1,
                maxVerificationsPerTx: 20,
                commitConfirmations: 0,
                maxProofsPerForkChoice: 5,
                blockMaxGasLimit: 5000000, // TODO
                maxTransactionsPerBlock: 20, // TODO
                maxBytesPerTxList: 10240, // TODO
                minTxGasLimit: 21000, // TODO
                anchorTxGasLimit: 250000,
                feePremiumLamda: 590,
                rewardBurnBips: 100, // 100 basis points or 1%
                proposerDepositPctg: 25, // 25%
                // Moving average factors
                feeBaseMAF: 1024,
                blockTimeMAF: 1024,
                proofTimeMAF: 1024,
                rewardMultiplierPctg: 400, // 400%
                feeGracePeriodPctg: 125, // 125%
                feeMaxPeriodPctg: 375, // 375%
                blockTimeCap: 48 seconds,
                proofTimeCap: 60 minutes,
                bootstrapDiscountHalvingPeriod: 180 days,
                initialUncleDelay: 1 seconds, // change for hive test
                enableTokenomics: false,
                enablePublicInputsCheck: true
            });
    }
}