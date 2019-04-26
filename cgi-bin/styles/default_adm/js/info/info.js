/**
 * Created by Anykey on 12.11.2015.
 *
 * TODO : move to separate files
 *
 */

if (typeof info_script_loaded === 'undefined') {

  var info_script_loaded = true;

  function renewContent(context, callback) {
    var $this = $(context);

    //console.log($this);

    var $refreshIcon = $this.find('.glyphicon');
//        console.log($refreshIcon);

    var type = $this.attr('data-object_type');
    var id = $this.attr('data-object_id');
    var areaToRefresh = $this.attr('data-renews');
    var source_func = $this.attr('data-source');

    if (!(type && id && areaToRefresh && source_func)) {
      console.log(type + ' : ' + id + ' : ' + areaToRefresh + ' : ' + source_func);
      $refreshIcon.removeClass('btn-success');
      $refreshIcon.addClass('btn-danger');
      console.log('nothing to refresh');
      return false;
    }

    $refreshIcon.addClass('fa-pulse');

    var $areaToRefresh = $('' + areaToRefresh);

    var params = {
      OBJ_TYPE: type,
      OBJ_ID: id,
      get_index: source_func,
      header: 2,
      AJAX : 1
    };

    $.get('/admin/index.cgi', params, function (data) {
      $areaToRefresh.html(data);
      $refreshIcon.removeClass('fa-pulse');

      Events.emit('info_document_renewed', true);

      if (callback) {
        callback();
      }
    });
  }

  //Comments code
  var $commentsWrapper = $('#commentsWrapper');
  if ($commentsWrapper) {

    var $commentModal = $('#info_comments_modal');

    //Modal HTML parts
    var $commentsBody = $commentModal.find('#info_comments_body');
    var $commentsRefreshBtn = $('#info_comments_refresh');
    var $commentsForm = $commentModal.find('#form_add_comments');
    var $commentsModalTitle = $commentModal.find('#info_comments_modal_title');

    //Inputs
    var $commentsTextarea = $commentsForm.find('#COMMENTS_TEXT');
    var $commentsType = $commentsForm.find('#OBJECT_TYPE');
    var $commentsId = $commentsForm.find('#OBJECT_ID');
    var $commentsAddIndex = $commentsForm.find('#ADD_INDEX');


    var $commentsBlock = $('#commentsBlock');

    Events.on('info_something_changed', function (data) {
      console.log(data);
      renewContent($commentsRefreshBtn, bindDelBtns);
      //renewDOM();
    });

    $commentsRefreshBtn.on('click', function () {
      console.log('click');
      Events.emit('info_something_changed', 'comments');
    });

    //bind events
    $commentsForm.on('submit', function (e) {
      e.preventDefault();
      submitCommentForm();
    });

    $commentModal.on('shown.bs.modal', function () {
      $commentsTextarea.focus();
    });

    bindDelBtns();

    function renewDOM() {
      $commentModal = $('#info_comments_modal');

      //Modal HTML parts
      $commentsBody = $commentModal.find('#info_comments_body');
      $commentsForm = $commentModal.find('#form_add_comments');
      $commentsModalTitle = $commentModal.find('#info_comments_modal_title');

      //Inputs
      $commentsTextarea = $commentsForm.find('#COMMENTS_TEXT');
      $commentsType = $commentsForm.find('#OBJECT_TYPE');
      $commentsId = $commentsForm.find('#OBJECT_ID');
      $commentsAddIndex = $commentsForm.find('#ADD_INDEX');

      $commentsWrapper = $('#commentsWrapper');
      $commentsBlock = $('#commentsBlock');
    }

    function bindDelBtns() {
      var $commentDelBtn = $('.commentDeleteBtn');
      $commentDelBtn.on('click', function (e) {
        e.preventDefault();
        var $commentDiv = $(this).parent().parent().parent();

        var $icon = $(this).find('.glyphicon');
        $icon.removeClass('glyphicon-remove glyphicon');
        $icon.addClass('fa fa-spinner fa-3x fa-pulse');

        var url = $(this).data('url');

        $.getJSON(url, function (data) {
          if (data.status == 0) {
            $commentDiv.fadeOut(1000);
          }
        });
      });
    }

    function submitCommentForm() {
      var text = $commentsTextarea.val();
      var type = $commentsType.val();
      var id = $commentsId.val();

      if (text.length < 1) {
        aTooltip.setClass('danger').setText('<h2>' + _COMMENTS_PLEASE + '</h2>').show();
        return false;
      }

      var params = $.param({
        get_index: 'info_comment_add',
        TEXT: text,
        OBJ_TYPE: type,
        OBJ_ID: id,
        header: 2
      });

      console.log(params);

      $.post('/admin/index.cgi', params, function (data) {
        var tempBody = $commentsBody.html();
        $commentsBody.html(data);
        setTimeout(function () {
          $commentModal.modal('hide');
          $commentsBody.html(tempBody);

          Events.emit('info_something_changed', 'comments');
          renewDOM();
        }, 2000);
      })
    }
  }
}

//Images code
{
  var $delBtns = $('.imgDelBtn');

  $delBtns.on('click', function () {
    var $this = $(this);
    $this.addClass('fa-spin');
    deleteImage(this);
  });


  function deleteImage(context) {
    var $context = $(context);
    var img_id = $context.data('image_id');
    var url = '/admin/index.cgi?get_index=info_image_del&header=2&OBJ_ID=' + img_id;

    $.getJSON(url, function (data) {
      if (data.status == 0) {
        $context.parent().parent().fadeOut(1000);
        $context.removeClass('fa-pulse');
      }
    });
  }

  //AJAX UPLOAD FORM
  $(function () {
    var $ajax_modal = $('#info_ajax_upload_modal');
    var $ajax_form = $ajax_modal.find('#form_ajax_upload');
    var $ajax_body = $ajax_modal.find('#info_ajax_upload_modal_body');
    var ajax_clear_body = '';
    var $add_btn = $ajax_modal.find('#go');
    var add_btn_text = $add_btn.text();

    console.log('Ajax Form Upload logic defined');

    bindAjaxFormSubmit();

    function uploadForm(context) {
      var url = "/admin/index.cgi";

      $add_btn.html('<span class="fa fa-spinner fa-pulse"></span>');
      $add_btn.addClass('disabled');

      ajax_clear_body = $ajax_body.html();
      console.log('submit');
      $.ajax({
        url: url, // Url to which the request is send
        type: "POST",             // Type of request to be send, called as method
        data: new FormData(context), // Data sent to server, a set of key/value pairs (i.e. form fields and values)
        contentType: false,       // The content type used when sending data to the server.
        cache: false,             // To unable request pages to be cached
        processData: false,        // To send DOMDocument or non processed data file it is set to false
        success: function (data)   // A function to be called if request succeeds
        {
          $ajax_body.empty().html(data);

          Events.emit('info_something_changed', true);

          setTimeout(function () {
            $ajax_modal.modal('hide');
            $ajax_body.html(ajax_clear_body);
            $add_btn.text(add_btn_text);
            $add_btn.removeClass('disabled');
            $ajax_form = $ajax_modal.find('#form_ajax_upload');
            bindAjaxFormSubmit();
          }, 3000);
        }
      });
    }

    function bindAjaxFormSubmit() {
      $ajax_form.on('submit', function (e) {
        e.preventDefault();
        console.log('before');
        uploadForm(this);
      });
    }
  });

  //DOCUMENTS SECTION
  {
    var $documentsWrapper = $('#docWrapper');
    if ($documentsWrapper[0]) {
      console.log('docs');
      var $documentRefreshBtn = $documentsWrapper.find('#info_documents_refresh');
      var $documentRefreshIcon = $documentsWrapper.find('#info_documents_refresh>.glyphicon.glyphicon-refresh');

      //Bind events

      $documentRefreshBtn.on('click', function (e) {
        e.preventDefault();
        renewContent(this);
      });

      Events.on('info_something_changed', function () {
        renewContent($documentRefreshBtn);
      });

    }
  }

}