# SELF-HOSTED-N8N-DOCKER

Bu proje, n8n iş akışı otomasyon platformunun Docker üzerinde self-hosted olarak çalıştırılması için gerekli yapılandırmaları içerir. Traefik reverse proxy ile SSL sertifika yönetimi ve güvenli routing sağlanmaktadır.

# n8n Nedir?

n8n, açık kaynaklı bir iş akışı otomasyon platformudur. API'lar, veritabanları ve diğer hizmetler arasında bağlantı kurarak iş süreçlerini otomatikleştirir.

# Özellikler

- 250'den fazla entegrasyon seçeneği
- Görsel akış tasarım arayüzü
- Özel JavaScript kodları ile genişletilebilir
- REST API desteği
- Webhook tetikleyicileri
- Tam veri kontrolü
- Self-hosted altyapı
- Ücretsiz ve açık kaynak

# Neden n8n Tercih Edilmeli?

n8n'in tercih edilmesinin başlıca sebepleri:

- **Self-Hosted:** Kendi sunucunuzda çalıştırabilir, verilerinizin kontrolünü elinizde tutabilirsiniz
- **Ücretsiz ve Açık Kaynak:** Herhangi bir lisans ücreti ödemeden kullanabilirsiniz
- **Veri Gizliliği:** Veriler kendi altyapınızda kalır, üçüncü parti servislere bağımlılık yoktur
- **Özelleştirilebilir:** İhtiyaçlarınıza göre genişletebilir ve özelleştirebilirsiniz

# n8n vs make.com Karşılaştırması

| Özellik       | n8n                  | make.com        |
| ------------- | -------------------- | --------------- |
| Fiyatlandırma | Ücretsiz             | Freemium        |
| Hosting       | Self-hosted          | Cloud-based     |
| Veri Kontrolü | Tam kontrol          | Sınırlı kontrol |
| Özelleştirme  | Yüksek               | Orta            |
| Kurulum       | Teknik bilgi gerekli | Kolay başlangıç |

# Gereksinimler

- Docker ve Docker Compose
- Domain name ve DNS ayarları
- Traefik reverse proxy (proxy network'ü için)
- Minimum 2GB RAM önerilen

# Kurulum

1. Projeyi klonlayın
2. `.env` dosyasını oluşturun ve gerekli değişkenleri tanımlayın:

   - N8N_HOST=n8n.domain.com
   - N8N_PROTOCOL=https
   - N8N_PORT=5678

3. Docker ağını oluşturun:

```bash
docker network create proxy
```

4. Servisleri başlatın:

```bash
docker compose up -d
```

# Kullanışlı Komutlar

| Komut          | Açıklama                                                  |
| -------------- | --------------------------------------------------------- |
| `make restart` | Tüm servisleri yeniden başlatır ve n8n loglarını gösterir |
| `make down`    | Tüm servisleri durdurur                                   |
| `make clean`   | Kullanılmayan Docker kaynaklarını temizler                |
| `make log`     | n8n servisinin canlı loglarını gösterir                   |
| `make fix`     | Volume dizinlerinin izin sorunlarını düzeltir             |
| `make ps`      | Çalışan konteynerlerin durumunu listeler                  |

# Notlar

- Volumes dizini .gitignore'a eklenmiştir
- Timezone Europe/Istanbul olarak ayarlanmıştır
- SSL sertifikaları Traefik tarafından otomatik yönetilmektedir
- Docker volumes'lar ./volumes dizini altında tutularak, `docker system prune -a` komutu çalıştırıldığında n8n workflow ve ayarlarının silinmesi engellenmektedir
- Düzenli yedekleme yapılması önerilir
- Hassas veriler için encryption kullanılması tavsiye edilir

Bu değişiklikler projenin:

- Kurulum gereksinimlerini netleştirir
- Veri yedekleme özelliği ekler
- Güvenlik önlemlerini vurgular
- Kullanıcı deneyimini iyileştirir

# CI/CD

Proje, GitHub Actions ile otomatik deployment sürecine sahiptir. Master branch'e yapılan her push işleminden sonra:

- VPS sunucuya otomatik deployment yapılır
- Docker servisleri yeniden başlatılır
- Eski Docker image'ları temizlenir

Deployment için gerekli secret'lar:

- SSH_PRIVATE_KEY
- SSH_PORT
- SSH_HOST
- SSH_USERNAME
- SSH_PATH
