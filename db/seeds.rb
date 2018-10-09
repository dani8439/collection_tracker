user1 = User.create(:username => "BaublesBaloo", :email => "Baubles@hotmail.com", :password => "Woof!"),
user2 = User.create(:username => "FalafelMonster", :email => "Challabackyoungin@aol.com", :password => "harruu")

pattern1 = Pattern.create(name: "Toast & Marmalade", theme: "Toast & Marmalade"),
pattern2 = Pattern.create(name: "Cambridge Blue Toast", theme: "Toast & Marmalade"),
pattern3 = Pattern.create(name: "Blue Skies", theme: "Toast & Marmalade"),
pattern4 = Pattern.create(name: "Starry Toast", theme: "Toast & Marmalade"),
pattern5 = Pattern.create(name: "Polka Dot", theme: "Polka Dot"),
pattern6 = Pattern.create(name: "Starry Skies", theme: "Blues"),
pattern7 = Pattern.create(name: "Blue Shells", theme: "Blues"),
pattern8 = Pattern.create(name: "Utility", theme: "Blues"),
pattern9 = Pattern.create(name: "Tiny Scattered Rose", theme: "Pinks"),
pattern10 = Pattern.create(name: "Love & Kisses", theme: "Pinks")

piece1 = Piece.create(name: "Jug", size: "1/4 Pint", quantity: "3"),
piece2 = Piece.create(name: "Bowl", size: "French", quantity: "10"),
piece3 = Piece.create(name: "Teacup & Saucer", size: "Small", quantity: "6"),
piece4 = Piece.create(name: "Mug", size: "1/2 Pint", quantity: "20"),
piece5 = Piece.create(name: "Mug", size: "Baby", quantity: "4"),
piece6 = Piece.create(name: "Mug", size: "1 Pint", quantity: "4"),
piece7 = Piece.create(name: "Mug", size: "2 Pint", quantity: "1"),
piece8 = Piece.create(name: "Teapot", size: "2 Cup", quantity: "2"),
piece9 = Piece.create(name: "Plate", size: "6.5 inch", quantity: "15"),
piece10 = Piece.create(name: "Teacup & Saucer", size: "Large", quantity: "3"),
piece11 = Piece.create(name: "Jug", size: "1/2 Pint", quantity: "1"),
piece12 = Piece.create(name: "Jug", size: "3 Pint", quantity: "0"),
piece13 = Piece.create(name: "Teacup & Saucer", size: "Dollies", quantity: "0"),
piece14 = Piece.create(name: "Eggcup", size: "N/A", quantity: "6"),
piece15 = Piece.create(name: "Plate", size: "Soupplate", quantity: "4")
