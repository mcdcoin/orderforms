<section id="navigator" class="orderform">
  <div class="container">
    <h1>{$LANG.domaincheckerchoosedomain}</h1>
    <p>Satın aldığınız hosting ya da sunucu hizmetine alan adınızı bağlayın.</p>
  </div>
  {include file="orderforms/$carttpl/steps.tpl"}
</section>
<section id="page">
  <div class="container">
    <form method="post" action="{$smarty.server.PHP_SELF}?a=add&pid={$pid}">
        <div class="domain-selection-options">
            {if $incartdomains}
                <div class="option">
                    <label>
                        <input type="radio" name="domainoption" value="incart" id="selincart" />{$LANG.cartproductdomainuseincart}
                    </label>
                    <div class="domain-input-group clearfix" id="domainincart">
                        <div class="row">
                            <div class="col-sm-8 col-sm-offset-1 col-md-6 col-md-offset-2">
                                <div class="domains-row">
                                    <select name="incartdomain" class="form-control">
                                    {foreach key=num item=incartdomain from=$incartdomains}
                                        <option value="{$incartdomain}">{$incartdomain}</option>
                                    {/foreach}
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
            {if $registerdomainenabled}
                <div class="option">
                    <label>
                        <input type="radio" name="domainoption" value="register" id="selregister" />{$LANG.cartregisterdomainchoice|sprintf2:$companyname}
                    </label>
                    <div class="domain-input-group clearfix" id="domainregister">
                        <div class="row">
                            <div class="col-sm-8 col-sm-offset-1">
                                <div class="row domains-row">
                                    <div class="col-xs-9">
                                        <div class="input-group">
                                            <span class="input-group-addon">{$LANG.orderForm.www}</span>
                                            <input type="text" name="sld[0]" value="{$sld}" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <select name="tld[0]" class="form-control">
                                        {foreach from=$registertlds item=listtld}
                                            <option value="{$listtld}"{if $listtld eq $tld} selected="selected"{/if}>{$listtld}</option>
                                        {/foreach}
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
            {if $transferdomainenabled}
                <div class="option">
                    <label>
                        <input type="radio" name="domainoption" value="transfer" id="seltransfer" />{$LANG.carttransferdomainchoice|sprintf2:$companyname}
                    </label>
                    <div class="domain-input-group clearfix" id="domaintransfer">
                        <div class="row">
                            <div class="col-sm-8 col-sm-offset-1">
                                <div class="row domains-row">
                                    <div class="col-xs-9">
                                        <div class="input-group">
                                            <span class="input-group-addon">www.</span>
                                            <input type="text" name="sld[1]" value="{$sld}" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <select name="tld[1]" class="form-control">
                                        {foreach from=$transfertlds item=listtld}
                                            <option value="{$listtld}"{if $listtld eq $tld} selected="selected"{/if}>{$listtld}</option>
                                        {/foreach}
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
            {if $owndomainenabled}
                <div class="option">
                    <label>
                        <input type="radio" name="domainoption" value="owndomain" id="selowndomain" />{$LANG.cartexistingdomainchoice|sprintf2:$companyname}
                    </label>
                    <div class="domain-input-group clearfix" id="domainowndomain">
                        <div class="row">
                            <div class="col-sm-9">
                                <div class="row domains-row">
                                    <div class="col-xs-2 text-right">
                                        <p class="form-control-static">www.</p>
                                    </div>
                                    <div class="col-xs-7">
                                        <input type="text" name="sld[2]" value="{$sld}" class="form-control" />
                                    </div>
                                    <div class="col-xs-3">
                                        <input type="text" name="tld[2]" value="{$tld|substr:1}" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
            {if $subdomains}
                <div class="option">
                    <label>
                        <input type="radio" name="domainoption" value="subdomain" id="selsubdomain" />{$LANG.cartsubdomainchoice|sprintf2:$companyname}
                    </label>
                    <div class="domain-input-group clearfix" id="domainsubdomain">
                        <div class="row">
                            <div class="col-sm-9">
                                <div class="row domains-row">
                                    <div class="col-xs-2 text-right">
                                        <p class="form-control-static">http://</p>
                                    </div>
                                    <div class="col-xs-5">
                                        <input type="text" name="sld[3]" value="{$sld}" class="form-control" />
                                    </div>
                                    <div class="col-xs-5">
                                        <select name="tld[3]" class="form-control">
                                        {foreach from=$subdomains key=subid item=subdomain}
                                            <option value="{$subid}">{$subdomain}</option>
                                        {/foreach}
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
        </div>
        {if $availabilityresults}
            <h3 class="configureProductDomain">{$LANG.choosedomains}</h3>
            <ul id="configureProductDomainList">
                {foreach key=num item=result from=$availabilityresults}
                <li>
                    <div class="alanAdi">
                        {$result.domain}
                    </div>
                    <div class="alanAdiDurumu {if $result.status eq $searchvar}uygun{else}uygundegil{/if}">
                        {if $result.status eq $searchvar}
                            <input type="checkbox" name="domains[]" value="{$result.domain}"{if $num eq 0} checked{/if} />
                            {$LANG.domainavailable}
                        {else}
                            {$LANG.domainunavailable}
                        {/if}
                    </div>
                    {if $result.regoptions}
                    <div class="alanAdiFiyati">
                        <select name="domainsregperiod[{$result.domain}]">
                        {foreach key=period item=regoption from=$result.regoptions}
                            {if $regoption.$domainoption}
                            <option value="{$period}">{$period} {$LANG.orderyears} @ {$regoption.$domainoption}</option>
                            {/if}
                        {/foreach}
                        </select>
                    </div>
                    {/if}
                </li>
                {/foreach}
            </ul>
        {/if}
        {if $freedomaintlds}
            <p>* <em>{$LANG.orderfreedomainregistration} {$LANG.orderfreedomainappliesto}: {$freedomaintlds}</em></p>
        {/if}
        <div style="margin-top: 6px; text-align: center;">
            <button type="submit" class="btn btn-default">{$LANG.continue} &nbsp;<i class="fa fa-arrow-circle-right"></i></button>
        </div>
    </form>
  </div>
</section>
