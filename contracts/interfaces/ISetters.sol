// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0;

import { IERC20 } from "oz/interfaces/IERC20.sol";

import "../transmuter/Storage.sol";

/// @title ISettersGovernor
/// @author Angle Labs, Inc.
interface ISettersGovernor {
    /// @notice Recovers `amount` of `token` from the Transmuter contract
    function recoverERC20(address collateral, IERC20 token, address to, uint256 amount) external;

    /// @notice Sets a new access control manager address
    function setAccessControlManager(address _newAccessControlManager) external;

    /// @notice Sets (or unsets) a collateral manager  `collateral`
    function setCollateralManager(address collateral, ManagerStorage memory managerData) external;

    /// @notice Sets the allowance of the contract on `token` for `spender` to `amount`
    function changeAllowance(IERC20 token, address spender, uint256 amount) external;

    /// @notice Changes the trusted status for `sender` when for selling rewards or updating the normalizer
    function toggleTrusted(address sender, TrustedType t) external;

    /// @notice Changes whether a `collateral` can only be handled during burns and redemptions by whitelisted addresses
    /// and sets the data used to read into the whitelist
    function setWhitelistStatus(address collateral, uint8 whitelistStatus, bytes memory whitelistData) external;

    /// @notice Add `collateral` as a supported collateral in the system
    function addCollateral(address collateral) external;

    /// @notice Adjusts the amount of stablecoins issued from `collateral` by `amount`
    function adjustStablecoins(address collateral, uint128 amount, bool increase) external;

    /// @notice Revokes `collateral` from the system
    function revokeCollateral(address collateral) external;

    /// @notice Sets the `oracleConfig` used to read the value of `collateral` for the mint, burn and redemption
    /// operations
    function setOracle(address collateral, bytes memory oracleConfig) external;
}

/// @title ISettersGovernor
/// @author Angle Labs, Inc.
interface ISettersGuardian {
    /// @notice Changes the pause status for mint or burn transactions for `collateral`
    function togglePause(address collateral, ActionType action) external;

    /// @notice Sets the mint or burn fees for `collateral`
    function setFees(address collateral, uint64[] memory xFee, int64[] memory yFee, bool mint) external;

    /// @notice Sets the parameters for the redemption curve
    function setRedemptionCurveParams(uint64[] memory xFee, int64[] memory yFee) external;

    /// @notice Changes the whitelist status for a collateral with `whitelistType` for an address `who`
    function toggleWhitelist(WhitelistType whitelistType, address who) external;
}
