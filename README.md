# Flutter Widget Fundamentals

Aplicacion de ejemplo construida con Flutter para explicar, de forma visual y practica, la filosofia central del framework: **todo es un widget**.

Este repositorio esta pensado como material de aprendizaje para entender composicion de widgets, estructura de una pantalla y jerarquia del arbol de UI.

## Objetivo Del Proyecto

Mostrar como Flutter construye interfaces mediante composicion de piezas pequenas:

- Widgets estructurales (layout y espaciado)
- Widgets visuales (estilos, color, bordes)
- Widgets interactivos (gestos y eventos)

La app incluye una demostracion en pantalla de un boton construido por capas con:
`Padding -> Container -> GestureDetector -> Text`

## Contenido De La App

La pantalla principal incluye:

- Explicacion conceptual de "Todo es un Widget"
- Ejemplo practico de composicion estructural
- Visualizacion simplificada del arbol de widgets
- Feedback interactivo con `SnackBar` al tocar el boton de ejemplo

## Stack Tecnologico

- Flutter
- Dart
- Material 3 (`useMaterial3: true`)

## Estructura Principal

```text
lib/
	main.dart         # Punto de entrada y widgets principales
test/
	widget_test.dart  # Prueba base generada por Flutter
```

## Requisitos

- Flutter SDK instalado
- Dart SDK (incluido con Flutter)
- Un dispositivo o emulador (Android, iOS, Windows, Linux, macOS o Web)

Verifica tu entorno:

```bash
flutter doctor
```

## Como Ejecutar

1. Clona el repositorio:

```bash
git clone https://github.com/sergiodev3/flutter-app-widget-fundamentals.git
cd flutter-app-widget-fundamentals
```

2. Instala dependencias:

```bash
flutter pub get
```

3. Ejecuta la app:

```bash
flutter run
```

Para web:

```bash
flutter run -d chrome
```

## Comandos Utiles

```bash
# Analisis estatico
flutter analyze

# Tests
flutter test
```

## Enfoque Didactico

Este proyecto prioriza legibilidad y explicacion de conceptos sobre complejidad funcional. El codigo en `lib/main.dart` contiene comentarios pedagogicos para apoyar el aprendizaje paso a paso.

## Posibles Mejoras

- Agregar navegacion entre multiples pantallas
- Incorporar manejo de estado (Provider, Riverpod o Bloc)
- Separar widgets en archivos modulares por feature
- Incluir pruebas de widget mas completas

## Licencia

Este repositorio se distribuye con fines educativos.
