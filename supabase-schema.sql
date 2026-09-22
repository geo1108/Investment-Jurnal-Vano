-- Supabase schema for Invesment Jurnal Vano V4
create table if not exists public.btc_transactions (
  id uuid primary key,
  user_id uuid references auth.users(id) on delete cascade,
  date date not null,
  idr numeric not null,
  modal_usd numeric not null,
  usd numeric not null,
  btc numeric not null,
  fx numeric not null,
  fx_source_date date,
  fee numeric not null,
  note text,
  created_at timestamptz not null default now()
);

alter table public.btc_transactions enable row level security;

create policy "Users can read own BTC transactions"
on public.btc_transactions for select
using (auth.uid() = user_id);

create policy "Users can insert own BTC transactions"
on public.btc_transactions for insert
with check (auth.uid() = user_id);

create policy "Users can update own BTC transactions"
on public.btc_transactions for update
using (auth.uid() = user_id);

create policy "Users can delete own BTC transactions"
on public.btc_transactions for delete
using (auth.uid() = user_id);

create table if not exists public.btc_push_subscriptions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade,
  endpoint text not null,
  p256dh text not null,
  auth text not null,
  created_at timestamptz not null default now(),
  unique(user_id, endpoint)
);

alter table public.btc_push_subscriptions enable row level security;
create policy "Users manage own push subscriptions"
on public.btc_push_subscriptions for all
using (auth.uid() = user_id)
with check (auth.uid() = user_id);
