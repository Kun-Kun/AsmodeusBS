<form action=$SELF_URL class='form-horizontal'>
    <input type=hidden name=index value=$index>
    <input type=hidden name=sid value=$sid>
    <input type=hidden name=CID value='%DHCP_LEASES_MAC%'>

    <div class='box box-warning box-solid'>
        <div class='box-header  bg-yellow'>
            <h4></h4>_{GUEST_MODE}_</h4>
        </div>

        <div class='box-body'>

            <div class='form-group'>
                <label class='col-md-3'>MAC</label>
                <div class='col-md-9'>
                    %MAC% (%IP%)
                </div>
            </div>

            <div class='form-group'>
                <label class='col-md-3'>_{PORT}_</label>
                <div class='col-md-9'>
                    %PORTS%
                </div>
            </div>

            <div class='form-group'>
                <label class='col-md-3'>VLAN</label>
                <div class='col-md-9'>
                    %VLAN%
                </div>
            </div>


        </div>
        <div class='box-footer'>
            <input type=submit name=discovery value='_{REGISTRATION}_' class='btn btn-success'>
        </div>
    </div>

</form>
