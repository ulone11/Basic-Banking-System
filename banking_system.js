import { BankAccount } from "./bank_account.js";

async function main() {
  let user1 = new BankAccount("Ulwan", 123456, 0);
  console.log("Account Info:", user1.getInfoNasabah());
  alert(
    `Selamat datang ${user1.getNamaNasabah()}, saldo Anda saat ini adalah ${user1.getSaldo()}`
  );

  try {
    let depositAmount = +prompt("Masukkan jumlah deposit: ");
    if (isNaN(depositAmount) || depositAmount < 0) {
      throw new Error("Inputan tidak valid!");
    }
    let depositResult = await user1.deposit(depositAmount);
    console.log(depositResult);
  } catch (error) {
    console.log("Error during deposit:", error.message);
  }

  if (user1.getSaldo() == 0) {
    throw new Error(
      "Anda tidak bisa melakukan withdrawal dikarenakan Anda tidak memiliki saldo!"
    );
  }

  try {
    let withdrawAmount = +prompt("Masukkan jumlah penarikan: ");
    let withdrawResult = await user1.withdraw(withdrawAmount);
    console.log(withdrawResult);
  } catch (error) {
    console.log("Error during withdrawal:", error.message);
  }

  console.log(`Final balance: ${user1.getSaldo()}`);
  console.log("Final Account Info:", user1.getInfoNasabah());
}

window.onload = main;
