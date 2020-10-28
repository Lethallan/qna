document.addEventListener('turbolinks:load', function() {
  $('.form-inline-link').on('click', formInlineLinkHandler)

  let errors = document.querySelector('.resource-errors')

  if (errors) {
    let resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()

  let answerId = this.dataset.answertId
  formInlineHandler(answerId)
}

function formInlineHandler(answerId) {
  let link = document.querySelector('.form-inline-link[data-answer-id="' + answerId + '"]')
  let $answerBody = $('.answer-body[data-answer-id="' + answerId + '"]')
  let $formInline = $('.form-inline[data-answer-id="' + answerId + '"]')

  $formInline.toggle()
  $answerBody.toggle()

  if ($formInline.is(':visible')) {
    link.textContent = 'Cancel'
  } else {
    link.textContent = 'Edit'
  }
}