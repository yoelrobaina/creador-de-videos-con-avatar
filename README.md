# Creador de Videos con Avatar

Web estática para crear videos con un avatar PNGTuber:

1. Sube tu foto de boca cerrada y tu foto de boca abierta.
2. Elige una voz, pega el texto que quieres que diga.
3. Genera el audio y el video con el personaje hablando.
4. Descarga el video sin perder resolución (tamaño original de tu foto, o vertical 1080×1920 para Reels/TikTok).

## Uso

Abre `index.html` en el navegador, o despliega la carpeta en Vercel como sitio estático.

No necesita servidor. Las voces IA se generan en el navegador o subiendo un audio MP3 generado aparte.

## Estructura

- `index.html` — toda la app (HTML + CSS + JS)
- `assets/ejemplo-cerrada.jpg` — ejemplo boca cerrada
- `assets/ejemplo-abierta.jpg` — ejemplo boca abierta
- `supabase/schema.sql` — tabla `voices` para guardar las voces en Supabase

## Voces en Supabase

Ver `supabase/schema.sql`. Tabla `voices`:

- `id` uuid, clave primaria
- `name` texto, nombre de la voz
- `voice_id` texto, identificador del proveedor
- `provider` texto, p. ej. `microsoft`, `device`, `muse`
- `language` texto, p. ej. `es-MX`, `es-ES`
- `accent` texto, p. ej. `México`, `España`
- `gender` texto, `M` / `F`
- `is_active` boolean
- `created_at` timestamptz
