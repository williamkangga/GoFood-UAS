import Menu from "./menu.js";
import Restoran from "./restoran.js";

const addRestoranAndMenu = async () => {
  try {
    const restoran1 = new Restoran({
      nama: "Burger King",
      alamat: "Jalan Sudirman No. 10",
      jarak: 0.5,
      gambar: "https://th.bing.com/th/id/OIP.l3eYhQlv19DYRs_cBofCGQHaHa?rs=1&pid=ImgDetMain",
    });

    const savedRestoran1 = await restoran1.save();

    const menuData1 = [
      {
        nama: "Whopper",
        harga: 50000,
        deskripsi:
          "Burger klasik dengan patty daging sapi panggang, selada, tomat, bawang bombay, acar, dan saus Whopper",
        gambar:
          "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ec545603-cf4e-48e0-936d-5376ea12fdc0/dh7sd81-e99459a0-798b-4e7b-8ce6-799e9fa7deec.png/v1/fit/w_640,h_427/burger_king_impossible_whopper_png_2024_by_wcwjunkbox_dh7sd81-375w-2x.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NDI3IiwicGF0aCI6IlwvZlwvZWM1NDU2MDMtY2Y0ZS00OGUwLTkzNmQtNTM3NmVhMTJmZGMwXC9kaDdzZDgxLWU5OTQ1OWEwLTc5OGItNGU3Yi04Y2U2LTc5OWU5ZmE3ZGVlYy5wbmciLCJ3aWR0aCI6Ijw9NjQwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.jZdj-Hh_0T27XeMkKKAz6Ytk4RAlL6AxQwkZpZQOPrE",
        restoId: savedRestoran1._id,
      },
      {
        nama: "French Fries",
        harga: 15000,
        deskripsi: "Kentang goreng renyah yang disajikan dengan saus tomat",
        gambar:
          "https://static.vecteezy.com/system/resources/previews/025/064/780/non_2x/french-fries-with-ai-generated-free-png.png",
        restoId: savedRestoran1._id,
      },
      {
        nama: "Milkshake Coklat",
        harga: 20000,
        deskripsi: "Minuman milkshake cokelat yang segar dan creamy",
        gambar:
          "https://e7.pngegg.com/pngimages/830/968/png-clipart-milkshake-sundae-chocolate-milk-burger-king-milkshake-food-sweetness-thumbnail.png",
        restoId: savedRestoran1._id,
      },
      {
        nama: "Cheese Whopper Jr",
        harga: 52000,
        deskripsi:
          "Burger klasik dengan patty daging sapi panggang,keju, selada, tomat, bawang bombay, acar, dan saus Whopper",
        gambar:
          "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ec545603-cf4e-48e0-936d-5376ea12fdc0/dh7s5jn-156e1e35-6ab3-4338-8d06-f3634c99c385.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2VjNTQ1NjAzLWNmNGUtNDhlMC05MzZkLTUzNzZlYTEyZmRjMFwvZGg3czVqbi0xNTZlMWUzNS02YWIzLTQzMzgtOGQwNi1mMzYzNGM5OWMzODUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.WXLHqVf7nJiL4BGdtl3fj-HF3qnrz6iFPqLniS_IKG8",
        restoId: savedRestoran1._id,
      },
      {
        nama: "Chicken Burger",
        harga: 25000,
        deskripsi:
          "Burger klasik dengan patty daging ayam, selada, tomat, bawang bombay, acar",
        gambar:
          "https://w7.pngwing.com/pngs/482/522/png-transparent-hamburger-whopper-crispy-fried-chicken-burger-king-grilled-chicken-sandwiches-cheeseburger-chicken-food-animals-recipe.png",
        restoId: savedRestoran1._id,
      },
      {
        nama: "Super Float Coke",
        harga: 17000,
        deskripsi: "Minuman Cola dengan topping Ice Cream",
        gambar:
          "https://media-order.bkdelivery.co.id/thumb/product_photo/2023/3/20/erce8ichu49pxe5hats4lt_product_list.jpg",
        restoId: savedRestoran1._id,
      },
      {
        nama: "Kopi Gula Aren Original",
        harga: 22000,
        deskripsi: "Kopi dengan susu ditambah dengan gula aren",
        gambar:
          "https://media-order.bkdelivery.co.id/thumb/product_photo/2023/3/20/lqpkpbcuhkcx3erf8ke7jy_product_list.jpg",
        restoId: savedRestoran1._id,
      },
      {
        nama: "Lemon tea",
        harga: 23000,
        deskripsi: "Lemon Tea",
        gambar:
          "https://media-order.bkdelivery.co.id/thumb/product_photo/2023/3/20/gcbearewvtdxzwebwxpfws_product_list.jpg",
        restoId: savedRestoran1._id,
      },
    ];

    const insertedMenus1 = await Menu.insertMany(menuData1);
    savedRestoran1.menu = insertedMenus1.map((menu) => menu._id);
    await savedRestoran1.save();

    const restoran2 = new Restoran({
      nama: "Pizza Hut",
      alamat: "Jalan Thamrin No. 20",
      jarak: 1.0,
      gambar:
        "https://www.citypng.com/public/uploads/preview/restaurant-pizza-hut-brand-logo-hd-png-11670140073fdmjm00dzs.png",
    });

    const savedRestoran2 = await restoran2.save();

    const menuData2 = [
      {
        nama: "Super Supreme Pizza",
        harga: 75000,
        deskripsi:
          "Pizza dengan berbagai topping seperti pepperoni, jamur, paprika, dan keju mozzarella.",
        gambar:
          "https://e7.pngegg.com/pngimages/883/298/png-clipart-pizza-hut-kfc-fajita-pepperoni-pizza-food-recipe-thumbnail.png",
        restoId: savedRestoran2._id,
      },
      {
        nama: "Spaghetti Bolognese",
        harga: 45000,
        deskripsi: "Spaghetti dengan saus bolognese dan daging sapi cincang.",
        gambar:
          "https://www.pizzahut.co.id/assets/images/digital_menu/phr/menu/pasta-rice/beef-spaghetti.png",
        restoId: savedRestoran2._id,
      },
      {
        nama: "Ice Blended Mocha",
        harga: 30000,
        deskripsi: "Minuman kopi yang segar dengan campuran es dan cokelat.",
        gambar:
          "https://w7.pngwing.com/pngs/314/38/png-transparent-clear-drinking-glass-caffe-mocha-milkshake-frappe-coffee-iced-coffee-white-russian-iced-americano-cream-frozen-dessert-coffee-thumbnail.png",
        restoId: savedRestoran2._id,
      },
      {
        nama: "Deluxe Smoked Beef ",
        harga: 75000,
        deskripsi: "Daging Sapi Asap, Onion, Keju Mozzarella,",
        gambar:
          "https://www.pizzahut.co.id/assets/images/digital_menu/phr/menu/my-box/pizza/beef-bbq.png",
        restoId: savedRestoran2._id,
      },
      {
        nama: "Duo Meat BBQ ",
        harga: 85000,
        deskripsi:
          "Sosis Sapi, Sosis Ayam, Onion, Keju Mozzarella, Saus Honey BBQ",
        gambar:
          "https://d2l1qb2xg9gi7w.cloudfront.net/za/images/Website/bbq-meat-lovers5274.png",
        restoId: savedRestoran2._id,
      },
      {
        nama: "Sweet Chili Chicken",
        harga: 62000,
        deskripsi: "Sosis Ayam, Keju Mozzarella, Tomato Mayo, Saus Mayonnise",
        gambar:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGtLhhh10zil60S1b9yPgyPQKZwGJJJbiJZQ&s",
        restoId: savedRestoran2._id,
      },
      {
        nama: "Fire Beef",
        harga: 78000,
        deskripsi:
          "Burger sapi, Keju Mozzarella, Saus Garlic Butter, Saus Chilli",
        gambar:
          "https://png.pngtree.com/png-clipart/20220427/ourmid/pngtree-pizza-with-dimsum-side-view-png-image_4557200.png",
        restoId: savedRestoran2._id,
      },
    ];

    const insertedMenus2 = await Menu.insertMany(menuData2);

    savedRestoran2.menu = insertedMenus2.map((menu) => menu._id);
    await savedRestoran2.save();

    const restoran3 = new Restoran({
      nama: "KFC",
      alamat: "Jalan Gatot Subroto No. 30",
      jarak: 1.5,
      gambar: "https://pngimg.com/uploads/kfc/kfc_PNG33.png",
    });

    const savedRestoran3 = await restoran3.save();

    const menuData3 = [
      {
        nama: "Original Recipe Chicken",
        harga: 25000,
        deskripsi: "Ayam goreng dengan resep asli KFC yang gurih dan renyah.",
        gambar: "https://images.ctfassets.net/crbk84xktnsl/27KidfkxEqql9ns0Jfuh5c/31e82d59d631e31effed2caddaa38511/Modifier_Original_Recipe_1.png",
        restoId: savedRestoran3._id,
      },
      {
        nama: "Zinger Burger",
        harga: 30000,
        deskripsi: "Burger dengan fillet ayam pedas yang renyah, selada, dan mayones.",
        gambar: "https://images.ctfassets.net/crbk84xktnsl/4zgRg2g2ZRBey10D3qfjyZ/e9f079f486f401b884ad570be0a48af8/Zinger_Burger.png",
        restoId: savedRestoran3._id,
      },
      {
        nama: "Twister",
        harga: 30000,
        deskripsi: "Wrap ayam dengan potongan ayam, sayuran, dan saus spesial.",
        gambar: "https://th.bing.com/th/id/R.cb776064a0e88b31e269aa243728fb27?rik=PbQO0Cz06N5rVQ&riu=http%3a%2f%2fs3-eu-west-1.amazonaws.com%2fkfc-nl%2f51b4463c-9342fc75%2ftwister-twister.png&ehk=66FNs1eB7LdLWoEn2k9xCoTIO%2fv2binVRAa%2bL%2f2SQg4%3d&risl=&pid=ImgRaw&r=0",
        restoId: savedRestoran3._id,
      },
      {
        nama: "Cheese Fries",
        harga: 20000,
        deskripsi: "Kentang goreng dengan taburan keju leleh.",
        gambar: "https://ocs-pl.oktawave.com/v1/AUTH_876e5729-f8dd-45dd-908f-35d8bb716177/amrest-web-ordering/CZ/KFC/2021/Cheese%20promo/KentuckyFries.png",
        restoId: savedRestoran3._id,
      },
      {
        nama: "Pepsi",
        harga: 10000,
        deskripsi: "Minuman Pepsi dingin yang menyegarkan.",
        gambar: "https://w7.pngwing.com/pngs/827/412/png-transparent-kfc-pepsi-blue-soft-drink-cola-pepsi-blue-family-pepsico.png",
        restoId: savedRestoran3._id,
      },
    ];

    const insertedMenus3 =await Menu.insertMany(menuData3);
    savedRestoran3.menu = insertedMenus3.map((menu) => menu._id);
    await savedRestoran3.save();

    const restoran4 = new Restoran({
      nama: "McDonald's",
      alamat: "Jalan Sisingamangaraja No. 40",
      jarak: 2.0,
      gambar: "https://th.bing.com/th/id/OIP.z8AwkokZlSeXYprbB6f3pwHaHk?rs=1&pid=ImgDetMain",
    });

    const savedRestoran4 = await restoran4.save();

    const menuData4 = [
      {
        nama: "Big Mac",
        harga: 40000,
        deskripsi: "Burger dengan dua patty daging sapi, selada, keju, dan saus spesial.",
        gambar: "https://th.bing.com/th/id/OIP.D_AKAb-FVVAUQmGiHukDAwHaGG?rs=1&pid=ImgDetMain",
        restoId: savedRestoran4._id,
      },
      {
        nama: "McChicken",
        harga: 25000,
        deskripsi: "Burger ayam dengan daging ayam renyah, selada, dan mayones.",
        gambar: "https://th.bing.com/th/id/OIP.BpS8od_inuILkA5AYABMTQHaEq?rs=1&pid=ImgDetMain",
        restoId: savedRestoran4._id,
      },
      {
        nama: "French Fries",
        harga: 15000,
        deskripsi: "Kentang goreng renyah dengan garam.",
        gambar: "https://i.pinimg.com/originals/de/d5/81/ded581c487492841750f6d6ec7c92d55.png",
        restoId: savedRestoran4._id,
      },
      {
        nama: "McFlurry Oreo",
        harga: 20000,
        deskripsi: "Es krim McFlurry dengan potongan biskuit Oreo.",
        gambar: "https://www.mcdonalds.at/wp-content/uploads/2022/10/1500x1500-web-neu-desserts-4-mcflurry-oreo-schoko.png",
        restoId: savedRestoran4._id,
      },
      {
        nama: "Coca Cola",
        harga: 10000,
        deskripsi: "Minuman Coca Cola dingin yang menyegarkan.",
        gambar: "https://th.bing.com/th/id/OIP.3HAwK-PLpzBWoo9v6IUjqAHaHa?rs=1&pid=ImgDetMain",
        restoId: savedRestoran4._id,
      },
      {
        nama: "Double Cheeseburger",
        harga: 35000,
        deskripsi: "Burger dengan dua patty daging sapi, dua lapis keju, acar, bawang, mustard, dan saus tomat.",
        gambar: "https://mcdonalds.com.au/sites/mcdonalds.com.au/files/hero_pdt_double_cheeseburger.png",
        restoId: savedRestoran4._id,
      },
      {
        nama: "Spicy Chicken McDeluxe",
        harga: 40000,
        deskripsi: "Burger ayam dengan daging ayam pedas, selada, dan saus mayones.",
        gambar: "https://th.bing.com/th/id/R.1c6965a69c0b7e9b2794b1ce665b0cce?rik=1d%2buY%2fOnSLAR5g&riu=http%3a%2f%2fimg1.wikia.nocookie.net%2f__cb20140925192015%2fronaldmcdonald%2fimages%2f9%2f9c%2fMcdonalds-Hot-n-Spicy-McChicken.png&ehk=Yx0X9wdbDAcIZl8cf1NZFgCfqmTT88mxGR%2fCB9XG9i4%3d&risl=&pid=ImgRaw&r=0",
        restoId: savedRestoran4._id,
      },
      {
        nama: "Apple Pie",
        harga: 15000,
        deskripsi: "Pie renyah dengan isian apel manis.",
        gambar: "https://toppng.com/uploads/preview/mcdonalds-apple-pie-philippines-11563610918zfuj0mr3ir.png",
        restoId: savedRestoran4._id,
      },
      {
        nama: "Hot Fudge Sundae",
        harga: 18000,
        deskripsi: "Es krim sundae dengan saus cokelat panas.",
        gambar: "https://mcdonalds.com.au/sites/mcdonalds.com.au/files/product-Sundae-Hot-fudge-2023-mobile.png",
        restoId: savedRestoran4._id,
      },
    ];

    const insertedMenus4 =await Menu.insertMany(menuData4);
    savedRestoran4.menu = insertedMenus4.map((menu) => menu._id);
    await savedRestoran4.save();

    const restoran5 = new Restoran({
      nama: "Starbucks",
      alamat: "Jalan Pemuda No. 50",
      jarak: 2.5,
      gambar: "https://purepng.com/public/uploads/large/purepng.com-starbucks-logologobrand-logoiconslogos-251519940454ao8bk.png",
    });

    const savedRestoran5 = await restoran5.save();

    const menuData5 = [
      {
        nama: "Caffè Latte",
        harga: 53000,
        deskripsi: "Minuman kopi espresso dengan susu yang lembut.",
        gambar: "https://w7.pngwing.com/pngs/758/88/png-transparent-cafe-iced-coffee-latte-starbucks-coffee-cream-food-cafe.png",
        restoId: savedRestoran5._id,
      },
      {
        nama: "Caramel Macchiato",
        harga: 60000,
        deskripsi: "Minuman espresso dengan sirup vanila, susu, dan saus karamel.",
        gambar: "https://www.seekpng.com/png/detail/201-2018376_starbucks-coffee-png-starbucks-caramel-macchiato-flavour.png",
        restoId: savedRestoran5._id,
      },
      {
        nama: "Green Tea Latte",
        harga: 48000,
        deskripsi: "Minuman latte dengan matcha green tea.",
        gambar: "https://th.bing.com/th/id/OIP.bNrirT9dvNvUfN4bT9AGsAHaHa?rs=1&pid=ImgDetMain",
        restoId: savedRestoran5._id,
      },
      {
        nama: "Blueberry Muffin",
        harga: 40000,
        deskripsi: "Muffin lembut dengan blueberry segar.",
        gambar: "https://coffeeclub.blog/coffee/uploads/2016/02/Starbucks-Blueberry-Muffin-and-Coffee.jpeg",
        restoId: savedRestoran5._id,
      },
      {
        nama: "Chocolate Croissant",
        harga: 45000,
        deskripsi: "Croissant dengan isian cokelat leleh.",
        gambar: "https://th.bing.com/th/id/OIP.M1kLjUJG7dkZq-ae5N9TxAAAAA?rs=1&pid=ImgDetMain",
        restoId: savedRestoran5._id,
      },
    ];

    const insertedMenus5 =await Menu.insertMany(menuData5);
    savedRestoran5.menu = insertedMenus5.map((menu) => menu._id);
    await savedRestoran5.save();

    console.log("Restoran dan menu berhasil ditambahkan");
  } catch (error) {
    console.error("Error menambahkan restoran dan menu:", error);
  }
};

export default addRestoranAndMenu;