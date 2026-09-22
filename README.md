# Invesment Jurnal Vano V4

## Yang sudah ada
- PWA-ready: `manifest.json` + `sw.js`
- Portfolio BTC real-time dari Bitget
- Jurnal transaksi dan perhitungan P/L
- Alert P/L terhadap modal USD: -15%, -10%, +10%, +15%, +30%, +50%, +100%, +200%
- Custom price levels
- Notification API saat browser/app dapat menjalankan JavaScript
- Fondasi push notification melalui service worker
- Fondasi Supabase cloud sync
- Schema database: `supabase-schema.sql`

## Penting tentang notifikasi saat aplikasi benar-benar tertutup
Browser tidak menjamin JavaScript halaman berjalan terus ketika PWA ditutup. Untuk notifikasi background yang benar-benar berjalan saat HP tidak membuka jurnal, perlu:
1. Supabase Auth
2. tabel push subscription
3. VAPID key
4. backend/Edge Function terjadwal yang mengambil harga BTC dan mengirim Web Push
5. scheduler/cron

V4 ini sengaja tidak menanam secret/VAPID key ke frontend.

## Cara memakai sekarang
1. Host folder ini pada HTTPS (GitHub Pages, Vercel, Netlify, atau hosting lain).
2. Buka dari Chrome Android.
3. Pilih Add to Home Screen.
4. Tekan Aktifkan notifikasi.
5. Untuk cloud sync, buat project Supabase, jalankan `supabase-schema.sql`, lalu masukkan Project URL + anon key pada Pengaturan.

## Catatan keamanan
Jangan memasukkan Supabase service-role key ke file HTML. Frontend hanya boleh menggunakan anon/publishable key dengan RLS aktif.
