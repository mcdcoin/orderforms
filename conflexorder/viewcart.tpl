<section id="navigator" class="orderform">
  <div class="container">
    <h1>{$LANG.cartreviewcheckout}</h1>
    <p class="desc">Alış-veriş sepetinizdeki ürünleri kontrol edin. Ardından siparişinizi onaylamaya hazırlanın.</p>
  </div>
  {include file="orderforms/$carttpl/steps.tpl"}
</section>
<section id="page">
  <div class="container">
    {if $checkout}
      {include file="orderforms/$carttpl/checkout.tpl"}
    {else}
      <script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

      <!-- uyarılar -->
      {if $promoerrormessage}
          <div class="alert alert-warning text-center" role="alert">
              {$promoerrormessage}
          </div>
      {elseif $errormessage}
          <div class="alert alert-danger" role="alert">
              <p>{$LANG.orderForm.correctErrors}:</p>
              <ul>
                  {$errormessage}
              </ul>
          </div>
      {elseif $promotioncode && $rawdiscount eq "0.00"}
          <div class="alert alert-info text-center" role="alert">
              {$LANG.promoappliedbutnodiscount}
          </div>
      {elseif $promoaddedsuccess}
          <div class="alert alert-success text-center" role="alert">
              {$LANG.orderForm.promotionAccepted}
          </div>
      {/if}

      {if $bundlewarnings}
          <div class="alert alert-warning" role="alert">
              <strong>{$LANG.bundlereqsnotmet}</strong><br />
              <ul>
                  {foreach from=$bundlewarnings item=warning}
                      <li>{$warning}</li>
                  {/foreach}
              </ul>
          </div>
      {/if}
      <!-- / uyarılar -->

      <!-- sepet içeriği -->
      <form method="post" action="{$smarty.server.PHP_SELF}?a=view">
        <ul id="alisverisSepeti">
          <li class="title">
            <div class="urun-secenekler">
              {$LANG.orderForm.productOptions}
            </div>
            {if $showqtyoptions}
              <div class="qty-options">
                {$LANG.orderForm.qty}
              </div>
            {/if}
            <div class="fiyat-peryiod">
              {$LANG.orderForm.priceCycle}
            </div>
          </li>
          {foreach $products as $num => $product}
          <li>
            <div class="urun-secenekler">
              <div class="urun-title">
                {$product.productinfo.name}
                <a href="{$smarty.server.PHP_SELF}?a=confproduct&i={$num}">
                  <i class="fa fa-pencil"></i></span>
                </a>
                <a onclick="removeItem('p','{$num}')">
                  <i class="fa fa-times"></i></span>
                </a>
              </div>
              <div class="urun-grubu">
                <span>{$product.productinfo.groupname}</span>
                {if $product.domain}
                  <span>{$product.domain}</span>
                {/if}
                {if $product.configoptions}
                    <div>
                      <small>
                        {foreach key=confnum item=configoption from=$product.configoptions}
                            &nbsp;&raquo; {$configoption.name}: {if $configoption.type eq 1 || $configoption.type eq 2}{$configoption.option}{elseif $configoption.type eq 3}{if $configoption.qty}{$configoption.option}{else}{$LANG.no}{/if}{elseif $configoption.type eq 4}{$configoption.qty} x {$configoption.option}{/if}<br />
                        {/foreach}
                      </small>
                    </div>
                {/if}
              </div>
            </div>
            {if $showqtyoptions}
            <div class="qty-options">
              {if $product.allowqty}
              <input type="number" name="qty[{$num}]" value="{$product.qty}" class="form-control text-center" />
              <button type="submit" class="btn btn-xs">{$LANG.orderForm.update}</button>
              {/if}
            </div>
            {/if}
            <div class="fiyat-peryiod">
              <span>{$product.pricing.totalTodayExcludingTaxSetup}</span>
              <span class="cycle">{$product.billingcyclefirendly}</span>
              {if $product.pricing.productonlysetup}
                {$product.pricing.productonlysetup->toPrefixed()} {$LANG.ordersetupfee}
              {/if}
              {if $prodcut.proratadate}<div>($LANG.orderprorata {$product.proratadate})</div>{/if}
            </div>
            <div class="clear"></div>
            {foreach key=addonnum item=addon from=$product.addons}
            <div class="addon-name">
              <div class="addon-title">
                {$addon.name}
              </div>
              <div class="addon-group">
                {$LANG.orderaddon}
                {if $addon.setup}<span class="addon-setup">{$addon.setup} {$LANG.ordersetupfee}</span>{/if}
              </div>
            </div>
            <div class="addon-fiyat">
              <span>{$addon.totaltoday}</span>
              <span class="cycle">{$addon.billingcyclefriendly}</span>
            </div>
            {/foreach}
          </li>
          {/foreach}
          {foreach $addons as $num => $addon}
          <li>
            <div class="urun-secenekler">
              <div class="urun-title">
                {$addon.name}
                <a onclick="removeItem('a','{$num}')">
                  <i class="fa fa-times"></i>
                </a>
              </div>
              <span class="item-group">
                  {$addon.productname}
              </span>
              {if $addon.domainname}
                  <span class="item-domain">
                      {$addon.domainname}
                  </span>
              {/if}
              {if $addon.setup}
                  <span class="item-setup">
                      {$addon.setup} {$LANG.ordersetupfee}
                  </span>
              {/if}
            </div>
            <div class="qty-options">
              <div>{$addon.pricingtext}</div>
              <div class="cycle">{$addon.billingcyclefriendly}</div>
            </div>
          </li>
          {/foreach}
          {foreach $domains as $num => $domain}
          <li>
            <div class="urun-secenekler">
              <div class="urun-title">
                {if $domain.type eq "register"}{$LANG.orderdomainregistration}{else}{$LANG.orderdomaintransfer}{/if}
                <a href="{$smarty.server.PHP_SELF}?a=confdomains">
                  <i class="fa fa-pencil"></i>
                </a>
                <a onclick="removeItem('d','{$num}')">
                  <i class="fa fa-times"></i>
                </a>
              </div>
              {if $domain.domain}
                  <span class="item-domain">
                      {$domain.domain}
                  </span>
              {/if}
              {if $domain.dnsmanagement}&nbsp;&raquo; {$LANG.domaindnsmanagement}<br />{/if}
              {if $domain.emailforwarding}&nbsp;&raquo; {$LANG.domainemailforwarding}<br />{/if}
              {if $domain.idprotection}&nbsp;&raquo; {$LANG.domainidprotection}<br />{/if}
            </div>
            <div class="qty-options">
              {if count($domain.pricing) == 1 || $domain.type == 'transfer'}
                  <div name="{$domain.domain}Price">{$domain.price}</div>
                  <div class="renewal cycle">
                    {$domain.regperiod} {$domain.yearsLanguage}
                      {lang key='domainrenewalprice'} <span class="renewal-price cycle">{$domain.renewprice->toPrefixed()}{$domain.shortYearsLanguage}</span>
                  </div>
              {else}
                  <div name="{$domain.domain}Price">{$domain.price}</div>
                  <div class="dropdown">
                      <button class="btn btn-default btn-xs dropdown-toggle" type="button" id="{$domain.domain}Pricing" name="{$domain.domain}Pricing" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                          {$domain.regperiod} {$domain.yearsLanguage}
                          <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu" aria-labelledby="{$domain.domain}Pricing">
                          {foreach $domain.pricing as $years => $price}
                              <li>
                                  <a href="#" onclick="selectDomainPeriodInCart('{$domain.domain}', '{$price.register}', {$years}, '{if $years == 1}{lang key='orderForm.year'}{else}{lang key='orderForm.years'}{/if}');return false;">
                                      {$years} {if $years == 1}{lang key='orderForm.year'}{else}{lang key='orderForm.years'}{/if} @ {$price.register}
                                  </a>
                              </li>
                          {/foreach}
                      </ul>
                  </div>
                  <div class="renewal cycle">
                      {lang key='domainrenewalprice'} <div class="renewal-price cycle">{$domain.renewprice->toPrefixed()}{$domain.shortYearsLanguage}</div>
                  </div>
              {/if}
            </div>
          </li>
          {/foreach}
          {foreach key=num item=domain from=$renewals}
          <li>
            <div class="urun-secenekler">
              <div class="urun-title">
                {$LANG.domainrenewal}
                <a onclick="removeItem('r','{$num}')">
                  <i class="fa fa-times"></i>
                </a>
              </div>
              <span class="item-domain">
                {$domain.domain}
              </span>
              {if $domain.dnsmanagement}&nbsp;&raquo; {$LANG.domaindnsmanagement}<br />{/if}
              {if $domain.emailforwarding}&nbsp;&raquo; {$LANG.domainemailforwarding}<br />{/if}
              {if $domain.idprotection}&nbsp;&raquo; {$LANG.domainidprotection}<br />{/if}
            </div>
            <div class="qty-options">
              <div>{$domain.price}</div>
              <div class="cycle">{$domain.regperiod} {$LANG.orderyears}</div>
            </div>
          </li>
          {/foreach}
        </ul>
        {if $cartitems == 0}
        <div class="alert text-center">
          {$LANG.cartempty}
        </div>
        {/if}
        <div id="alisverisSepetiIslemleri">
          <div class="cell">
            {if $cartitems > 0}
              <a href="#" id="btnEmptyCart" class="sepetiBosalt">
                <i class="fa fa-trash"></i>
                <span>{$LANG.emptycart}</span>
              </a>
            {/if}
          </div>
          <div class="cell text-right">
            <a href="cart.php" class="standartButon btn-continue-shopping" id="continueShopping">
              {$LANG.orderForm.continueShopping}
            </a>
            <a href="cart.php?a=checkout" class="sepetiOde btn-checkout{if $cartitems == 0} disabled{/if}" id="checkout">
              {$LANG.orderForm.checkout}
              <i class="fa fa-arrow-right"></i>
            </a>
          </div>
        </div>
      </form>

      {foreach $gatewaysoutput as $gatewayoutput}
          <div class="view-cart-gateway-checkout">
              {$gatewayoutput}
          </div>
      {/foreach}
      <!-- / sepet içeriği -->

      <hr />

      <div id="alisverisSepetiIslemleri">
        <div class="cell2">
          <div id="applyPromo">
            <h2>{$LANG.orderForm.applyPromoCode}</h2>
            <div>
              {if $promotioncode}
              <div><strong>{$promotioncode}</strong> - {$promotiondescription}</div>
              <div><a href="{$smarty.server.PHP_SELF}?a=removepromo" class="sepetiBosalt">{$LANG.orderForm.removePromotionCode}</a></div>
              {else}
              <form method="post" action="cart.php?a=view">
                <div class="input">
                  <input type="text" name="promocode" id="inputPromotionCode" placeholder="{lang key="orderPromoCodePlaceholder"}" required="required" />
                  <button type="submit" name="validatepromo" value="{$LANG.orderpromovalidatebutton}">
                    <i class="fa fa-try"></i>
                    {$LANG.orderpromovalidatebutton}
                  </button>
                </div>
              </form>
              {/if}
            </div>
          </div>
        </div>
        <div class="cell2">
          <div id="odemeTutari">
            <h2>{$LANG.ordersummary}</h2>
            <div class="satir">
              <div class="hucre">{$LANG.ordersubtotal}</div>
              <div class="hucre text-right">{$subtotal}</div>
            </div>
            {if $promotioncode || $taxrate || $taxrate2}
              {if $promotioncode}
                <div class="satir">
                  <div class="hucre">{$promotiondescription}</div>
                  <div class="hucre text-right">{$discount}</div>
                </div>
              {/if}
              {if $taxrate}
                <div class="satir">
                  <div class="hucre">{$taxname} @ {$taxrate}%</div>
                  <div class="hucre text-right">{$taxtotal}</div>
                </div>
              {/if}
              {if $taxrate2}
                <div class="satir">
                  <div class="hucre">{$taxname2} @ {$taxrate2}%</div>
                  <div class="hucre text-right">{$taxtotal2}</div>
                </div>
              {/if}
            {/if}
            <div class="satir">
              <div class="hucre">{$LANG.orderForm.totals}</div>
              <div class="hucre text-right">
                <span id="recurringMonthly" {if !$totalrecurringmonthly}style="display:none;"{/if}>
                    <span class="cost">{$totalrecurringmonthly}</span> {$LANG.orderpaymenttermmonthly}<br />
                </span>
                <span id="recurringQuarterly" {if !$totalrecurringquarterly}style="display:none;"{/if}>
                    <span class="cost">{$totalrecurringquarterly}</span> {$LANG.orderpaymenttermquarterly}<br />
                </span>
                <span id="recurringSemiAnnually" {if !$totalrecurringsemiannually}style="display:none;"{/if}>
                    <span class="cost">{$totalrecurringsemiannually}</span> {$LANG.orderpaymenttermsemiannually}<br />
                </span>
                <span id="recurringAnnually" {if !$totalrecurringannually}style="display:none;"{/if}>
                    <span class="cost">{$totalrecurringannually}</span> {$LANG.orderpaymenttermannually}<br />
                </span>
                <span id="recurringBiennially" {if !$totalrecurringbiennially}style="display:none;"{/if}>
                    <span class="cost">{$totalrecurringbiennially}</span> {$LANG.orderpaymenttermbiennially}<br />
                </span>
                <span id="recurringTriennially" {if !$totalrecurringtriennially}style="display:none;"{/if}>
                    <span class="cost">{$totalrecurringtriennially}</span> {$LANG.orderpaymenttermtriennially}<br />
                </span>
              </div>
            </div>
            <div class="satir">
              <div class="hucre">{$LANG.ordertotalduetoday}</div>
              <div class="hucre text-right">{$total}</div>
            </div>
          </div>
        </div>
      </div>
    {/if}
  </div>
</section>

<!-- modal işlemleri -->
<div class="modal fade" id="modalRemoveItem" role="dialog" aria-labelledby="modalRemoveItem">
  <div class="modal-dialog" role="document">
    <div class="customModalContainer">
      <form action="cart.php" method="post">
        <input type="hidden" name="a" value="remove" />
        <input type="hidden" name="r" value="" id="inputRemoveItemType" />
        <input type="hidden" name="i" value="" id="inputRemoveItemRef" />
        <div class="modalHead">
          {$LANG.orderForm.removeItem}
          <span style="float:right; cursor:pointer;" data-dismiss="modal" aria-label="Kapat">
            <i class="fa fa-times"></i>
          </span>
        </div>
        <div class="modalDocument">
          {$LANG.cartremoveitemconfirm}
          <div class="view-controller">
            <button type="button" class="remove" data-dismiss="modal">{$LANG.no}</button>
            <button type="submit">{$LANG.yes}</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

<div class="modal fade" id="modalEmptyCart" role="dialog" aria-labelledby="modalEmptyCart">
  <div class="modal-dialog" role="document">
    <div class="customModalContainer">
      <form action="cart.php" method="post">
        <input type="hidden" name="a" value="empty" />
        <div class="modalHead">
          {$LANG.emptycart}
          <span style="float:right; cursor:pointer;" data-dismiss="modal" aria-label="Kapat">
            <i class="fa fa-times"></i>
          </span>
        </div>
        <div class="modalDocument">
          {$LANG.cartemptyconfirm}
          <div class="view-controller">
            <button type="button" class="remove" data-dismiss="modal">{$LANG.no}</button>
            <button type="submit">{$LANG.yes}</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
