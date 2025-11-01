# GigEscrow - Thanh Toán Gig An Toàn Trên Celo

**Hợp đồng thông minh escrow dùng cUSD + hệ thống uy tín on-chain**

---

## Mô tả
`GigEscrow` là **hợp đồng thông minh phi tập trung** được xây dựng trên **Celo**, cho phép **thanh toán gig an toàn, chi phí thấp** bằng **cUSD (Celo Dollar)**.

Dành riêng cho **freelancer và khách hàng tại các thị trường mới nổi**, loại bỏ rủi ro bằng:
- **Khóa tiền tự động** – Tiền chỉ được giải phóng khi công việc hoàn thành
- **Tự động hoàn tiền sau 7 ngày** – Bảo vệ khách hàng nếu không giao hàng
- **Uy tín on-chain** – +1 điểm mỗi khi hoàn thành thành công

> **Không trung gian. Không cần tài khoản ngân hàng. Chỉ cần số điện thoại.**

---

## Tính năng
| Tính năng | Lợi ích |
|----------|--------|
| **Escrow bằng cUSD** | Ổn định, tức thì, phí gần bằng 0 |
| **Tự động hoàn tiền** | Khách hàng nhận lại tiền sau 7 ngày |
| **Hệ thống uy tín** | Xây dựng lòng tin qua từng giao dịch |
| **Tương thích di động** | Dùng được với **Valora**, **MetaMask**, mọi ví Celo |

---

## Hợp đồng thông minh
- **File**: `GigEscrow.sol`
- **Mạng**: Celo Alfajores Testnet
- **Địa chỉ cUSD**: `0x874069Fa1Eb16D44d622F2e0Ca25eeA172369bC1`

### Các hàm chính
```solidity
createGig(address freelancer, uint256 amount)      // Tạo gig
completeGig(uint256 id)                            // Freelancer báo hoàn thành
releasePayment(uint256 id)                         // Khách hàng giải phóng tiền
refundGig(uint256 id)                              // Hoàn tiền sau 7 ngày
getRep(address user)                               // Xem điểm uy tín
