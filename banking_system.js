import { BankAccount } from "./bank_account.js";

async function main() {
  let user1 = new BankAccount("Ulwan", 123456, 0);
  console.log("Info Nasabah:", user1.getInfoNasabah());
  alert(
    `Selamat datang ${user1.getNamaNasabah()}, saldo Anda saat ini adalah ${user1.getSaldo()}`
  );

  let jumlahDeposit;

  while (true) {
    try {
      jumlahDeposit = +prompt("Masukkan jumlah deposit: ");
      if (isNaN(jumlahDeposit) || jumlahDeposit < 0) {
        throw new Error("Inputan tidak valid!");
      }
      let hasilDeposit = await user1.deposit(jumlahDeposit);
      console.log(hasilDeposit);
      break;
    } catch (error) {
      console.log("Error during deposit:", error.message);
    }
  }

  if (user1.getSaldo() == 0) {
    throw new Error(
      "Anda tidak bisa melakukan withdrawal dikarenakan Anda tidak memiliki saldo!"
    );
  }

  while (true) {
    try {
      let jumlahPenarikan = +prompt("Masukkan jumlah penarikan: ");
      if (isNaN(jumlahPenarikan) || jumlahPenarikan < 0) {
        throw new Error("Inputan tidak valid!");
      }
      let hasilPenarikan = await user1.withdraw(jumlahPenarikan);
      console.log(hasilPenarikan);
      break;
    } catch (error) {
      console.log("Error during withdrawal:", error.message);
    }
  }

  console.log("Info Nasabah:", user1.getInfoNasabah());
}

window.onload = main;
