Users Table
	Has many :patterns
	Has many :pieces, through: :patterns

User_id
Username
Email
Password


Patterns Table       
Has many :pieces
Belongs to :user?
Pattern Name
Color Collection/ Colorway
Pattern ID


Pieces Table
Belongs to :pattern
Belongs to :user?
Pattern ID
Piece Name
Shape Class
Size
Quantity
Price

Separate Cost Table??
Currency – Euro, Dollar, Pound


Collections:
Toast & Marmalade
Polka Dot
Blues
Wallflower
Pinks
From Nature
Children’s Pattern
People & Places

Shapes:
• Mugs
• Jugs
• Bowls
• Plats
• Teapots
• Teacups & Saucers
• Cake Stands & Plates
• Large Bowls & Platters
• Hen on Nests & Egg Cups
• Butter Dishes
• Pet Bowls
• Glass
• Enamel Cookware
• Cutlery
• Chopping Boards & Wood
• Tea Towels & Aprons
• Oven Gloves & Hob Covers
• Melamine
• Tins & Storage
• Trays
• Napkins
• Tablemats & Coasters
• Pet Bowls

Gill Sans Font
