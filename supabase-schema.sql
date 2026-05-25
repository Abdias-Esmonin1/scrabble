create table if not exists public.scrabble_rooms (
  code text primary key,
  game jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.scrabble_rooms enable row level security;

drop policy if exists "scrabble_rooms_select" on public.scrabble_rooms;
drop policy if exists "scrabble_rooms_insert" on public.scrabble_rooms;
drop policy if exists "scrabble_rooms_update" on public.scrabble_rooms;
drop policy if exists "scrabble_rooms_delete" on public.scrabble_rooms;

create policy "scrabble_rooms_select"
on public.scrabble_rooms for select
using (true);

create policy "scrabble_rooms_insert"
on public.scrabble_rooms for insert
with check (true);

create policy "scrabble_rooms_update"
on public.scrabble_rooms for update
using (true)
with check (true);

create policy "scrabble_rooms_delete"
on public.scrabble_rooms for delete
using (true);

alter publication supabase_realtime add table public.scrabble_rooms;
