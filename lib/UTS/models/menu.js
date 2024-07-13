import mongoose from "mongoose";


const MenuSchema = new mongoose.Schema({
  nama: { type: String, required: true },
  harga: { type: Number, required: true },
  deskripsi: { type: String, required: true },
  gambar: { type: String, required: true },
  restoId: { type: mongoose.Schema.Types.ObjectId, ref: 'Restoran' }
});
const Menu = mongoose.model("Menu", MenuSchema);
export default Menu;