<section id="navigator" class="orderform">
  <div class="container">
    <h1>{$LANG.thereisaproblem}</h1>
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
          <p class="margin-bottom">{$errormsg}</p>
          <div class="text-center">
            <a href="javascript:history.go(-1)" class="btn btn-default">
              <i class="fa fa-arrow-left"></i>&nbsp;
              {$LANG.problemgoback}
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
