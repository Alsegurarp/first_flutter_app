import 'package:flutter_app_1/models/quiz_question.dart';

// Respuestas: 1) B, 2) A, 3) C, 4) B, 5) C.

const questions = [
  QuizQuestion(
    'Soy verde y espinosito, en la penca me verás; en taco o en ensalada, a muchos les gustará.',
    ['Chayote', 'Nopal', 'Lechuga', 'Tomatillo']
  ),
  QuizQuestion(
    'No es pez ni es ajolote, pero en los lagos viví; con traje de chinampa y flor, Xochimilco me vio aquí.',
    ['Trajinera', 'Garza', 'Tlacuache', 'Quetzal']
  ),
  QuizQuestion(
    'Blanca por dentro, verde por fuera. Si quieres que te lo diga, espera.',
    ['Pera', 'Manzana', 'Nopal', 'Guayaba']
  ),
  QuizQuestion('Oro parece, plata no es. Quien no lo adivine, bien tonto es.', [
    'Aguacate',
    'Plátano',
    'Mango',
    'Piña',
  ]),
  QuizQuestion(
    'En el mar no me mojo, en el monte no me quemo; y aunque tengo caparazón, no soy ni tortuga ni caracol.',
    ['Cangrejo', 'Tiburón', 'Cangrejo', 'Pulpo']
  ),
];
