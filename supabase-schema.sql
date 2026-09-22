-- Jalankan seluruh SQL ini di Supabase > SQL Editor.
-- Aman untuk aplikasi browser karena akses dibatasi RLS berdasarkan auth.uid().

create table if not exists public.btc_transactions (
  id uuid primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  date date not null,
  idr numeric not null,
  modal_usd numeric not null,
  usd numeric not null,
  btc numeric not null,
  fx numeric not null,
  fx_source_date date,
  fee numeric not null,
  note text default '',
  created_at timestamptz not null default now()
);

alter table public.btc_transactions enable row level security;

drop policy if exists "Users can view own transactions" on public.btc_transactions;
create policy "Users can view own transactions"
on public.btc_transactions for select
to authenticated
using (auth.uid() = user_id);

drop policy if exists "Users can insert own transactions" on public.btc_transactions;
create policy "Users can insert own transactions"
on public.btc_transactions for insert
to authenticated
with check (auth.uid() = user_id);

drop policy if exists "Users can update own transactions" on public.btc_transactions;
create policy "Users can update own transactions"
on public.btc_transactions for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

drop policy if exists "Users can delete own transactions" on public.btc_transactions;
create policy "Users can delete own transactions"
on public.btc_transactions for delete
to authenticated
using (auth.uid() = user_id);

create index if not exists btc_transactions_user_date_idx
on public.btc_transactions(user_id, date);
