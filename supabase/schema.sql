-- Tabla de voces para el Creador de Videos con Avatar
-- Ejecutar en el SQL Editor de Supabase

create table if not exists public.voices (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  voice_id text not null unique,
  provider text not null default 'microsoft',
  language text not null default 'es-MX',
  accent text,
  gender text check (gender in ('M', 'F')),
  description text,
  is_active boolean not null default true,
  created_at timestamptz not null default now()
);

alter table public.voices enable row level security;

-- Lectura pública para la web (las voces son un catálogo)
-- Ajustar según se quiera restringir la escritura a usuarios autenticados
create policy "Voces legibles por todos"
  on public.voices for select
  using (true);

create policy "Voces editables por servicio"
  on public.voices for all
  using (true)
  with check (true);

-- Voces iniciales en español (las 14 de la web, iguales a CLOUD_VOICES en index.html)
insert into public.voices (name, voice_id, provider, language, accent, gender) values
  ('Dalia', 'es-MX-DaliaNeural', 'microsoft', 'es-MX', 'México', 'F'),
  ('Jorge', 'es-MX-JorgeNeural', 'microsoft', 'es-MX', 'México', 'M'),
  ('Elvira', 'es-ES-ElviraNeural', 'microsoft', 'es-ES', 'España', 'F'),
  ('Álvaro', 'es-ES-AlvaroNeural', 'microsoft', 'es-ES', 'España', 'M'),
  ('Salomé', 'es-CO-SalomeNeural', 'microsoft', 'es-CO', 'Colombia', 'F'),
  ('Gonzalo', 'es-CO-GonzaloNeural', 'microsoft', 'es-CO', 'Colombia', 'M'),
  ('Elena', 'es-AR-ElenaNeural', 'microsoft', 'es-AR', 'Argentina', 'F'),
  ('Tomás', 'es-AR-TomasNeural', 'microsoft', 'es-AR', 'Argentina', 'M'),
  ('Catalina', 'es-CL-CatalinaNeural', 'microsoft', 'es-CL', 'Chile', 'F'),
  ('Lorenzo', 'es-CL-LorenzoNeural', 'microsoft', 'es-CL', 'Chile', 'M'),
  ('Camila', 'es-PE-CamilaNeural', 'microsoft', 'es-PE', 'Perú', 'F'),
  ('Paola', 'es-VE-PaolaNeural', 'microsoft', 'es-VE', 'Venezuela', 'F'),
  ('Alonso', 'es-US-AlonsoNeural', 'microsoft', 'es-US', 'Estados Unidos', 'M'),
  ('Paloma', 'es-US-PalomaNeural', 'microsoft', 'es-US', 'Estados Unidos', 'F')
on conflict (voice_id) do nothing;
