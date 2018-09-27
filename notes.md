Users Table
	Has many :collections
	Has many :pieces, through: :collections
	Has many :patterns, through: :collections

User_id
Username
Email
Password


Patterns Table       
Has many :collections
has many :pieces, through: :collections
Pattern Name
Color Collection/ Colorway/Theme
Pattern ID


Pieces Table
has many :collections
has many :patterns, through: :collections
Piece Name
Shape
Size
Quantity

Collection Join Table
user_id
pattern_id
piece_id


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
