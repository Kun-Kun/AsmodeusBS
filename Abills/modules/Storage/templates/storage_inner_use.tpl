<form action=$SELF_URL name='storage_form_inner_use' method=POST>
  <input type=hidden name=index value=$index>
  <input type=hidden name=ID value=%ID%>

  <div class='box box-theme box-form'>
    <div class='box-header with-border'>
      <h4>_{INNER_USE}_</h4>
    </div>
    <div class='box-body form-horizontal'>

      <div class='form-group'>
        <label class='col-md-3 control-label required'>_{COUNT}_:</label>
        <div class='col-md-9'><input required class='form-control' name='COUNT' type='number' value='%COUNT%'/></div>
      </div>
      <div class='form-group'>
        <label class='col-md-3 control-label required'>_{COMMENTS}_</label>
        <div class='col-md-9'><textarea required class='form-control col-xs-12' name='COMMENTS'>%COMMENTS%</textarea>
        </div>
      </div>

    </div>
    <div class='box-footer'>
      <input type=submit name=%ACTION% value=%ACTION_LNG% class='btn btn-primary'>
    </div>
  </div>

</form>