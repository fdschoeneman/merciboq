// public/javascripts/rails.validations.custom.js

// The validator variable is a JSON Object
// The selector variable is a jQuery Object
clientSideValidations.callbacks.element.after = function(element, eventData) {
  var settings = window[element.parents('form').attr('id')];
  element
    .parent(settings.wrapper_tag)
      .find(settings.error_tag + '.' + settings.error_class)
        .insertBefore(element);
}

clientSideValidations.validators.local['email'] = function(element, options) {
  // Your validator code goes in here
  if (!/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i.test(element.val())) {
    // When the value fails to pass validation you need to return the error message.
    // It can be derived from validator.message
    return options.message;
  }
}

