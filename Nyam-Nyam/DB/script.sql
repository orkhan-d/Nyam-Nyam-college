USE [NyamNyam]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 17.04.2024 15:34:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 17.04.2024 15:34:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CookingStage]    Script Date: 17.04.2024 15:34:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CookingStage](
	[Id] [int] NOT NULL,
	[DishId] [int] NULL,
	[ProcessDescription] [nvarchar](900) NULL,
	[TimeInMinutes] [int] NULL,
 CONSTRAINT [PK_CookingStage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CookStage]    Script Date: 17.04.2024 15:34:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CookStage](
	[Id] [nchar](10) NOT NULL,
	[DishId] [nchar](10) NULL,
	[Description] [nchar](10) NULL,
	[Minutes] [nchar](10) NULL,
 CONSTRAINT [PK_CookStage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dish]    Script Date: 17.04.2024 15:34:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dish](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[BaseServingsQuantity] [int] NULL,
	[CategoryId] [int] NULL,
	[Image] [nvarchar](20) NULL,
	[RecipeLink] [nvarchar](100) NULL,
	[Description] [nvarchar](600) NULL,
	[FinalPriceInCents] [int] NULL,
	[Available] [int] NULL,
 CONSTRAINT [PK_Dish] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredient]    Script Date: 17.04.2024 15:34:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredient](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CostInCents] [int] NULL,
	[UnitId] [int] NULL,
	[AvailableCount] [int] NULL,
 CONSTRAINT [PK_Ingredient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IngredientOfStage]    Script Date: 17.04.2024 15:34:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngredientOfStage](
	[CookingStageId] [int] NOT NULL,
	[IngredientId] [int] NOT NULL,
	[Quantity] [decimal](18, 2) NULL,
 CONSTRAINT [PK_IngredientOfStage] PRIMARY KEY CLUSTERED 
(
	[CookingStageId] ASC,
	[IngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 17.04.2024 15:34:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] NOT NULL,
	[ClientId] [int] NULL,
	[CreatedDT] [datetime] NULL,
	[AppointedDT] [datetime] NULL,
	[AppointedAddress] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderedDish]    Script Date: 17.04.2024 15:34:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderedDish](
	[OrderId] [int] NOT NULL,
	[DishId] [int] NOT NULL,
	[ServingsNumber] [int] NULL,
	[StartCookingDT] [datetime] NULL,
	[EndCookingDT] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 17.04.2024 15:34:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ShortName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Bread')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Desserts')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Drinks')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Fruites')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (5, N'Meat')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (6, N'Pasta')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (7, N'Salads')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (8, N'Seafood')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (9, N'Snacks')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (10, N'Soups')
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (1, 1, N'Using a damp cloth, gently clean mushrooms. Remove stems and discard.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (2, 1, N'Mince scallions and separate white and green parts.', 2)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (3, 1, N'Combine cream cheese, Cheddar cheese, the white parts from the scallions, paprika, and salt in a small bowl. Stuff filling into the mushrooms, pressing it in to fill the cavity with the back of a small spoon.', 10)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (4, 1, N'Combine cream cheese, Cheddar cheese, the white parts from the scallions, paprika, and salt in a small bowl. Stuff filling into the mushrooms, pressing it in to fill the cavity with the back of a small spoon.', 11)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (5, 1, N'Combine cream cheese, Cheddar cheese, the white parts from the scallions, paprika, and salt in a small bowl. Stuff filling into the mushrooms, pressing it in to fill the cavity with the back of a small spoon.', 12)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (6, 1, N'Combine cream cheese, Cheddar cheese, the white parts from the scallions, paprika, and salt in a small bowl. Stuff filling into the mushrooms, pressing it in to fill the cavity with the back of a small spoon.', 13)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (7, 2, N'Whisk the flour, salt, and baking powder together in a mixing bowl.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (8, 2, N'Whisk the flour, salt, and baking powder together in a mixing bowl.', 6)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (9, 2, N'Whisk the flour, salt, and baking powder together in a mixing bowl.', 7)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (10, 2, N'Mix in the lard with your fingers until the flour resembles cornmeal.', 3)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (11, 2, N'Add the water and mix until the dough comes together; place on a lightly floured surface and knead a few minutes until smooth and elastic.', 10)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (12, 3, N'Combine chocolate chips, salt, and cayenne in a heat-proof measuring cup; set aside.', 3)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (13, 3, N'Combine chocolate chips, salt, and cayenne in a heat-proof measuring cup; set aside.', 4)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (14, 3, N'Combine chocolate chips, salt, and cayenne in a heat-proof measuring cup; set aside.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (15, 3, N'Separate eggs by cracking one egg into your hand over a bowl. Open your fingers slightly and gently jiggle your hand until the egg white falls into the bowl below. Transfer the yolk to a skillet. Repeat with remaining eggs. Reserve egg whites for another use.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (16, 3, N'Add sugar, milk, and cream to egg yolks. Whisk thoroughly, breaking egg yolks first, until well combined.', 7)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (17, 3, N'Add sugar, milk, and cream to egg yolks. Whisk thoroughly, breaking egg yolks first, until well combined.', 8)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (18, 3, N'Add sugar, milk, and cream to egg yolks. Whisk thoroughly, breaking egg yolks first, until well combined.', 9)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (19, 3, N'Set a fine sieve over the bowl of reserved chocolate. Strain the custard sauce into the chocolate and let sit for 2 minutes. Whisk until chocolate has melted and custard sauce is smooth and shiny, about 2 minutes. Add vanilla and butter; stir until butter has melted, about 1 minute.', 8)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (20, 3, N'Set a fine sieve over the bowl of reserved chocolate. Strain the custard sauce into the chocolate and let sit for 2 minutes. Whisk until chocolate has melted and custard sauce is smooth and shiny, about 2 minutes. Add vanilla and butter; stir until butter has melted, about 1 minute.', 9)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (21, 3, N'Combine cream and vanilla extract for topping in a metal bowl and whisk until thickened; make sure no peaks form. Spoon cream into the glasses, then tilt and twirl to coat the sides a bit.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (22, 3, N'Combine cream and vanilla extract for topping in a metal bowl and whisk until thickened; make sure no peaks form. Spoon cream into the glasses, then tilt and twirl to coat the sides a bit.', 6)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (23, 3, N'Garnish with shaved chocolate and serve.', 3)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (24, 4, N'In a medium bowl, blend together softened butter, 2 cups flour and 1/2 cup sugar. Press into the bottom of an ungreased 9x13 inch pan.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (25, 4, N'In a medium bowl, blend together softened butter, 2 cups flour and 1/2 cup sugar. Press into the bottom of an ungreased 9x13 inch pan.', 6)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (26, 4, N'In a medium bowl, blend together softened butter, 2 cups flour and 1/2 cup sugar. Press into the bottom of an ungreased 9x13 inch pan.', 7)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (27, 4, N'Bake for 15 to 20 minutes in the preheated oven, or until firm and golden. In another bowl, whisk together the remaining 1 1/2 cups sugar and 1/4 cup flour. Whisk in the eggs and lemon juice. Pour over the baked crust.', 22)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (28, 4, N'Bake for 15 to 20 minutes in the preheated oven, or until firm and golden. In another bowl, whisk together the remaining 1 1/2 cups sugar and 1/4 cup flour. Whisk in the eggs and lemon juice. Pour over the baked crust.', 23)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (29, 4, N'Bake for 15 to 20 minutes in the preheated oven, or until firm and golden. In another bowl, whisk together the remaining 1 1/2 cups sugar and 1/4 cup flour. Whisk in the eggs and lemon juice. Pour over the baked crust.', 24)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (30, 4, N'Bake for 15 to 20 minutes in the preheated oven, or until firm and golden. In another bowl, whisk together the remaining 1 1/2 cups sugar and 1/4 cup flour. Whisk in the eggs and lemon juice. Pour over the baked crust.', 25)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (31, 5, N'Roll puff pastry out on a lightly floured surface to 1/4-inch thickness; place in the refrigerator.', 4)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (32, 5, N'Melt butter in a 9-inch cast iron skillet over medium heat; stir in brown sugar, cinnamon, and nutmeg and cook and stir until sugar dissolves, about 5 minutes. Stir maple syrup into brown sugar mixture; cook, stirring, until mixture begins to bubble. Remove skillet from heat.', 6)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (33, 5, N'Melt butter in a 9-inch cast iron skillet over medium heat; stir in brown sugar, cinnamon, and nutmeg and cook and stir until sugar dissolves, about 5 minutes. Stir maple syrup into brown sugar mixture; cook, stirring, until mixture begins to bubble. Remove skillet from heat.', 7)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (34, 5, N'Melt butter in a 9-inch cast iron skillet over medium heat; stir in brown sugar, cinnamon, and nutmeg and cook and stir until sugar dissolves, about 5 minutes. Stir maple syrup into brown sugar mixture; cook, stirring, until mixture begins to bubble. Remove skillet from heat.', 8)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (35, 5, N'Melt butter in a 9-inch cast iron skillet over medium heat; stir in brown sugar, cinnamon, and nutmeg and cook and stir until sugar dissolves, about 5 minutes. Stir maple syrup into brown sugar mixture; cook, stirring, until mixture begins to bubble. Remove skillet from heat.', 9)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (36, 5, N'Melt butter in a 9-inch cast iron skillet over medium heat; stir in brown sugar, cinnamon, and nutmeg and cook and stir until sugar dissolves, about 5 minutes. Stir maple syrup into brown sugar mixture; cook, stirring, until mixture begins to bubble. Remove skillet from heat.', 10)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (37, 5, N'Pears need to be peeled, cored, and halved, or more as needed. Place one pear half, cut side up, into the center of skillet. Cut remaining pear halves in half again; arrange pear quarters around the center pear, cut sides up.', 4)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (38, 6, N'Pound skinless, boneless chicken breasts to 1/2-inch thickness or less.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (39, 6, N'Place beaten egg in a bowl. Combine bread crumbs, grated Parmesan cheese, Italian seasoning, and garlic powder in another bowl.', 7)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (40, 6, N'Place beaten egg in a bowl. Combine bread crumbs, grated Parmesan cheese, Italian seasoning, and garlic powder in another bowl.', 8)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (41, 6, N'Place beaten egg in a bowl. Combine bread crumbs, grated Parmesan cheese, Italian seasoning, and garlic powder in another bowl.', 9)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (42, 6, N'Place beaten egg in a bowl. Combine bread crumbs, grated Parmesan cheese, Italian seasoning, and garlic powder in another bowl.', 10)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (43, 6, N'Place beaten egg in a bowl. Combine bread crumbs, grated Parmesan cheese, Italian seasoning, and garlic powder in another bowl.', 11)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (44, 6, N'Freeze in a 1-gallon resealable bag with smaller bags of tomato sauce and shredded mozzarella cheese.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (45, 6, N'Freeze in a 1-gallon resealable bag with smaller bags of tomato sauce and shredded mozzarella cheese.', 6)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (46, 7, N'Set an oven rack about 6 inches from the heat source and preheat the oven''s broiler. Grease a broiler pan with 1/2 tablespoon olive oil.', 2)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (47, 7, N'Rinse chicken breasts and pat dry. Brush with remaining olive oil until coated. Sprinkle each piece evenly on both sides with paprika, lemon-pepper, and salt.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (48, 7, N'Rinse chicken breasts and pat dry. Brush with remaining olive oil until coated. Sprinkle each piece evenly on both sides with paprika, lemon-pepper, and salt.', 6)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (49, 7, N'Rinse chicken breasts and pat dry. Brush with remaining olive oil until coated. Sprinkle each piece evenly on both sides with paprika, lemon-pepper, and salt.', 7)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (50, 7, N'Rinse chicken breasts and pat dry. Brush with remaining olive oil until coated. Sprinkle each piece evenly on both sides with paprika, lemon-pepper, and salt.', 8)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (51, 7, N'Rinse chicken breasts and pat dry. Brush with remaining olive oil until coated. Sprinkle each piece evenly on both sides with paprika, lemon-pepper, and salt.', 9)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (52, 7, N'Place on the prepared broiler pan, sprinkle garlic over top, and sprinkle onions around the base of the chicken, with several smaller pieces on top.', 3)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (53, 7, N'Place on the prepared broiler pan, sprinkle garlic over top, and sprinkle onions around the base of the chicken, with several smaller pieces on top.
', 3)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (54, 8, N'In a large bowl, combine the ground beef, egg, onion, milk and bread OR cracker crumbs.', 7)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (55, 8, N'In a large bowl, combine the ground beef, egg, onion, milk and bread OR cracker crumbs.', 8)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (56, 8, N'In a large bowl, combine the ground beef, egg, onion, milk and bread OR cracker crumbs.', 9)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (57, 8, N'In a large bowl, combine the ground beef, egg, onion, milk and bread OR cracker crumbs.', 10)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (58, 8, N'In a large bowl, combine the ground beef, egg, onion, milk and bread OR cracker crumbs.', 11)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (59, 8, N'Season with salt and pepper to taste and place in a lightly greased 9x5-inch loaf pan, or form into a loaf and place in a lightly greased 9x13-inch baking dish.', 4)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (60, 8, N'Season with salt and pepper to taste and place in a lightly greased 9x5-inch loaf pan, or form into a loaf and place in a lightly greased 9x13-inch baking dish.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (61, 8, N'In a separate small bowl, combine the brown sugar, mustard and ketchup. Mix well and pour over the meatloaf.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (62, 8, N'In a separate small bowl, combine the brown sugar, mustard and ketchup. Mix well and pour over the meatloaf.', 6)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (63, 8, N'In a separate small bowl, combine the brown sugar, mustard and ketchup. Mix well and pour over the meatloaf.', 7)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (64, 9, N'Bring a large pot of lightly salted water to a boil. Add pasta, and cook for 7 to 9 minutes, until al dente.', 10)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (65, 9, N'Melt 6 tablespoons of butter with the olive oil in a large skillet over medium heat. Mix in the chopped fresh parsley and garlic and cook for a couple of minutes until fragrant.', 4)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (66, 9, N'Melt 6 tablespoons of butter with the olive oil in a large skillet over medium heat. Mix in the chopped fresh parsley and garlic and cook for a couple of minutes until fragrant.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (67, 9, N'Melt 6 tablespoons of butter with the olive oil in a large skillet over medium heat. Mix in the chopped fresh parsley and garlic and cook for a couple of minutes until fragrant.', 6)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (68, 9, N'Melt 6 tablespoons of butter with the olive oil in a large skillet over medium heat. Mix in the chopped fresh parsley and garlic and cook for a couple of minutes until fragrant.', 7)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (69, 9, N'Add the sliced fresh mushrooms and asparagus (trimmed and cut into 1 inch pieces) and season with salt, pepper and onion powder; cook, stirring occasionally until asparagus is tender, about 5 minutes depending on the thickness.', 7)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (70, 9, N'Add the sliced fresh mushrooms and asparagus (trimmed and cut into 1 inch pieces) and season with salt, pepper and onion powder; cook, stirring occasionally until asparagus is tender, about 5 minutes depending on the thickness.', 8)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (71, 9, N'Add the sliced fresh mushrooms and asparagus (trimmed and cut into 1 inch pieces) and season with salt, pepper and onion powder; cook, stirring occasionally until asparagus is tender, about 5 minutes depending on the thickness.', 9)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (72, 9, N'Add the sliced fresh mushrooms and asparagus (trimmed and cut into 1 inch pieces) and season with salt, pepper and onion powder; cook, stirring occasionally until asparagus is tender, about 5 minutes depending on the thickness.', 10)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (73, 9, N'Add the sliced fresh mushrooms and asparagus (trimmed and cut into 1 inch pieces) and season with salt, pepper and onion powder; cook, stirring occasionally until asparagus is tender, about 5 minutes depending on the thickness.', 11)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (74, 9, N'Place the rinsed and patted dry scallops in the pan, and cook briefly on each side until lightly browned and the center is cooked through, about 3 minutes per side. Remove from the heat when scallops are just finished.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (75, 9, N'Meanwhile, in a small saucepan, combine the milk, mascarpone cheese and remaining butter. Cook over medium heat, stirring, until sauce is warm and butter is completely melted and blended in.', 3)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (76, 9, N'Meanwhile, in a small saucepan, combine the milk, mascarpone cheese and remaining butter. Cook over medium heat, stirring, until sauce is warm and butter is completely melted and blended in.', 4)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (77, 9, N'Meanwhile, in a small saucepan, combine the milk, mascarpone cheese and remaining butter. Cook over medium heat, stirring, until sauce is warm and butter is completely melted and blended in.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (78, 10, N'Combine chicken breasts and chicken broth in a saucepan over medium-high heat. Bring to a boil, cover, and reduce heat to low; simmer for 5 minutes. Turn breasts, cover, and simmer another 5 minutes. Remove from heat and let sit with the cover on for 15 minutes.', 30)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (79, 10, N'Combine chicken breasts and chicken broth in a saucepan over medium-high heat. Bring to a boil, cover, and reduce heat to low; simmer for 5 minutes. Turn breasts, cover, and simmer another 5 minutes. Remove from heat and let sit with the cover on for 15 minutes.', 31)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (80, 10, N'Stir garlic, black pepper, and heavy cream into the reduced broth; bring to a simmer and remove from heat.', 7)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (81, 10, N'Stir garlic, black pepper, and heavy cream into the reduced broth; bring to a simmer and remove from heat.', 8)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (82, 10, N'Stir garlic, black pepper, and heavy cream into the reduced broth; bring to a simmer and remove from heat.', 9)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (83, 10, N'Whisk egg yolks in a bowl until smooth. Beat 1 tablespoon of the warm cream mixture into the eggs until thoroughly incorporated; repeat until about 1/2 cup of the warm cream mixture is used.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (84, 10, N'Whisk the warm cream and egg mixture back into the saucepan with the remaining cream mixture. Cook over medium-low heat, whisking constantly, until the mixture almost comes to a simmer and thickens, about 5 minutes. Season with salt and black pepper to taste.', 6)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (85, 10, N'Bring a large pot of lightly salted water to a boil. Cook fettuccine in boiling water, stirring occasionally, until nearly cooked through, about 7 minutes. Drain.', 10)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (86, 10, N'Stir chopped fresh parsley, 1 cup of freshly grated Parmigiano-Reggiano, and cream mixture into the pasta. Remove from heat, cover, and let sit for a few minutes until thick.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (87, 10, N'Stir chopped fresh parsley, 1 cup of freshly grated Parmigiano-Reggiano, and cream mixture into the pasta. Remove from heat, cover, and let sit for a few minutes until thick.', 6)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (88, 11, N'Wrap beets loosely in aluminum foil and place on a rimmed baking sheet.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (89, 11, N'Mix vinegar and maple syrup together; season with salt and pepper. Pour over beets.', 10)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (90, 11, N'Mix vinegar and maple syrup together; season with salt and pepper. Pour over beets.', 11)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (91, 11, N'Mix vinegar and maple syrup together; season with salt and pepper. Pour over beets.', 12)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (92, 11, N'Mix vinegar and maple syrup together; season with salt and pepper. Pour over beets.', 13)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (93, 12, N'Combine lemon juice, anchovies, garlic, and mustard in a blender or food processor fitted with a steel blade. Process until thoroughly combined.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (94, 12, N'Combine lemon juice, anchovies, garlic, and mustard in a blender or food processor fitted with a steel blade. Process until thoroughly combined.', 6)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (95, 12, N'Combine lemon juice, anchovies, garlic, and mustard in a blender or food processor fitted with a steel blade. Process until thoroughly combined.', 7)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (96, 12, N'Combine lemon juice, anchovies, garlic, and mustard in a blender or food processor fitted with a steel blade. Process until thoroughly combined.', 8)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (97, 12, N'Pour in olive oil very gradually through the feed tube while machine is running, first 1 tablespoon at a time, then gradually increasing the amount. Season with salt and pepper.', 3)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (98, 12, N'Pour in olive oil very gradually through the feed tube while machine is running, first 1 tablespoon at a time, then gradually increasing the amount. Season with salt and pepper.', 4)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (99, 12, N'Pour in olive oil very gradually through the feed tube while machine is running, first 1 tablespoon at a time, then gradually increasing the amount. Season with salt and pepper.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (100, 12, N'Stack and bunch the kale leaves together on a cutting board and cut across the stack into skinny slivers.', 4)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (101, 12, N'Place the kale, croutons, and Parmesan cheese in the bowl and drizzle with about a 1/4 of the dressing. Toss and taste the salad and add more dressing if desired, then toss again.', 3)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (102, 12, N'Place the kale, croutons, and Parmesan cheese in the bowl and drizzle with about a 1/4 of the dressing. Toss and taste the salad and add more dressing if desired, then toss again.', 4)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (103, 13, N'In a small bowl, mix honey, mustard, and lemon juice.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (104, 13, N'In a small bowl, mix honey, mustard, and lemon juice.', 6)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (105, 13, N'In a small bowl, mix honey, mustard, and lemon juice.', 7)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (106, 13, N'Spread the mixture over the salmon steaks.', 3)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (107, 13, N'Season with pepper. Arrange in a medium baking dish.', 4)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (108, 14, N'Cut tips from 6 trimmed asparagus spears, about 1 1/2 inches from the top; reserve for garnish later. Chop the remaining asparagus into chunks.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (109, 14, N'Heat olive oil in a soup pot over medium heat; cook and stir chopped shallot in the hot oil until softened, about 3 minutes.', 4)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (110, 14, N'Heat olive oil in a soup pot over medium heat; cook and stir chopped shallot in the hot oil until softened, about 3 minutes.', 4)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (111, 14, N'Add chopped asparagus; season with chopped mint, salt, and pepper. Cook until asparagus are slightly tender, about 3 minutes.', 4)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (112, 14, N'Add chopped asparagus; season with chopped mint, salt, and pepper. Cook until asparagus are slightly tender, about 3 minutes.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (113, 14, N'Add chopped asparagus; season with chopped mint, salt, and pepper. Cook until asparagus are slightly tender, about 3 minutes.', 6)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (114, 14, N'Pour chicken stock into asparagus mixture; bring to a boil. Reduce heat and simmer until asparagus are tender, 12 to 15 minutes. Stir in lemon zest.', 15)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (115, 14, N'Pour chicken stock into asparagus mixture; bring to a boil. Reduce heat and simmer until asparagus are tender, 12 to 15 minutes. Stir in lemon zest.', 16)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (116, 14, N'Garnish soup with asparagus tips and hard-boiled chopped egg.', 12)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (117, 15, N'Preheat oven to 400 degrees F (200 degrees C). Arrange julienned tortilla strips on a baking sheet.', 5)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (118, 15, N'Heat oil in a large saucepan over medium heat. Cook sliced onion, garlic, and jalapenos in oil until lightly browned, 4 to 5 minutes.', 8)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (119, 15, N'Heat oil in a large saucepan over medium heat. Cook sliced onion, garlic, and jalapenos in oil until lightly browned, 4 to 5 minutes.', 9)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (120, 15, N'Heat oil in a large saucepan over medium heat. Cook sliced onion, garlic, and jalapenos in oil until lightly browned, 4 to 5 minutes.', 10)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (121, 15, N'Heat oil in a large saucepan over medium heat. Cook sliced onion, garlic, and jalapenos in oil until lightly browned, 4 to 5 minutes.', 11)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (122, 15, N'Prepare skinless and boneless chicken - cut into thin strips', 3)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (123, 15, N'Stir in chicken, chicken broth, lime juice, tomato (seeded and diced), salt and pepper. Gently simmer until chicken is no longer pink, about 10 minutes.', 12)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (124, 15, N'Stir in chicken, chicken broth, lime juice, tomato (seeded and diced), salt and pepper. Gently simmer until chicken is no longer pink, about 10 minutes.', 13)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (125, 15, N'Stir in chicken, chicken broth, lime juice, tomato (seeded and diced), salt and pepper. Gently simmer until chicken is no longer pink, about 10 minutes.', 14)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (126, 15, N'Stir in chicken, chicken broth, lime juice, tomato (seeded and diced), salt and pepper. Gently simmer until chicken is no longer pink, about 10 minutes.', 15)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (127, 15, N'Stir in chicken, chicken broth, lime juice, tomato (seeded and diced), salt and pepper. Gently simmer until chicken is no longer pink, about 10 minutes.', 16)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (128, 15, N'Stir in avocado (peeled, pitted and diced) and chopped cilantro and heat through, 3 to 5 minutes. Adjust seasonings to taste.', 8)
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (129, 15, N'Stir in avocado (peeled, pitted and diced) and chopped cilantro and heat through, 3 to 5 minutes. Adjust seasonings to taste.', 9)
GO
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents], [Available]) VALUES (1, N'Stuffed Mushrooms', 6, 9, N'/Images/1.jpg', N'https://www.allrecipes.com/recipe/278271/air-fryer-stuffed-mushrooms/', N'These low-carb mushrooms are easy to make and cook in under 10 minutes in your air fryer. They make the perfect game-day snack, but also impress as a first course when having friends over for an elegant dinner.', 725, 1)
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents], [Available]) VALUES (2, N'Homemade Flour Tortillas', 24, 1, N'/Images/2.jpeg', N'https://www.allrecipes.com/recipe/157642/homemade-flour-tortillas/', N'Traditional flour tortillas - homemade and much better than store bought. Do not substitute vegetable oil or shortening for the lard.', 220, 1)
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents], [Available]) VALUES (3, N'Chocolate Puddino', 6, 2, N'/Images/3.jpg', N'https://www.allrecipes.com/recipe/283307/chocolate-puddino/', N'Perfect for Valentine''s Day, this rich and delicious chocolate pudding is made with a classic Italian method that they call "budino." The pudding has a glorious texture--firm enough to stay on the spoon and hold its shape, but at the same time, soft, smooth, and silky. It''s a perfect balance between intense chocolate flavor, with just the right amount of sweetness, topped with a soft whipped cream topping that elevates it to a whole new level of amazingness!', 760, 1)
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents], [Available]) VALUES (4, N'The Best Lemon Bars', 36, 2, N'/Images/4.jpeg', N'https://www.allrecipes.com/recipe/10294/the-best-lemon-bars/', N'Tart, rich and perfection, all rolled into one! Wow your friends with this simple recipe. Hint: No Substitutions!', 700, 1)
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents], [Available]) VALUES (5, N'Maple-Pear Tarte Tatin', 8, 4, N'/Images/5.jpeg', N'https://www.allrecipes.com/recipe/245135/maple-pear-tarte-tatin/', N'Pears poached in a maple caramel sauce then baked with a traditional puff pastry crust, a simple yet elegant dessert. Serve warm with vanilla ice cream and enjoy!', NULL, 1)
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents], [Available]) VALUES (6, N'Make-Ahead Freezer Chicken Parmesan', 4, 5, N'/Images/6.jpeg', N'https://www.allrecipes.com/recipe/279629/make-ahead-freezer-chicken-parmesan/', N'My family loves chicken Parm but making it from scratch on a busy school night is next to impossible. The good news is the chicken can be made ahead and frozen along with the right portion of sauce and cheese for a quick weeknight meal. Serve with pasta and Caesar salad.', 870, 1)
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents], [Available]) VALUES (7, N'Broiled Paprika and Lemon-Pepper Chicken Breasts', 2, 5, N'/Images/7.jpeg', N'https://www.allrecipes.com/recipe/279909/broiled-paprika-and-lemon-pepper-chicken-breasts/', N'The great blend of spices on these broiled chicken breasts has a wonderful flavor and pairs well with many vegetable side dishes.', 920, 1)
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents], [Available]) VALUES (8, N'Easy Meatloaf', 8, 5, N'/Images/8.jpeg', N'https://www.allrecipes.com/recipe/16354/easy-meatloaf/', N'This is a very easy and no fail recipe for meatloaf. It won''t take long to make at all, and it''s quite good!', NULL, 1)
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents], [Available]) VALUES (9, N'Scallops Mascarpone', 6, 6, N'/Images/9.jpeg', N'https://www.allrecipes.com/recipe/147305/scallops-mascarpone/', N'A light seafood dishes that pleases the taste buds and the eyes!', NULL, 1)
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents], [Available]) VALUES (10, N'Lighter Chicken Fettuccine Alfredo', 6, 6, N'/Images/10.jpeg', N'https://www.allrecipes.com/recipe/219965/lighter-chicken-fettuccine-alfredo/', N'This version of chicken fettuccine alfredo is lightened by substituting some of the heavy cream with chicken broth.', NULL, 1)
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents], [Available]) VALUES (11, N'Roasted Beet Salad', 4, 7, N'/Images/11.jpeg', N'https://www.allrecipes.com/recipe/270850/roasted-beet-salad/', N'Roasted beets with balsamic vinegar dressing.', 460, 1)
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents], [Available]) VALUES (12, N'All Kale Caesar', 4, 7, N'/Images/12.jpeg', N'https://www.allrecipes.com/recipe/269287/all-kale-caesar/', N'This kale salad recipe is very quick and simple. Pour remaining dressing into a container, cover, and refrigerate up to 2 weeks.', NULL, 1)
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents], [Available]) VALUES (13, N'Easy Bake Fish', 4, 8, N'/Images/13.jpeg', N'https://www.allrecipes.com/recipe/45361/easy-bake-fish/', N'Easy recipe for people who spent so much on the fish they couldn''t buy the sauce!', NULL, 1)
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents], [Available]) VALUES (14, N'Asparagus, Lemon, and Mint Soup', 2, 10, N'/Images/14.jpeg', N'https://www.allrecipes.com/recipe/232665/asparagus-lemon-and-mint-soup/', N'This soup is easy to make. Asparagus has a strong flavor by itself, so I chose to add a few mint leaves and lemon zest to give it a wonderfully fresh aroma!', NULL, 1)
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents], [Available]) VALUES (15, N'Avocado Soup with Chicken and Lime', 4, 10, N'/Images/15.jpg', N'https://www.allrecipes.com/recipe/20809/avocado-soup-with-chicken-and-lime/', N'Thin strips of chicken breast are simmered in broth with jalapenos, onion, garlic and lime and then combined with avocado and topped with crisp corn tortilla strips in this spicy soup.', NULL, 1)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (1, N'Anchovy fillets', 8, 1, 33)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (2, N'Asparagus', 298, 2, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (3, N'Avocado', 48, 1, 4)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (4, N'Baking powder', 2, 3, 24)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (5, N'Balsamic vinegar', 13, 4, 15)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (6, N'Beef', 397, 5, 24)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (7, N'Beet', 40, 1, 5)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (8, N'Bread crumbs', 44, 6, 28)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (9, N'Brown sugar', 1, 4, 12)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (10, N'Butter', 12, 4, 18)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (11, N'Button mushrooms', 16, 7, 28)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (12, N'Cayenne pepper', 2, 8, 24)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (13, N'Cheddar cheese', 33, 7, 14)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (14, N'Chicken breast', 324, 5, 24)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (15, N'Chicken stock', 56, 6, 27)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (16, N'Corn tortillas', 6, 1, 8)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (17, N'Cream cheese', 20, 7, 12)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (18, N'Crouton', 12, 6, 13)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (19, N'Cucumber', 70, 1, 20)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (20, N'Dark chocolate', 17, 4, 22)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (21, N'Dark chocolate chips', 25, 7, 10)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (22, N'Dijon mustard', 3, 3, 1)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (23, N'Egg', 10, 1, 8)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (24, N'Egg yolk', 10, 1, 17)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (25, N'Fettuccine', 34, 5, 2)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (26, N'Flour', 25, 6, 25)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (27, N'Fresh cilantro', 1584, 6, 30)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (28, N'Fresh mint', 99, 4, 15)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (29, N'Garlic', 42, 9, 14)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (30, N'Garlic powder', 8, 3, 1)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (31, N'Ground cinnamon', 7, 3, 25)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (32, N'Ground nutmeg', 4, 8, 23)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (33, N'Heavy cream', 72, 6, 19)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (34, N'Honey', 14, 4, 16)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (35, N'Italian seasoning', 19, 3, 19)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (36, N'Jalapeno peppers', 5, 1, 2)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (37, N'Kale leaves', 72, 6, 2)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (38, N'Ketchup', 64, 6, 8)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (39, N'Lard', 4, 3, 17)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (40, N'Lemon', 48, 1, 10)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (41, N'Lemon juice', 104, 6, 18)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (42, N'Lemon zest', 11, 3, 25)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (43, N'Lemon-pepper seasoning', 11, 4, 26)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (44, N'Lime juice', 128, 6, 14)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (45, N'Maple syrup', 3, 4, 23)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (46, N'Mascarpone cheese', 50, 7, 18)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (47, N'Mozzarella cheese', 96, 6, 17)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (48, N'Olive oil', 13, 4, 23)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (49, N'Onion', 78, 1, 21)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (50, N'Onion powder', 9, 3, 11)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (51, N'Paprika', 18, 3, 7)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (52, N'Parmesan cheese', 12, 4, 29)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (53, N'Parmigiano-Reggiano cheese', 24, 6, 9)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (54, N'Parsley', 3, 4, 20)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (55, N'Pear', 71, 1, 11)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (56, N'Pepper', 1, 8, 29)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (57, N'Prepared mustard', 9, 4, 12)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (58, N'Puff pastry', 33, 7, 23)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (59, N'Salmon steak', 298, 1, 14)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (60, N'Salt', 1, 3, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (61, N'Scallion', 10, 1, 27)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (62, N'Scallop', 1498, 5, 6)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (63, N'Seashell pasta', 8, 7, 14)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (64, N'Shallot', 70, 1, 30)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (65, N'Tomato', 50, 1, 24)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (66, N'Tomato sauce', 6, 7, 4)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (67, N'Vanilla extract', 28, 3, 24)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (68, N'Water', 1, 6, 18)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (69, N'White sugar', 13, 6, 10)
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (70, N'Whole milk', 16, 6, 4)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (1, 11, CAST(16.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (2, 61, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (3, 17, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (4, 13, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (5, 51, CAST(0.25 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (6, 60, CAST(0.20 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (7, 60, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (8, 26, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (9, 4, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (10, 39, CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (11, 68, CAST(1.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (12, 60, CAST(0.20 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (13, 21, CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (14, 12, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (15, 23, CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (16, 69, CAST(0.30 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (17, 70, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (18, 33, CAST(1.25 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (19, 67, CAST(0.25 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (20, 10, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (21, 33, CAST(0.25 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (22, 67, CAST(0.10 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (23, 20, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (24, 26, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (25, 69, CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (26, 10, CAST(16.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (27, 26, CAST(0.25 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (28, 23, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (29, 69, CAST(1.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (30, 40, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (31, 58, CAST(17.30 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (32, 10, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (33, 9, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (34, 31, CAST(0.25 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (35, 32, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (36, 45, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (37, 55, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (38, 14, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (39, 23, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (40, 8, CAST(0.33 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (41, 52, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (42, 35, CAST(0.75 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (43, 30, CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (44, 66, CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (45, 47, CAST(0.75 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (46, 48, CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (47, 51, CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (48, 60, CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (49, 14, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (50, 48, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (51, 43, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (52, 29, CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (53, 49, CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (54, 23, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (55, 70, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (56, 8, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (57, 49, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (58, 6, CAST(1.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (59, 60, CAST(0.10 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (60, 56, CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (61, 9, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (62, 57, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (63, 38, CAST(0.33 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (64, 63, CAST(16.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (65, 10, CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (66, 48, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (67, 29, CAST(0.20 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (68, 54, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (69, 11, CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (70, 60, CAST(0.10 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (71, 56, CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (72, 2, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (73, 50, CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (74, 62, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (75, 70, CAST(0.25 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (76, 10, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (77, 46, CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (78, 14, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (79, 15, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (80, 33, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (81, 29, CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (82, 56, CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (83, 23, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (84, 60, CAST(0.10 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (85, 25, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (86, 54, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (87, 53, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (88, 7, CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (89, 60, CAST(0.10 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (90, 45, CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (91, 56, CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (92, 5, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (93, 29, CAST(0.30 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (94, 41, CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (95, 1, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (96, 22, CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (97, 60, CAST(0.25 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (98, 48, CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (99, 56, CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (100, 37, CAST(6.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (101, 52, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (102, 18, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (103, 22, CAST(9.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (104, 34, CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (105, 42, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (106, 59, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (107, 56, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (108, 2, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (109, 48, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (110, 64, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (111, 60, CAST(0.25 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (112, 56, CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (113, 28, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (114, 15, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (115, 42, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (116, 23, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (117, 16, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (118, 48, CAST(1.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (119, 29, CAST(1.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (120, 49, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (121, 36, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (122, 14, CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (123, 60, CAST(0.25 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (124, 56, CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (125, 15, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (126, 44, CAST(0.25 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (127, 65, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (128, 3, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (129, 27, CAST(0.25 AS Decimal(18, 2)))
GO
INSERT [dbo].[Unit] ([Id], [Name], [ShortName]) VALUES (1, N'piece', N'pcs')
INSERT [dbo].[Unit] ([Id], [Name], [ShortName]) VALUES (2, N'bunch', N'bunch')
INSERT [dbo].[Unit] ([Id], [Name], [ShortName]) VALUES (3, N'teaspoon', N'teaspoon')
INSERT [dbo].[Unit] ([Id], [Name], [ShortName]) VALUES (4, N'tablespoon', N'tablespoon')
INSERT [dbo].[Unit] ([Id], [Name], [ShortName]) VALUES (5, N'pound (lb)', N'pound (lb)')
INSERT [dbo].[Unit] ([Id], [Name], [ShortName]) VALUES (6, N'cup', N'cup')
INSERT [dbo].[Unit] ([Id], [Name], [ShortName]) VALUES (7, N'ounce (oz)', N'ounce (oz)')
INSERT [dbo].[Unit] ([Id], [Name], [ShortName]) VALUES (8, N'pinch', N'pinch')
INSERT [dbo].[Unit] ([Id], [Name], [ShortName]) VALUES (9, N'bulb', N'bulb')
GO
ALTER TABLE [dbo].[CookingStage]  WITH CHECK ADD  CONSTRAINT [FK_CookingStage_Dish] FOREIGN KEY([DishId])
REFERENCES [dbo].[Dish] ([Id])
GO
ALTER TABLE [dbo].[CookingStage] CHECK CONSTRAINT [FK_CookingStage_Dish]
GO
ALTER TABLE [dbo].[Dish]  WITH CHECK ADD  CONSTRAINT [FK_Dish_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Dish] CHECK CONSTRAINT [FK_Dish_Category]
GO
ALTER TABLE [dbo].[Ingredient]  WITH CHECK ADD  CONSTRAINT [FK_Ingredient_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[Ingredient] CHECK CONSTRAINT [FK_Ingredient_Unit]
GO
ALTER TABLE [dbo].[IngredientOfStage]  WITH CHECK ADD  CONSTRAINT [FK_IngredientOfStage_CookingStage] FOREIGN KEY([CookingStageId])
REFERENCES [dbo].[CookingStage] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IngredientOfStage] CHECK CONSTRAINT [FK_IngredientOfStage_CookingStage]
GO
ALTER TABLE [dbo].[IngredientOfStage]  WITH CHECK ADD  CONSTRAINT [FK_IngredientOfStage_Ingredient] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[Ingredient] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IngredientOfStage] CHECK CONSTRAINT [FK_IngredientOfStage_Ingredient]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Client]
GO
ALTER TABLE [dbo].[OrderedDish]  WITH CHECK ADD  CONSTRAINT [FK_OrderedDish_Dish] FOREIGN KEY([DishId])
REFERENCES [dbo].[Dish] ([Id])
GO
ALTER TABLE [dbo].[OrderedDish] CHECK CONSTRAINT [FK_OrderedDish_Dish]
GO
ALTER TABLE [dbo].[OrderedDish]  WITH CHECK ADD  CONSTRAINT [FK_OrderedDish_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderedDish] CHECK CONSTRAINT [FK_OrderedDish_Order]
GO
