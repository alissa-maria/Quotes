const from = document.getElementById('from');
const fromdiv = document.getElementById('from-div');
const quotelabel = document.getElementById('quote-label');
const conversation = document.getElementById('conversation');

function handleRadioClick() {
  if (conversation.checked) {
    from.required = 'false';
    fromdiv.style.display = 'none';
    quotelabel.innerHTML = 'Gesprek<b>*</b>:'
  } else {
    from.required = 'true';
    fromdiv.style.display = 'block';
    quotelabel.innerHTML = 'Quote<b>*</b>:'
  }
}

const radioButtons = document.querySelectorAll('input[name="type"]');
radioButtons.forEach(radio => {
  radio.addEventListener('click', handleRadioClick);
});
