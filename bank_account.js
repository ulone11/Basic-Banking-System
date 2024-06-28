export class BankAccount {
  constructor(namaNasabah, nomorNasabah, saldoAwal = 0) {
    this.namaNasabah = namaNasabah;
    this.nomorNasabah = nomorNasabah;
    this.saldo = saldoAwal;
  }

  deposit(amount) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        {
          this.saldo += amount;
          resolve(`Deposit berhasil! Saldo sekarang = ${this.saldo}`);
        }
      }, 2000);
    });
  }

  withdraw(amount) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        if (amount > this.saldo) {
          let saldoSementara = this.saldo;
          reject(
            new Error(
              "Pengurangan saldo melebihi sisa saldo Anda, saldo dikembalikan ke nilai sebelumnya"
            )
          );
          return (this.saldo = saldoSementara);
        } else if (isNaN(amount) == true || amount < 0) {
          reject(
            new Error(
              "Jumlah tidak valid. Silahkan memasukkan angka yang benar."
            )
          );
        } else {
          this.saldo -= amount;
          resolve(
            `Penarikan berhasil! Saldo Anda sekarang adalah ${this.saldo}`
          );
        }
      }, 2000);
    });
  }

  getNamaNasabah() {
    return this.namaNasabah;
  }

  getSaldo() {
    return this.saldo;
  }

  getInfoNasabah() {
    return {
      namaNasabah: this.namaNasabah,
      nomorNasabah: this.nomorNasabah,
      saldo: this.saldo,
    };
  }
}
