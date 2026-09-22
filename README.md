# Invesment Jurnal Vano V5

V5 menambahkan login Supabase dan sinkronisasi dua arah HP ↔ laptop.

## 1. Supabase
Buka SQL Editor lalu jalankan SELURUH isi `supabase-schema.sql`.

Auth > Providers > Email harus Enabled.

## 2. GitHub
Ganti file `index.html`, `manifest.json`, dan `sw.js` di repository dengan file V5 ini.
Ganti juga `supabase-schema.sql` bila ingin menyimpan schema terbaru.

## 3. Login
Di HP:
- buka GitHub Pages
- daftar/login dengan email dan password yang sama
- setelah login tekan `Sync sekarang`

Di laptop:
- buka URL GitHub Pages yang sama
- login dengan akun yang sama
- tekan `Sync sekarang`

Transaksi dari cloud akan muncul di kedua perangkat.

## Catatan keamanan
`sb_publishable_...` boleh digunakan di browser. Jangan pernah memasukkan secret/service_role key ke `index.html`, GitHub, atau chat.

## Catatan notifikasi
V5 mempertahankan notifikasi browser saat halaman aktif. Push background yang benar-benar berjalan ketika halaman ditutup membutuhkan Web Push/VAPID + backend scheduler; itu tahap terpisah.
