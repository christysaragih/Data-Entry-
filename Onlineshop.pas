program BluberisOnlineShop;
uses crt;
const
    HargaHairClip = 11000;
    HargaHeadBand = 18000;
    HargaScrunchies = 7000;
    HargaScarfHairTies = 4000;
    HargaHairComb = 15000;
    HargaEarring = 5000;
    HargaBracelet = 20000;
    HargaNecklace = 25000;
    HargaRing = 15000;
    HargaPendant = 18000;

    HargaBodyWash = 25000;
    HargaBodyScrub = 31000;
    HargaBodyLotion = 28000;
    HargaBodyMist = 35000;
    HargaBodyPeeling = 40000;
    HargaSunscreen = 26000;
    HargaMoisturizer = 30000;
    HargaSerumVitC = 27000;
    HargaRetinol = 34000;
    HargaPeelingSolution = 38000;

    MedanJohor = 8000;
    MedanAmplas = 10000;
    MedanArea = 12000;
    MedanKota = 5000;
    MedanBaru = 9000;
    MedanSelayang = 7000;
    MedanBelawan = 15000;
    MedanSunggal = 11000;

type pesanan = record 
    KodeProduk : char;
    NamaProduk : string;
    Harga : longint;
    Jumlah : integer;
end;

var
  Nama, Alamat, Kec, MetodePembayaran: string;
  PilihanPembayaran, i, j, PilihanKecamatan, PilihanKategori: integer;
  JumlahProduk, JumlahJenis, TotalPembayaran, TotalPembayaran2, OngkosKirim: longint;
  LanjutPesan : char;
  data : array [1..10] of pesanan;

procedure Welcome;
begin
    clrscr;
    writeln('-----------------------------------');
    writeln('| Selamat Datang di Toko Bluberi! |');
    writeln('| Ingin Belanja Apa Hari Ini?     |');
    writeln('| Menu :                          |');
    writeln('|  1. Aksesoris                   |');
    writeln('|  2. Skin and Body Care          |');
    writeln('-----------------------------------');
    writeln;
    write('Pilih Menu (1/2) : ');
    readln(PilihanKategori);
end;

procedure TampilkanProduk(PilihanKategori : integer);
begin
    if PilihanKategori = 1 then
    begin
        writeln('-------- Produk Aksesoris --------');
        writeln('A. Hair Clip            : Rp', HargaHairClip);
        writeln('B. HeadBand             : Rp', HargaHeadBand);
        writeln('C. Scrunchies           : Rp', HargaScrunchies);
        writeln('D. Scarf Hair Ties      : Rp', HargaScarfHairTies);
        writeln('E. Hair Comb            : Rp', HargaHairComb);
        writeln('F. Earring              : Rp', HargaEarring);
        writeln('G. Bracelet             : Rp', HargaBracelet);
        writeln('H. Necklace             : Rp', HargaNecklace);
        writeln('I. Ring                 : Rp', HargaRing);
        writeln('J. Pendant              : Rp', HargaPendant);
    end

    else if PilihanKategori = 2 then
    begin
        writeln('--------- Produk Skin and Body Care ---------');
        writeln('K. Sunscreen            : Rp', HargaSunscreen);
        writeln('L. Moisturizer          : Rp', HargaMoisturizer);
        writeln('M. Serum Vit-C          : Rp', HargaSerumVitC);
        writeln('N. Retinol              : Rp', HargaRetinol);
        writeln('O. Peeling Solution     : Rp', HargaPeelingSolution);
        writeln('P. Body Wash            : Rp', HargaBodyWash);
        writeln('Q. Body Scrub           : Rp', HargaBodyScrub);
        writeln('R. Body Lotion          : Rp', HargaBodyLotion);
        writeln('S. Body Mist            : Rp', HargaBodyMist);
        writeln('T. Body Peeling         : Rp', HargaBodyPeeling);
    end
end;

procedure PilihKecamatan;
begin
    writeln('===== Pilih Kecamatan =====');
    writeln('1. Medan Johor Rp', MedanJohor);
    writeln('2. Medan Amplas Rp', MedanAmplas);
    writeln('3. Medan Area Rp', MedanArea);
    writeln('4. Medan Kota Rp', MedanKota);
    writeln('5. Medan Baru Rp', MedanBaru);
    writeln('6. Medan Selayang Rp', MedanSelayang);
    writeln('7. Medan Belawan Rp', MedanBelawan);
    writeln('8. Medan Sunggal Rp', MedanSunggal);
    writeln;
    write('Pilih Kecamatan (1-8) : ');
    readln(PilihanKecamatan);

    case PilihanKecamatan of
    1 : begin Kec := 'Medan Johor'; OngkosKirim := MedanJohor; end;
    2 : begin Kec := 'Medan Amplas'; OngkosKirim := MedanAmplas; end;
    3 : begin Kec := 'Medan Area'; OngkosKirim := MedanArea; end;
    4 : begin Kec := 'Medan Kota'; OngkosKirim := MedanKota; end;
    5 : begin Kec := 'Medan Baru'; OngkosKirim := MedanBaru; end;
    6 : begin Kec := 'Medan Selayang'; OngkosKirim := MedanSelayang; end;
    7 : begin Kec := 'Medan Belawan'; OngkosKirim := MedanBelawan; end;
    8 : begin Kec := 'Medan Sunggal'; OngkosKirim := MedanSunggal; end;
    else
        begin
            writeln('Pilihan tidak valid. Ulangi dengan memasukkan nomor 1-8 saja.');
            writeln('Tekan "enter" untuk mencoba kembali...');
            readln;
            clrscr;
            PilihKecamatan;
        end;
    end;
end;

procedure PilihMetodePembayaran;
begin
    writeln('===== Metode Pembayaran =====');
    writeln('1. COD');
    writeln('2. Digital');
    writeln;
    write('Pilih Metode Pembayaran (1/2) : ');
    readln(PilihanPembayaran);

    case PilihanPembayaran of 
    1 : MetodePembayaran := 'COD';
    2 : MetodePembayaran := 'Digital';
    else
        begin
            writeln('Pilihan tidak valid. Ulangi dengan memasukkan nomor 1 atau 2 saja.');
            writeln('Tekan "enter" untuk mencoba kembali...');
            readln;
            clrscr;
            PilihMetodePembayaran;
        end;
    end;
end;

procedure HitungPesanan;
var TotalHarga : longint;
begin
    TotalPembayaran := 0;
    writeln('Pesanan                : ');
    for i := 1 to JumlahJenis do 
    begin
        with data[i] do
        begin
            case KodeProduk of 
            'A' : begin NamaProduk := 'Hair Clip'; Harga := HargaHairClip; end;
            'B' : begin NamaProduk := 'Headband'; Harga := HargaHeadBand; end;
            'C' : begin NamaProduk := 'Scrunchies'; Harga := HargaScrunchies; end;       
            'D' : begin NamaProduk := 'ScarfHairTies'; Harga := HargaScarfHairTies; end;
            'E' : begin NamaProduk := 'HairComb'; Harga := HargaHairComb; end;
            'F' : begin NamaProduk := 'Earring'; Harga := HargaEarring; end;
            'G' : begin NamaProduk := 'Bracelet'; Harga := HargaBracelet; end;
            'H' : begin NamaProduk := 'Necklace'; Harga := HargaNecklace; end;
            'I' : begin NamaProduk := 'Ring'; Harga := HargaRing; end;
            'J' : begin NamaProduk := 'Pendant'; Harga := HargaPendant; end;
            'K' : begin NamaProduk := 'Sunscreen'; Harga := HargaSunscreen; end;
            'L' : begin NamaProduk := 'Moisturizer'; Harga := HargaMoisturizer; end;
            'M' : begin NamaProduk := 'Serum Vit-C'; Harga := HargaSerumVitC; end;       
            'N' : begin NamaProduk := 'Retinol'; Harga := HargaRetinol; end;
            'O' : begin NamaProduk := 'Peeling Solution'; Harga := HargaPeelingSolution; end;
            'P' : begin NamaProduk := 'Body Wash'; Harga := HargaBodyWash; end;
            'Q' : begin NamaProduk := 'Body Scrub'; Harga := HargaBodyScrub; end;
            'R' : begin NamaProduk := 'Body Lotion'; Harga := HargaBodyLotion; end;
            'S' : begin NamaProduk := 'Body Mist'; Harga := HargaBodyMist; end;
            'T' : begin NamaProduk := 'Body Peeling'; Harga := HargaBodyPeeling; end;
            else
                NamaProduk := 'Tidak Valid';
                Harga := 0;
            end;

            TotalHarga := Harga * Jumlah;
            TotalPembayaran := TotalPembayaran + TotalHarga;
            writeln(' ',i,'. ', NamaProduk);
        end;
    end;
    TotalPembayaran := TotalPembayaran + OngkosKirim;
end;

begin
    repeat
        repeat
            welcome;
            if (PilihanKategori = 1) or (PilihanKategori = 2) then
            begin
                clrscr;
                TampilkanProduk(PilihanKategori);
                break;
            end
            else
            begin
                writeln('Pilihan tidak valid. Ulangi dengan memasukkan angka 1 atau 2 saja.');
                writeln('Tekan "enter" untuk kembali ke menu utama.');
                readln;
            end;
        until false;
    
    writeln;
    write('Jumlah Jenis Produk yang Ingin Dibeli: ');
    readln(JumlahJenis);
    writeln;
    
    for i := 1 to JumlahJenis do
    with data[i] do 
    begin
        write('Masukkan Kode Produk : ');
        readln(KodeProduk);
        write('Masukkan Jumlah Produk: ');
        readln(Jumlah);
        writeln;
    end;

    clrscr;
    write('Masukkan Nama Anda: ');
    readln(Nama);
    PilihKecamatan;
    write('Masukkan Alamat Lengkap Anda: ');
    readln(Alamat);
    clrscr;

    PilihMetodePembayaran;

    clrscr;
    writeln('=========== Rincian Pemesanan ===========');
    writeln('Nama Pembeli           : ', Nama);
    writeln('Alamat Lengkap         : ', Alamat);
    writeln('Kecamatan              : ', Kec);
    HitungPesanan;
    writeln('Total Pembayaran       : Rp', TotalPembayaran);
    writeln('Metode Bayar           : ', MetodePembayaran);
    writeln('=========================================');
    writeln('Terima kasih telah berbelanja di Bluberi!');
    writeln('Silahkan tunggu driver Bluberi tiba ^^');

    writeln;
    write('Apakah ingin memesan lagi? (Y/T): ');
    readln(LanjutPesan);
  until (LanjutPesan = 'T') or (LanjutPesan = 't');
end.
