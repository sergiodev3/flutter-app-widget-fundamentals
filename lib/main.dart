import 'package:flutter/material.dart';

// ═══════════════════════════════════════════════════════════════════════════
// PUNTO DE ENTRADA DE LA APLICACIÓN
// ═══════════════════════════════════════════════════════════════════════════
//
// main() es la función que se ejecuta cuando inicias la app.
// runApp() es la función de Flutter que INICIA el framework.
//
// runApp(Widget):
//   • Toma un Widget como argumento
//   • Lo convierte en la RAÍZ del árbol de widgets
//   • Fuerza ese widget a cubrir toda la pantalla
//   • Es el punto donde Flutter "monta" tu interfaz
//
void main() {
  runApp(const MiAppFlutter());
}

// ═══════════════════════════════════════════════════════════════════════════
// MATERIAL APP - El envoltorio principal
// ═══════════════════════════════════════════════════════════════════════════
//
// MaterialApp (o CupertinoApp para iOS) es el widget raíz típico.
// Proporciona:
//   • Enrutamiento (navegación entre pantallas)
//   • Temas (colores, tipografía)
//   • Accesibilidad
//   • Configuración global de la app
//
// ÁRBOL DE WIDGETS hasta aquí:
//   runApp()
//     └── MaterialApp
//           └── home: MiPaginaInicio  ← La primera vista
//
class MiAppFlutter extends StatelessWidget {
  const MiAppFlutter({super.key});

  @override //modificar el método build para construir la interfaz
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fundamentos Flutter - Todo es un Widget',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // home: La primera vista que verá el usuario al abrir la app
      home: const MiPaginaInicio(),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// PÁGINA DE INICIO - Home Widget
// ═══════════════════════════════════════════════════════════════════════════
//
// Esta es la primera vista de la aplicación.
// Aquí demostramos la FILOSOFÍA "TODO ES UN WIDGET" mediante
// COMPOSICIÓN ESTRUCTURAL: apilamos widgets pequeños para crear
// elementos más complejos.
//
class MiPaginaInicio extends StatelessWidget {
  const MiPaginaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold: estructura básica de una pantalla (AppBar, body, etc.)
      appBar: AppBar(
        title: const Text('Fundamentos Flutter'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _construirSeccionConcepto(context),
            const SizedBox(height: 32),
            _construirSeccionBotonComposicion(context),
            const SizedBox(height: 32),
            _construirSeccionArbolWidgets(context),
          ],
        ),
      ),
    );
  }

  /// Explica el concepto "Todo es un Widget"
  Widget _construirSeccionConcepto(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'La Filosofía "Todo es un Widget"',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'En Flutter, los elementos estructurales (alineación), estéticos '
              '(color, bordes) e interactivos (clics) son capas independientes '
              'de widgets que se componen entre sí.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  /// Demuestra la COMPOSICIÓN ESTRUCTURAL: un botón construido capa por capa
  /// como en el diagrama: Padding → Container → GestureDetector → Text
  Widget _construirSeccionBotonComposicion(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Composición Estructural - Ejemplo práctico',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Este botón está construido apilando 4 widgets. Toca para ver el mensaje:',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 16),
        // ═══════════════════════════════════════════════════════════════
        // COMPOSICIÓN: De afuera hacia adentro (como capas de una cebolla)
        // ═══════════════════════════════════════════════════════════════
        _BotonComposicion(),
      ],
    );
  }

  /// Muestra visualmente la estructura del árbol de widgets
  Widget _construirSeccionArbolWidgets(BuildContext context) {
    return Card(
      color: Colors.blue.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Árbol de Widgets (simplificado)',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _WidgetArbolTexto(
              'runApp()',
              nivel: 0,
              descripcion: 'Punto de entrada - raíz del árbol',
            ),
            _WidgetArbolTexto('└── MaterialApp', nivel: 1),
            _WidgetArbolTexto('    └── Scaffold', nivel: 2),
            _WidgetArbolTexto('        ├── AppBar', nivel: 3),
            _WidgetArbolTexto('        └── body: Column', nivel: 3),
            _WidgetArbolTexto('            └── _BotonComposicion', nivel: 4),
            _WidgetArbolTexto(
              '                └── Padding → Container → GestureDetector → Text',
              nivel: 5,
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget auxiliar para mostrar el árbol con indentación
class _WidgetArbolTexto extends StatelessWidget {
  const _WidgetArbolTexto(this.texto, {required this.nivel, this.descripcion});

  final String texto;
  final int nivel;
  final String? descripcion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0 * nivel, top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            texto,
            style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
          ),
          if (descripcion != null)
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 2),
              child: Text(
                descripcion!,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey.shade700,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// BOTÓN POR COMPOSICIÓN - Demostración práctica
// ═══════════════════════════════════════════════════════════════════════════
//
// Este botón NO usa ElevatedButton. Está construido manualmente
// apilando widgets para ilustrar la COMPOSICIÓN ESTRUCTURAL:
//
//   Capa 1: Padding     → Espaciado estructural (márgenes)
//   Capa 2: Container  → Estética (color, bordes, sombras)
//   Capa 3: GestureDetector → Interactividad (captura toques)
//   Capa 4: Text       → Contenido (tipografía)
//
// Cada capa es un WIDGET independiente. ¡Todo es un widget!
//
class _BotonComposicion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      // CAPA 1: PADDING - Widget de espaciado estructural
      // Proporciona espacio alrededor de su hijo (márgenes)
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Container(
        // CAPA 2: CONTAINER - Widget estético
        // Maneja color de fondo, bordes redondeados, sombras
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: GestureDetector(
          // CAPA 3: GESTUREDETECTOR - Widget interactivo (invisible)
          // No tiene apariencia propia; detecta toques y gestos
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  '¡Composición en acción! Cada capa (Padding, Container, '
                  'GestureDetector, Text) es un widget independiente.',
                ),
                duration: Duration(seconds: 3),
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Text(
              // CAPA 4: TEXT - Widget de contenido
              // Muestra texto con tipografía y estilo
              'Submit',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
