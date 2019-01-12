let style = document.createElement('link');
style.rel = 'stylesheet';
style.type = 'text/css';
style.href = chrome.runtime.getURL('modal.css');
(document.head||document.documentElement).appendChild(style);

let modalDiv = document.createElement('div');
modalDiv.id = 'myModal';
modalDiv.className = 'modal';
let modalContent = document.createElement('div');
modalContent.className = 'modal-content';
let modalSpan = document.createElement('a');
modalSpan.id = 'myClose';
modalSpan.className = 'close';
modalSpan.innerHTML = 'close';
modalContent.appendChild(modalSpan);
let modalPar = document.createElement('p');
modalPar.innerHTML = "Based on the raw tags, we constructed the following Open Graph properties";
modalContent.appendChild(modalPar);
let modalTable = document.createElement('table');
modalTable.id = 'myTable';
modalContent.appendChild(modalTable);
let modalList = document.createElement('ul');
modalList.id = 'myList';
modalContent.appendChild(modalList);
modalDiv.appendChild(modalContent);
(document.body||document.documentElement).appendChild(modalDiv);

// Get the modal
let modal = document.getElementById('myModal');

document.getElementById("myClose").addEventListener("click", closeModal);

function openModal() {
    modal.style.display = "block";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

function closeModal() {
  modal.style.display = "none";
}

let metas = Array.from(document.getElementsByTagName('meta'));
let filteredMetas = metas.filter((meta) => meta.getAttribute('property') && meta.getAttribute('content') );
let metaStrings = filteredMetas.map(meta => meta.outerHTML);

// fill the modal list with meta tags
let index = 0;
for (let metaString in metaStrings) {
  let listItem = document.createElement('li');
  let preItem = document.createElement('pre');
  preItem.innerHTML = metaStrings[index].replace(/&/g, '&amp;').replace(/</g, '&lt;');
  listItem.appendChild(preItem);
  modalList.appendChild(listItem);
  index++;
}
openModal();
