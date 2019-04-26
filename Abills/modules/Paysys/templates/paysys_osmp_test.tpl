<form method='post' class='form form-horizontal'>
<input type='hidden' name='index' value='$index'>

<div class='box box-theme box-form'>
    <div class='box-header with-border'><h4 class='box-title'>Тестировние OSMP</h4></div>

<div class='box-body'>


<div class='form-group'>
<label class='col-md-6 control-label'>Идентификатор пользователя</label>
<div class='col-md-6'>
<input class='form-control' type='text' name='USER' value='%USER%'>
</div>
</div>

</div>

<div class='box-footer'>
  <input class='btn btn-primary' type='submit' name='test' value='Провести тест'>
</div>
</div> 

</form>

<!-- MESSAGE FOR CHECK TEST -->
%CHECK_MESSAGE%
<div class="panel box box-form box-primary %CHECK_HIDDEN%">
  <div class="box-header with-border">
  <h4 class="box-title">
  <a data-toggle="collapse" data-parent="#accordion" href="#check_result" aria-expanded="false" class="collapsed">
  Запрос на проверку пользователя
  </a>
  </h4>
  </div>
  <div id="check_result" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
  <div class="box-body">
    <textarea class='form-control' rows='15'>%CHECK_RESULT%</textarea>
  </div>
  </div>
</div>

<!-- MESSAGE FOR PAY TEST -->
%PAY_MESSAGE%
<div class="panel box box-form box-primary %PAY_HIDDEN%">
  <div class="box-header with-border">
  <h4 class="box-title">
  <a data-toggle="collapse" data-parent="#accordion" href="#pay_result" aria-expanded="false" class="collapsed">
  Запрос на проверку оплаты
  </a>
  </h4>
  </div>
  <div id="pay_result" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
  <div class="box-body">
    <textarea class='form-control' rows='15'>%PAY_RESULT%</textarea>
  </div>
  </div>
</div>