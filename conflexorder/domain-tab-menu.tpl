{if $featuredTlds}
<section id="page">
  <div class="container">
    <div class="featured-tlds-container">
      <div class="row">
        {foreach $featuredTlds as $num => $tldinfo}
        {if $num % 3 == 0 && (count($featuredTlds) - $num < 3)}
          {if count($featuredTlds) - $num == 2}
          <div class="col-sm-2"></div>
          {else}
          <div class="col-sm-4"></div>
          {/if}
        {/if}
        <div class="col-sm-4 col-xs-6">
          <div class="featured-tld">
            <div class="img-container">
              <img src="{$BASE_PATH_IMG}/tld_logos/{$tldinfo.tldNoDots}.png">
            </div>
            <div class="price {$tldinfo.tldNoDots}">
              {if is_object($tldinfo.register)}
              {$tldinfo.register->toPrefixed()}{if $tldinfo.period > 1}{lang key="orderForm.shortPerYears" years={$tldinfo.period}}{else}{lang key="orderForm.shortPerYear" years=''}{/if}
              {else}
              N/A
              {/if}
            </div>
          </div>
        </div>
        {/foreach}
      </div>
    </div>
  </div>
</section>
{/if}
<section id="domainTabMenu">
  <div class="container">
    <ul id="domainOzellikleri" class="nav-justified">
      <li role="presentation" class="active"><a href="#ozellikler" aria-controls="ozellikler" role="tab" data-toggle="tab">Özellikler</a></li>
      <li role="presentation"><a href="#uzantilarFiyatlar" aria-controls="uzantilarFiyatlar" role="tab" data-toggle="tab">Uzantılar ve Fiyatları</a></li>
      <li role="presentation"><a href="#trBelgeleri" aria-controls="trBelgeleri" role="tab" data-toggle="tab">.TR için Gerekli Belgeler</a></li>
    </ul>

    <div class="tab-content">
      <div role="tabpanel" class="tab-pane fade in active" id="ozellikler">

        <ul id="domainTeknikOzellikleri">
          <li>
            <i class="fa fa-user-secret"></i>
            <h3>WHOIS Gizleme</h3>
            <p>Alan adı sorgulamasında kişisel bilgilerinizin çıkmasını engelleyebilirsiniz.</p>
          </li>
          <li>
            <i class="fa fa-lock"></i>
            <h3>Alan Adı Kilitleme</h3>
            <p>Alan adınızı kilitleyerek koruyabilir ve çalınma riskini ortadan kaldırabilirsiniz.</p>
          </li>
          <li>
            <i class="fa fa-server"></i>
            <h3>Özel DNS Sunucuları</h3>
            <p>Kendi DNS sunucularınızı oluşturarak markanızın değerini arttırabilirsiniz.</p>
          </li>
          <li>
            <i class="fa fa-sitemap"></i>
            <h3>Yönlendirme</h3>
            <p>Alan adınızı ücretsiz bir şekilde istediğiniz gibi yönlendirebilirsiniz.</p>
          </li>
          <li>
            <i class="fa fa-cogs"></i>
            <h3>Yönetim Paneli</h3>
            <p>Yönetim panelinizden alan adınızı yönlendirebilir, dns bilgilerini güncelleme gibi birçok işlemi gerçekleştirebilirsiniz.</p>
          </li>
          <li>
            <i class="fa fa-credit-card"></i>
            <h3>Kredi Kartı ile Ödeme</h3>
            <p>Havale, EFT ve Kredi Kartı ile alan adı satın alabilir, uzatabilir ya da transfer edebilirsiniz.</p>
          </li>
        </ul>

      </div>
      <div role="tabpanel" class="tab-pane fade" id="uzantilarFiyatlar">
        <script language="javascript" src="templates/{$template}/includes/domainpricing.php"></script>
      </div>
      <div role="tabpanel" class="tab-pane fade" id="trBelgeleri">
        <ul id="domainBelgeleri">
          <li>
            <h3>.com.tr Alan Adi için Gerekli Belgeler</h3>
            <div>
              <p><strong>Kişisel (adsoyad.com.tr) için;</strong></p>
              <p>Kimlik bilgileri ile birebir uyuşan alan adı başvurularında belge gerekmemektedir.Sipariş formunda T.C. Kimlik numarası yeterlidir, sipariş geçeceğiniz ad-soyad alan adınızın, kimlik ile tam uyuşmasına dikkat ediniz.</p>
              <p><strong>Ticari Amaçla .com.tr Tescili;</strong></p>
              <p>Size göndereceğimiz "Alan adı tahsis" formu ile birlikte,</p>
              <p>- Ticaret Sicil Gazetesi, Marka Tescil Belgesi, Sicil Tasdiknamesi belgelerinden herhangi bir tanesini bize iletmeniz yeterlidir. Burada dikkat edilmesi gereken husus, başvurulan alan adı ile resmi belgede yer alan ünvanın örtüşmesidir.</p>
              <p><strong>Dernek, Vakıf, Radyo, TV, Film, Sanatçı, Otel, Tatil Köyü, Dergi, Gazete, Hastane, İlaç, Çiftlik, Fuar, Gemi;</strong></p>
              <p>Bu tip bir başvuruda, bağlı bulunan örneğin otel için Turizm bakanlığından alınan Turizm İşletme Belgesi, film adları için Kültür bakanlığı Telif hakları ve sinema genel müdürlüğünden alınmış kayıt tescil belgesi gibi, işletme veya girişimin bağlı bulunan resmi kurumdan alınan resmi kayıt tescil belgesi ile başvurular kabul edilecektir.</p>
            </div>
          </li>
          <li>
            <h3>.org.tr Alan Adi için Gerekli Belgeler</h3>
            <div>
              <p>Dernek veya vakıflar için yapılan başvurularda, başvuru yapan organizasyonun kuruluş kanunu, vakıf senedi veya dernek tüzüğünün ilk üç sayfası ve son sayfası gerekmektedir.</p>
            </div>
          </li>
          <li>
            <h3>.net.tr Alan Adi için Gerekli Belgeler</h3>
            <div>
              <p>Telekomünikasyon kurumundan alınmış ISS Genel İzin belgesi, Web tabanlı çalışan kişi veya kuruluşlar için var olan web sitelerini ve vermek istediği hizmeti açıklar dilekçe (kişi adına ise nüfus cüzdanı, şirket ise ticari belgeler), ile İnternet hizmeti vereceğini beyan ederek alınabilir. İnternet hizmeti, internet servisleri verecek olan kişi veya kuruluşlara tahsis edilmektedir, her ticari kurum .net.tr alamamaktadır, başvurularınızı buna göre yapmanızı rica ederiz.</p>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</section>
