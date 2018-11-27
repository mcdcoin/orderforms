<section id="navigator" class="orderform">
  <div class="container">
    <h1>{$LANG.orderconfigure}</h1>
    <p>{$LANG.orderForm.configureDesiredOptions}</p>
  </div>
  {include file="orderforms/$carttpl/steps.tpl"}
</section>
<script>
var _localLang = {
    'addToCart': '{$LANG.orderForm.addToCart|escape}',
    'addedToCartRemove': '{$LANG.orderForm.addedToCartRemove|escape}'
}
</script>
<section id="page">
  <div class="container">
    <form id="frmConfigureProduct">
        <input type="hidden" name="configure" value="true" />
        <input type="hidden" name="i" value="{$i}" />

        {if $pricing.type eq "recurring"}
        <h2 class="odeme-tipi">{$LANG.cartchoosecycle}</h2>
        <ul id="odeme-dongusu" class="nav-justified">
          {if $pricing.monthly}
          <li>
            <a href="#">
              <label>
                {$pricing.monthly}
                <div class="option">
                  <input type="radio" name="billingcycle" value="monthly"{if $billingcycle eq "monthly"} checked="checked"{/if} />
                </div>
              </label>
            </a>
          </li>
          {/if}
          {if $pricing.quarterly}
          <li>
            <a href="#">
              <label>
                {$pricing.quarterly}
                <div class="option">
                  <input type="radio" name="billingcycle" value="quarterly"{if $billingcycle eq "quarterly"} checked="checked"{/if} />
                </div>
              </label>
            </a>
          </li>
          {/if}
          {if $pricing.semiannually}
          <li>
            <a href="#">
              <label>
                {$pricing.semiannually}
                <div class="option">
                  <input type="radio" name="billingcycle" value="semiannually"{if $billingcycle eq "semiannually"} checked="checked"{/if} />
                </div>
              </label>
            </a>
          </li>
          {/if}
          {if $pricing.annually}
          <li>
            <a href="#">
              <label>
                {$pricing.annually}
                <div class="option">
                  <input type="radio" name="billingcycle" value="annually"{if $billingcycle eq "annually"} checked="checked"{/if} />
                </div>
              </label>
            </a>
          </li>
          {/if}
          {if $pricing.biennially}
          <li>
            <a href="#">
              <label>
                {$pricing.biennially}
                <div class="option">
                  <input type="radio" name="billingcycle" value="biennially"{if $billingcycle eq "biennially"} checked="checked"{/if} />
                </div>
              </label>
            </a>
          </li>
          {/if}
          {if $pricing.triennially}
          <li>
            <a href="#">
              <label>
                {$pricing.triennially}
                <div class="option">
                  <input type="radio" name="billingcycle" value="triennially"{if $billingcycle eq "triennially"} checked="checked"{/if} />
                </div>
              </label>
            </a>
          </li>
          {/if}
        </ul>
        {/if}

        {if $productinfo.type eq "server"}
        <div id="configureProduct">
          <h2>{$LANG.cartconfigserver}</h2>
          <div class="view">

            <div class="rows">
              <div class="baslikHucre">
                {$LANG.serverhostname}
              </div>
              <div class="icerikHucre">
                <input type="text" name="hostname" class="form-control" id="inputHostname" value="{$server.hostname}" placeholder="sunucuadi.alanadi.com">
              </div>
            </div>

            <div class="rows">
              <div class="baslikHucre">
                {$LANG.serverns1prefix}
              </div>
              <div class="icerikHucre">
                <input type="text" name="ns1prefix" class="form-control" id="inputNs1prefix" value="{$server.ns1prefix}" placeholder="ns1.alanadi.com">
              </div>
            </div>

            <div class="rows">
              <div class="baslikHucre">
                {$LANG.serverns2prefix}
              </div>
              <div class="icerikHucre">
                <input type="text" name="ns2prefix" class="form-control" id="inputNs2prefix" value="{$server.ns2prefix}" placeholder="ns2.alanadi.com">
              </div>
            </div>

            <div class="rows">
              <div class="baslikHucre">
                {$LANG.serverrootpw}
              </div>
              <div class="icerikHucre">
                <input type="password" name="rootpw" class="form-control" id="inputRootpw" value="{$server.rootpw}">
              </div>
            </div>

          </div>
        </div>
        {/if}

        {if $configurableoptions}
        <div id="configureProduct">
          <h2>{$LANG.orderconfigpackage}</h2>
          <div class="view">

            {foreach $configurableoptions as $num => $configoption}
            <div class="rows">
              <div class="baslikHucre">
                {$configoption.optionname}
              </div>
              <div class="icerikHucre">
                <div class="input">
                    {if $configoption.optiontype eq 1}
                    <select name="configoption[{$configoption.id}]" id="inputConfigOption{$configoption.id}" class="form-control">
                        {foreach key=num2 item=options from=$configoption.options}
                            <option value="{$options.id}"{if $configoption.selectedvalue eq $options.id} selected="selected"{/if}>
                                {$options.name}
                            </option>
                        {/foreach}
                    </select>
                    {elseif $configoption.optiontype eq 2}
                    {foreach key=num2 item=options from=$configoption.options}
                    <label>
                      <input type="radio" name="configoption[{$configoption.id}]" value="{$options.id}"{if $configoption.selectedvalue eq $options.id} checked="checked"{/if} />
                      {if $options.name}
                        {$options.name}
                      {else}
                        {$LANG.enable}
                      {/if}
                    </label>
                    {/foreach}
                    {elseif $configoption.optiontype eq 3}
                    <input type="checkbox" name="configoption[{$configoption.id}]" id="inputConfigOption{$configoption.id}" value="1"{if $configoption.selectedqty} checked{/if} />
                    {if $configoption.options.0.name}
                        {$configoption.options.0.name}
                    {else}
                        {$LANG.enable}
                    {/if}
                    {elseif $configoption.optiontype eq 4}
                    {if $configoption.qtymaximum}
                        {if !$rangesliderincluded}
                            <script type="text/javascript" src="{$BASE_PATH_JS}/ion.rangeSlider.min.js"></script>
                            <link href="{$BASE_PATH_CSS}/ion.rangeSlider.css" rel="stylesheet">
                            <link href="{$BASE_PATH_CSS}/ion.rangeSlider.skinModern.css" rel="stylesheet">
                            {assign var='rangesliderincluded' value=true}
                        {/if}
                        <input type="text" name="configoption[{$configoption.id}]" value="{if $configoption.selectedqty}{$configoption.selectedqty}{else}{$configoption.qtyminimum}{/if}" id="inputConfigOption{$configoption.id}" class="form-control" />
                        <script>
                            var sliderTimeoutId = null;
                            var sliderRangeDifference = {$configoption.qtymaximum} - {$configoption.qtyminimum};
                            // The largest size that looks nice on most screens.
                            var sliderStepThreshold = 25;
                            // Check if there are too many to display individually.
                            var setLargerMarkers = sliderRangeDifference > sliderStepThreshold;

                            jQuery("#inputConfigOption{$configoption.id}").ionRangeSlider({
                                min: {$configoption.qtyminimum},
                                max: {$configoption.qtymaximum},
                                grid: true,
                                grid_snap: setLargerMarkers ? false : true,
                                onChange: function() {
                                    if (sliderTimeoutId) {
                                        clearTimeout(sliderTimeoutId);
                                    }

                                    sliderTimeoutId = setTimeout(function() {
                                        sliderTimeoutId = null;
                                        recalctotals();
                                    }, 250);
                                }
                            });
                        </script>
                    {else}
                        <div>
                            <input type="number" name="configoption[{$configoption.id}]" value="{if $configoption.selectedqty}{$configoption.selectedqty}{else}{$configoption.qtyminimum}{/if}" id="inputConfigOption{$configoption.id}" min="{$configoption.qtyminimum}" onchange="recalctotals()" onkeyup="recalctotals()" class="form-control form-control-qty" />
                            <span class="form-control-static form-control-static-inline">
                                x {$configoption.options.0.name}
                            </span>
                        </div>
                    {/if}
                    {/if}
                </div>
              </div>
            </div>
            {/foreach}
          </div>
        </div>
        {/if}

        {if $customfields}
        <div id="configureProduct">
          <h2>{$LANG.orderadditionalrequiredinfo}</h2>
          <div class="view">
            {foreach $customfields as $customfield}
            <div class="rows">
              <div class="baslikHucre">
                {$customfield.name}
              </div>
              <div class="icerikHucre">
                {$customfield.input}
                {if $customfield.description}
                <span class="field-help-text">
                  {$customfield.description}
                </span>
                {/if}
              </div>
            </div>
            {/foreach}
          </div>
        </div>
        {/if}

        {if $addons}
        <div id="configureProduct">
          <h2>{$LANG.cartavailableaddons}</h2>
          <div class="view">
            {foreach $addons as $addon}
            <div class="rows">
              <div class="baslikHucre">
                <label>
                    <input type="checkbox" name="addons[{$addon.id}]"{if $addon.status} checked{/if} />
                    {$addon.name}
                </label>
                <div>{$addon.description}</div>
              </div>
              <div class="icerikHucre">
                <div class="panel-price">
                    {$addon.pricing}
                </div>
              </div>
            </div>
            {/foreach}
          </div>
        </div>
        {/if}

        <div id="alisverisSepetiIslemleri" class="text-center" style="margin-top: 24px;">
          <button type="submit" id="btnCompleteProductConfig" class="sepetiOde">
              {$LANG.continue}
              <i class="fa fa-arrow-circle-right"></i>
          </button>
        </div>
    </form>
  </div>
</section>
