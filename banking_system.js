import BankAccount from "./bank_account.js";

async function main() {
  let user1 = new BankAccount("Ulwan", 123456, 0);
  console.log("Account Info:", user1.getInfoNasabah());
  alert(
    `Selamat datang ${user1.getNamaNasabah()}, saldo Anda saat ini adalah ${user1.getSaldo()}`
  );

  try {
    let jumlahDeposit = +prompt("Masukkan jumlah deposit: ");
    if (isNaN(jumlahDeposit) || jumlahDeposit < 0) {
      throw new Error("Inputan tidak valid!");
    }
    let hasilDeposit = await user1.deposit(jumlahDeposit);
    console.log(hasilDeposit);
  } catch (error) {
    console.log("Error during deposit:", error.message);
  }

  if (user1.getSaldo() == 0) {
    throw new Error(
      "Anda tidak bisa melakukan withdrawal dikarenakan Anda tidak memiliki saldo!"
    );
  }

  try {
    let jumlahPenarikan = +prompt("Masukkan jumlah penarikan: ");
    let hasilPenarikan = await user1.withdraw(jumlahPenarikan);
    console.log(hasilPenarikan);
  } catch (error) {
    console.log("Error during withdrawal:", error.message);
  }

  console.log(`Final balance: ${user1.getSaldo()}`);
  console.log("Final Account Info:", user1.getInfoNasabah());
}

window.onload = main;
