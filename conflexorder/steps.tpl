<div class="container">
  <div id="orderFormIslemMenusu">
    <ul class="nav-justified">
      <li{if $step == 1} class="active"{/if}>
        <a href="#">
          <i class="fa fa-cubes"></i>
          <h3>Hizmet Seçimi</h3>
          <p>Sunduğumuz hizmetlerden birini seçin.</p>
        </a>
      </li>
      <li{if $step==2} class="active"{/if}>
        <a href="#">
          <i class="fa fa-cogs"></i>
          <h3>Hizmeti Yapılandırın</h3>
          <p>Hizmete ait konfigürasyonlar ile yapılandırın.</p>
        </a>
      </li>
      <li>
        <a href="#">
          <i class="fa fa-shopping-cart"></i>
          <h3>Sipariş Önizleme</h3>
          <p>Siparişlerinizi satın almadan önce kontrol edin.</p>
        </a>
      </li>
      <li{if $step == 5} class="active"{/if}>
        <a href="#">
          <i class="fa fa-credit-card"></i>
          <h3>Siparişinizi Tamamlayın</h3>
          <p>Zengin ödeme seçenekleri ile siparişinizi ödeyin.</p>
        </a>
      </li>
    </ul>
  </div>
</div>
