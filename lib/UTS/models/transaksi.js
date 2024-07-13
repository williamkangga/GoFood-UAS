import mongoose from "mongoose";
const TransactionSchema = new mongoose.Schema({
  restoId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Restoran",
    required: true,
  },
  items: [
    {
      menuId: { type: mongoose.Schema.Types.ObjectId, ref: "Menu",required: true },
      quantity: { type: Number, required: true },
    },
  ],
  paymentMethod: { type: String, required: true },
  alamatPengiriman: { type: String, required: true },
  totalHarga: { type: Number, required: true },
  estimasiPengiriman: { type: String, required: true },
});

const Transaksi = mongoose.model("Transaksi", TransactionSchema);
export default Transaksi;