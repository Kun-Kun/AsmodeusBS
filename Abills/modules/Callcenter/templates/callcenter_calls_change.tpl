<form action=$SELF_URL METHOD=POST>
  <input type='hidden' name='index' value=$index>
  <input type='hidden' name='change' value=%ID%>

  <div class='box box-theme box-form form-horizontal'>
  
  <div class='box-heading with-border text-primary'>_{CALL}_</div>

  <div class='box-body'>
    <div class='form-group'>
      <label class='control-label col-md-3'>_{STATUS}_</label>
      <div class='col-md-9'>
        %STATUS_SELECT%
      </div>
    </div>
    <div class='form-group'>
      <label class='control-label col-md-3'>_{USER}_</label>
      <div class='col-md-9'>
        <input class='form-control' type='text' name='USER' value='%USER%' disabled='disabled'>
      </div>
    </div>
    <div class='form-group'>
      <label class='control-label col-md-3'>_{ADMIN}_</label>
      <div class='col-md-9'>
        <input class='form-control' type='text' name='ADMIN' value='%ADMIN%' disabled='disabled'>
      </div>
    </div>
  </div>

  <div class='box-footer'>
    <button type='submit' class='btn btn-primary'>_{CHANGE}_</button>
  </div>
  </div>
</form>