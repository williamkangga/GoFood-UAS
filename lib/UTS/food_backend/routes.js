import express from "express";
import User from "./model/user.js";
import Restoran from "./model/restoran.js";
import Transaksi from "./model/transaksi.js";
import addRestoranAndMenu from "./addrestoandmenu.js";

const router = express.Router();

// Route untuk register user
router.post("/register", async (req, res) => {
  const { username, password } = req.body;

  if (!username || !password) {
    return res
      .status(400)
      .send({ message: "Username and password are required" });
  }

  try {
    const user = new User({
      username,
      password,
    });

    await user.save();

    res.send({ message: "User was registered successfully!" });
  } catch (err) {
    res.status(500).send({
      message: err.message || "Some error occurred while registering",
    });
  }
});

// Route untuk login
router.post("/login", async (req, res) => {
  try {
    const user = await User.findOne({
      username: req.body.username,
    });

    if (!user) {
      return res.status(404).send({ message: "User not found." });
    }

    const passwordIsValid = req.body.password === user.password;

    if (!passwordIsValid) {
      return res.status(401).send({
        message: "Invalid Password!",
      });
    }

    res.status(200).send({
      id: user._id,
      username: user.username,
    });
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
});
const calculateTotalPrice = async (restoId, items) => {
  try {
    const resto = await Restoran.findById(restoId).populate("menu");
    if (!resto) {
      throw new Error("Restaurant not found");
    }

    let total = 0;
    items.forEach((item) => {
      const menu = resto.menu.find(
        (menu) => menu._id.toString() === item.menuId.toString()
      );
      if (menu) {
        total += menu.harga * item.quantity;
      } else {
        throw new Error(`Menu with ID ${item.menuId} not found in restaurant`);
      }
    });

    return total;
  } catch (error) {
    throw new Error(`Error calculating total price: ${error.message}`);
  }
};

// Route untuk mendapatkan daftar toko
router.get("/resto/list", async (req, res) => {
  try {
    const restoList = await Restoran.find().populate("menu");
    res.status(200).json({ status: 200, data: restoList });
  } catch (err) {
    res.status(500).json({
      status: 500,
      message: "Error getting restaurant list",
      error: err.message,
    });
  }
});

router.get('/resto/list/:restoId', async (req, res) => {
  const { restoId } = req.params;

  try {
    const restoran = await Restoran.findById(restoId).populate('menu');

    if (!restoran) {
      return res.status(404).json({
        status: 404,
        message: 'Restoran not found'
      });
    }

    res.status(200).json({
      status: 200,
      data: restoran
    });
  } catch (err) {
    res.status(500).json({
      status: 500,
      message: 'Error getting restaurant details',
      error: err.message,
    });
  }
});


// Route untuk membuat transaksi
router.post("/transaction/create", async (req, res) => {
  try {
    const { restoId, items, paymentMethod, alamatPengiriman } = req.body;
    const totalHarga = await calculateTotalPrice(restoId, items);

    const newTransaction = new Transaksi({
      restoId,
      items,
      paymentMethod,
      alamatPengiriman,
      totalHarga,
      estimasiPengiriman: "30 menit",
    });

    const savedTransaction = await newTransaction.save();

    res.status(201).json({
      status: 201,
      data: {
        transactionId: savedTransaction._id,
        totalHarga: savedTransaction.totalHarga,
        estimasiPengiriman: savedTransaction.estimasiPengiriman,
      },
    });
  } catch (err) {
    res.status(500).json({
      status: 500,
      message: "Error creating transaction",
      error: err.message,
    });
  }
});



export default router;