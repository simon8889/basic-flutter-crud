# Gestión de Personas - Flutter CRUD App

Aplicación Flutter completa para gestión de datos personales usando SQLite.

## Características

- **CRUD Completo**: Crear, Leer, Actualizar y Eliminar registros de personas
- **Base de datos local**: SQLite para almacenamiento persistente
- **Interfaz en español**: Todo el código y la UI están en español
- **Diseño moderno**: Material Design 3 con interfaz limpia y elegante
- **Navegación intuitiva**: Menú principal para acceder a todas las funcionalidades

## Estructura del Proyecto

```
lib/
├── main.dart                           # Punto de entrada de la aplicación
├── database/
│   └── database_helper.dart           # Configuración de SQLite
├── models/
│   └── persona.dart                   # Modelo de datos Persona
├── repositories/
│   └── persona_repository.dart        # Operaciones CRUD
└── screens/
    ├── menu_principal_screen.dart     # Menú principal
    ├── crear_persona_screen.dart      # Crear persona
    ├── listar_personas_screen.dart    # Ver lista y eliminar
    └── editar_persona_screen.dart     # Editar persona
```

## Campos de Persona

Cada registro incluye:
- **Nombre** (String)
- **Apellido** (String)
- **Teléfono** (String)
- **Edad** (Integer)
- **Email** (String)

## Funcionalidades

### Menú Principal
- Pantalla de bienvenida con diseño gradient
- Botones para crear y listar personas

### Crear Persona
- Formulario con validaciones
- Campos obligatorios
- Validación de email y edad

### Ver Personas
- Lista completa de registros
- Tarjetas con información detallada
- Botones para editar y eliminar
- Confirmación antes de eliminar
- Botón de actualizar lista

### Editar Persona
- Formulario prellenado con datos actuales
- Mismas validaciones que crear
- Actualización en tiempo real

## Dependencias

```yaml
dependencies:
  flutter:
    sdk: flutter
  sqflite: ^2.3.0
  path: ^1.8.3
  path_provider: ^2.1.1
```

## Instalación y Ejecución

1. Clonar el repositorio
2. Instalar dependencias:
   ```bash
   flutter pub get
   ```
3. Ejecutar la aplicación:
   ```bash
   flutter run
   ```

## Características Técnicas

- **Arquitectura limpia**: Separación clara entre capas
- **Singleton pattern**: Para la gestión de la base de datos
- **Validaciones**: Formularios con validación completa
- **Gestión de estado**: StatefulWidgets con setState
- **Diseño responsivo**: Interfaz adaptable
- **Material Design 3**: Componentes modernos

## Base de Datos

La base de datos SQLite se crea automáticamente al iniciar la aplicación.

Esquema de tabla `personas`:
```sql
CREATE TABLE personas (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre TEXT NOT NULL,
  apellido TEXT NOT NULL,
  telefono TEXT NOT NULL,
  edad INTEGER NOT NULL,
  email TEXT NOT NULL
)
```

## Capturas de Funcionalidades

- Menú principal con diseño gradient azul
- Crear persona con formulario validado
- Lista de personas con tarjetas elegantes
- Editar persona con datos precargados
- Diálogos de confirmación para eliminar
- Mensajes de éxito y error con SnackBar

## Código Limpio

- Sin comentarios innecesarios
- Nombres descriptivos en español
- Estructura modular y mantenible
- Principios SOLID aplicados

