<section id="navigator" class="orderform">
  <div class="container">
    <h1>{$LANG.cartfraudcheck}</h1>
  </div>
  {include file="orderforms/$carttpl/steps.tpl"}
</section>
<section id="page">
  <div class="container">
    <div>
      <div class="alert alert-danger error-heading">
        <i class="fa fa-warning"></i>
        {$errortitle}
      </div>

      <div class="row">
          <div class="col-sm-8 col-sm-offset-2">

              <p class="margin-bottom">{$error}</p>

              <div class="text-center">
                  <a href="submitticket.php" class="btn btn-default">
                      {$LANG.orderForm.submitTicket}
                      &nbsp;<i class="fa fa-arrow-right"></i>
                  </a>
              </div>

          </div>
      </div>
    </div>
  </div>
</section>
