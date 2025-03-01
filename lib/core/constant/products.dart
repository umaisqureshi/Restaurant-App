import 'package:eat_like_app/core/enum/enums.dart';
import 'package:eat_like_app/domain/entities/product_entity.dart';

List<ProductEntity> products = [
  ProductEntity(
    name: 'Cheese Burger',
    price: 5.99,
    type: ProductType.burger,
    isTopRated: true,
        rating: 4.5,
    description:
        'Cheese Burger with beef patty, cheese, lettuce, tomato, and mayo',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/800px-Pizza-3007395.jpg',
  ),
  ProductEntity(
    name: 'Pizza',
    price: 7.99,
    isTopRated: false,
        rating: 4.5,
    type: ProductType.pizza,
    description: 'Pizza with tomato sauce, cheese, and pepperoni',
     imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/800px-Pizza-3007395.jpg',
  ),
  ProductEntity(
    name: 'Coke',
    price: 1.99,
    isTopRated: false,
        rating: 4.5,
    type: ProductType.drink,
    description: 'Coke with ice',
      imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/800px-Pizza-3007395.jpg',
  ),
  ProductEntity(
    name: 'Pepsi',
    price: 1.99,
        rating: 4.5,
    isTopRated: true,
    type: ProductType.drink,
    description: 'Pepsi with ice',
   imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/800px-Pizza-3007395.jpg',
  ),
  ProductEntity(
    name: 'Italian Pasta',
    price: 2.99,
    type: ProductType.pasta,
    isTopRated: false,
    rating: 4.5,
    description: 'Italian Pasta with tomato sauce and cheese',
   imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/800px-Pizza-3007395.jpg',
  ),
  ProductEntity(
    name: 'BBQ Chicken',
    price: 3.99,
    type: ProductType.burger,
    isTopRated: false,
        rating: 4.5,
    description: 'BBQ Chicken with lettuce, tomato, and mayo',
   imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/800px-Pizza-3007395.jpg',
  ),
  ProductEntity(
    name: 'Water',
    price: 0.99,
    isTopRated: true,
        rating: 4.5,
    type: ProductType.drink,
    description: 'Water with ice',
   imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/800px-Pizza-3007395.jpg',
  ),
  ProductEntity(
    name: 'King Pizza',
    price: 9.99,
    type: ProductType.pizza,
    isTopRated: false,
        rating: 4.5,
    description: 'King Pizza with tomato sauce, cheese, and pepperoni',
   imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/800px-Pizza-3007395.jpg',
  ),
  ProductEntity(
    name: 'Coffee',
    price: 2.99,
    type: ProductType.drink,
    isTopRated: false,
        rating: 4.5,
    description: 'Coffee with milk',
   imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/800px-Pizza-3007395.jpg',
  ),
  ProductEntity(
    name: 'Spaghetti',
    price: 3.99,
    type: ProductType.pasta,
    isTopRated: true,
        rating: 4.5,
    description: 'Spaghetti with tomato sauce and cheese',
   imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/800px-Pizza-3007395.jpg',
  ),
];
