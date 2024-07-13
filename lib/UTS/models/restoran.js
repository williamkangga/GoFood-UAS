import mongoose from "mongoose";

const RestoranSchema = new mongoose.Schema({
  nama: { type: String, required: true },
  alamat: { type: String, required: true },
  jarak: { type: Number, required: true },
  gambar: { type: String, required: true },
  menu: [{ type: mongoose.Schema.Types.ObjectId, ref: "Menu" }],
});

const Restoran = mongoose.model("Restoran", RestoranSchema);
export default Restoran;