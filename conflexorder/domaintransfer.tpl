<section id="navigator" class="domain">
  <div class="container">
    <h1>Alan Adı İşlemleri</h1>
    <p class="desc">Alan adınızı tescil edin ve dünyadaki yerinizi alarak, hemen projenizi yayınlayın.</p>
  </div>
</section>
{include file="orderforms/standard_cart/common.tpl"}

<section id="page" class="backgroundf7f7f7">
  <div class="container">
    <ul id="domainIslemi" class="nav-justified">
      <li role="presentation"><a href="#alanAdiSorgula" aria-controls="alanAdiSorgula" role="tab" data-toggle="tab">Alan Adı Sorgula</a></li>
      <li role="presentation" class="active"><a href="#alanAdiTransferi" aria-controls="alanAdiTransferi" role="tab" data-toggle="tab">Alan Adı Transferi</a></li>
    </ul>

    <div class="tab-content">
      <div role="tabpanel" class="tab-pane fade" id="alanAdiSorgula">
        <div id="domainIslemIcerik">
          <form method="post" action="cart.php" id="frmDomainChecker">
            <div class="input">
              <input type="hidden" name="a" value="checkDomain">
              <span>www.</span>
              <input type="text" name="domain" id="inputDomain" value=" örn. example.com" onfocus="if(this.value==' örn. example.com')this.value=''" onblur="if(this.value=='')this.value=' örn. example.com'" class="standartWidth" />
              <button type="submit" id="btnCheckAvailability"><i class="fa fa-send"></i> <span>sorgula</span></button>
            </div>
          </form>
        </div>
      </div>
      <div role="tabpanel" class="tab-pane fade in active" id="alanAdiTransferi">
        <div id="domainIslemIcerik">
          <form method="post" action="cart.php" id="frmDomainTransfer">
            <div class="input">
              <input type="hidden" name="a" value="addDomainTransfer">
              <span>www.</span>
              <input type="text" name="domain" id="inputTransferDomain" value=" örn. example.com" onfocus="if(this.value==' örn. example.com')this.value=''" onblur="if(this.value=='')this.value=' örn. example.com'" class="transferDWidth" />
              <input type="text" name="epp" id="inputAuthCode" value="{lang key='orderForm.authCodePlaceholder'}" onfocus="if(this.value=='{lang key='orderForm.authCodePlaceholder'}')this.value=''" onblur="if(this.value=='')this.value='{lang key='orderForm.authCodePlaceholder'}'" class="transferEPPWidth" />
              <button type="submit" id="btnTransferDomain">
                <span id="addToCart">
                  <i class="fa fa-send"></i> <span>transfer</span>
                </span>
                <span class="loader hidden" id="addTransferLoader">
                  <i class="fa fa-fw fa-spinner fa-spin"></i>
                </span>
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <div id="DomainSearchResults" class="hidden">
      <div id="searchDomainInfo" class="domain-checker-result-headline">
        <p id="primaryLookupSearching" class="domain-lookup-loader domain-lookup-primary-loader domain-searching domain-araniyor">
          <i class="fa fa-spinner fa-spin"></i> {lang key='orderForm.searching'}...
        </p>
        <div id="primaryLookupResult" class="domain-lookup-result hidden" style="padding: 0 4px;">
          <div class="domain-invalid alert alert-danger">
            {lang key='orderForm.domainLetterOrNumber'}
            <span class="domain-length-restrictions">
              {lang key='orderForm.domainLengthRequirements'}</span>
          </div>

          <div class="domain-unavailable alert alert-danger">
            {lang key='orderForm.domainIsUnavailable'}
          </div>
          <div class="domain-available alert alert-success">
            {$LANG.domainavailable1} <strong></strong> {$LANG.domainavailable2}
          </div>

          <a class="domain-contact-support btn btn-primary">{$LANG.domainContactUs}</a>

          <p class="domain-price text-center">
            <span class="price"></span>
            <button class="devamEt btn-add-to-cart" data-whois="0" data-domain="">
              <span class="to-add">{$LANG.addtocart}</span>
              <span class="added"><i class="glyphicon glyphicon-shopping-cart"></i> {lang key='checkout'}</span>
              <span class="unavailable">{$LANG.domaincheckertaken}</span>
            </button>
          </p>

        </div>
      </div>
    </div>

  </div>
</section>

{include file="orderforms/conflexorder/domain-tab-menu.tpl"}

{if $lookupTerm && !$captchaError}
    <script>
        jQuery(document).ready(function() {
            jQuery('#btnCheckAvailability').click();
        });
    </script>
{/if}
