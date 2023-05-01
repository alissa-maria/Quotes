const from = document.getElementById('from');
const fromdiv = document.getElementById('from-div');
const conversation = document.getElementById('conversation');

function handleRadioClick() {
  if (conversation.checked) {
    from.removeAttribute('required');
    fromdiv.style.display = 'none';
  } else {
    from.setAttribute('required', '');
    fromdiv.style.display = 'block';
  }
}

const radioButtons = document.querySelectorAll('input[name="type"]');
radioButtons.forEach(radio => {
  radio.addEventListener('click', handleRadioClick);
});
