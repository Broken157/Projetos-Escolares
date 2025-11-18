let postItCount = 0;
let activeCount = 0;
let minimizedCount = 0;
let quantpostit = 0;
let availableNumbers = [];

/**
 * Aguarda o carregamento do DOM para adicionar os event listeners principais.
 */
document.addEventListener('DOMContentLoaded', function () {
    const newPostItButton = document.getElementById('newPostIt');
    const deleteAllButton = document.getElementById('deleteAllPostIts');
    const instructionsButton = document.getElementById('instructions');
    const closeModalButton = document.getElementById('closeModal');
    const modal = document.getElementById('myModal');
    const postItTextInput = document.getElementById('postItText');

    newPostItButton.addEventListener('click', createPostIt);
    deleteAllButton.addEventListener('click', deleteAllPostIts);
    instructionsButton.addEventListener('click', showInstructions);

    // Fecha o modal ao clicar no 'x'
    closeModalButton.addEventListener('click', () => {
        modal.style.display = "none";
    });

    // Fecha o modal ao clicar fora do conteúdo
    window.addEventListener('click', (event) => {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    });

    // Permite criar post-it com a tecla 'Enter'
    postItTextInput.addEventListener('keypress', function (e) {
        if (e.key === 'Enter' && !e.shiftKey) {
            e.preventDefault(); // Impede a quebra de linha no textarea
            createPostIt();
        }
    });
});

/**
 * Exibe o modal com um conteúdo customizado.
 * @param {string} content - O HTML ou texto a ser exibido no modal.
 */
function showModal(content) {
    document.getElementById('modalText').innerHTML = content;
    document.getElementById('myModal').style.display = "block";
}

/**
 * Cria um novo post-it.
 */
function createPostIt() {
    const postItTextInput = document.getElementById('postItText');
    const postItText = postItTextInput.value.trim();

    if (postItText === "") {
        showModal("Por favor, escreva algo no post-it.");
        return;
    }

    if (postItText.length > 155) {
        showModal("O texto não pode exceder 155 caracteres.");
        return;
    }

    postItCount++;
    activeCount++;

    let postItNumberValue;
    if (availableNumbers.length > 0) {
        availableNumbers.sort((a, b) => a - b);
        postItNumberValue = availableNumbers.shift();
    } else {
        quantpostit++;
        postItNumberValue = quantpostit;
    }

    const postIt = document.createElement('div');
    postIt.className = 'post-it';
    postIt.dataset.number = postItNumberValue;
    postIt.style.top = Math.random() * (window.innerHeight - 300) + 'px';
    postIt.style.left = Math.random() * (window.innerWidth - 300) + 'px';
    postIt.style.backgroundColor = getRandomColor();

    const postItNumber = document.createElement('span');
    postItNumber.className = 'post-it-number';
    postItNumber.innerText = postItNumberValue;
    postItNumber.addEventListener('click', () => {
        showModal(postIt.querySelector('.post-it-text').innerText);
    });

    const textDiv = document.createElement('div');
    textDiv.className = 'post-it-text';
    textDiv.innerText = postItText;

    const dateDiv = document.createElement('div');
    dateDiv.className = 'post-it-date';
    dateDiv.innerText = formatDate(new Date());

    const buttonsDiv = document.createElement('div');
    buttonsDiv.className = 'post-it-buttons';

    const colorButton = document.createElement('button');
    colorButton.innerHTML = '🎨';
    colorButton.title = "Mudar cor";
    colorButton.addEventListener('click', () => {
        postIt.style.backgroundColor = getRandomColor();
        setContrast(postIt);
    });

    const editButton = document.createElement('button');
    editButton.innerHTML = '✎';
    editButton.title = "Editar";
    editButton.addEventListener('click', () => editPostIt(postIt));

    const minimizeButton = document.createElement('button');
    minimizeButton.innerHTML = '➖';
    minimizeButton.title = "Minimizar";
    minimizeButton.addEventListener('click', () => minimizePostIt(postIt));

    const closeButton = document.createElement('button');
    closeButton.innerHTML = '❌';
    closeButton.title = "Fechar";
    closeButton.addEventListener('click', () => {
        // Verifica se o post-it estava minimizado ou ativo antes de remover
        if (postIt.style.display === 'none') {
            minimizedCount--;
            const minimizedItem = document.querySelector(`#minimizedContainer > .minimized[data-number='${postIt.dataset.number}']`);
            if (minimizedItem) minimizedItem.remove();
        } else {
            activeCount--;
        }
        
        postIt.remove();
        postItCount--;
        availableNumbers.push(postItNumberValue);
        updateCounter();
    });

    buttonsDiv.append(colorButton, editButton, minimizeButton, closeButton);
    postIt.append(postItNumber, dateDiv, buttonsDiv, textDiv);
    document.getElementById('postItContainer').appendChild(postIt);

    updateCounter();
    makeDraggable(postIt);
    setContrast(postIt);
    postItTextInput.value = "";
    postItTextInput.focus();
}

/**
 * Edita o texto de um post-it existente.
 * @param {HTMLElement} postIt - O elemento do post-it a ser editado.
 */
function editPostIt(postIt) {
    const textDiv = postIt.querySelector('.post-it-text');
    const currentText = textDiv.innerText;
    const newText = prompt("Edite o texto:", currentText);

    if (newText === null) return; // Usuário cancelou

    if (newText.trim().length > 155) {
        showModal("O texto não pode exceder 155 caracteres.");
        return;
    }

    textDiv.innerText = newText.trim();
}

/**
 * Minimiza um post-it.
 * @param {HTMLElement} postIt - O elemento do post-it a ser minimizado.
 */
function minimizePostIt(postIt) {
    if (postIt.style.display === 'none') return;

    postIt.style.display = 'none';

    const minimizedDiv = document.createElement('div');
    minimizedDiv.className = 'minimized';
    minimizedDiv.dataset.number = postIt.dataset.number;
    minimizedDiv.style.backgroundColor = postIt.style.backgroundColor;
    minimizedDiv.innerText = postIt.dataset.number;
    setContrast(minimizedDiv, true);

    minimizedDiv.addEventListener('click', () => {
        postIt.style.display = 'flex';
        minimizedDiv.remove();
        activeCount++;
        minimizedCount--;
        updateCounter();
    });

    document.getElementById('minimizedContainer').appendChild(minimizedDiv);
    minimizedCount++;
    activeCount--;
    updateCounter();
}

/**
 * Torna um elemento arrastável.
 * @param {HTMLElement} element - O elemento a ser tornado arrastável.
 */
function makeDraggable(element) {
    let offsetX, offsetY;

    const move = (e) => {
        e.preventDefault();
        const clientX = e.touches ? e.touches[0].clientX : e.clientX;
        const clientY = e.touches ? e.touches[0].clientY : e.clientY;
        element.style.left = (clientX - offsetX) + 'px';
        element.style.top = (clientY - offsetY) + 'px';
    };

    const stopMove = () => {
        document.removeEventListener('mousemove', move);
        document.removeEventListener('mouseup', stopMove);
        document.removeEventListener('touchmove', move);
        document.removeEventListener('touchend', stopMove);
    };

    const startMove = (e) => {
        const clientX = e.touches ? e.touches[0].clientX : e.clientX;
        const clientY = e.touches ? e.touches[0].clientY : e.clientY;
        offsetX = clientX - element.getBoundingClientRect().left;
        offsetY = clientY - element.getBoundingClientRect().top;

        document.addEventListener('mousemove', move);
        document.addEventListener('mouseup', stopMove);
        document.addEventListener('touchmove', move);
        document.addEventListener('touchend', stopMove);
    };

    element.addEventListener('mousedown', startMove);
    element.addEventListener('touchstart', startMove);
}

/**
 * Gera uma cor hexadecimal aleatória.
 * @returns {string} A cor em formato hexadecimal.
 */
function getRandomColor() {
    const letters = '0123456789ABCDEF';
    let color = '#';
    for (let i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}

/**
 * Define a cor do texto (preto ou branco) com base no contraste do fundo.
 * @param {HTMLElement} element - O elemento (post-it ou minimizado).
 * @param {boolean} isMinimized - Flag para saber se é um item minimizado.
 */
function setContrast(element, isMinimized = false) {
    const backgroundColor = element.style.backgroundColor;
    const rgb = parseInt(backgroundColor.substring(1), 16);
    const r = (rgb >> 16) & 0xff;
    const g = (rgb >> 8) & 0xff;
    const b = (rgb >> 0) & 0xff;

    const brightness = (r * 299 + g * 587 + b * 114) / 1000;
    const textColor = brightness > 128 ? 'black' : 'white';

    element.style.color = textColor;
    if (!isMinimized) {
        element.querySelectorAll('.post-it-number, .post-it-text, .post-it-date').forEach(el => {
            el.style.color = textColor;
        });
    }
}

/**
 * Atualiza os contadores na tela.
 */
function updateCounter() {
    document.getElementById('totalCount').innerText = postItCount;
    document.getElementById('activeCount').innerText = activeCount;
    document.getElementById('minimizedCount').innerText = minimizedCount;
}

/**
 * Apaga todos os post-its da tela.
 */
function deleteAllPostIts() {
    document.getElementById('postItContainer').innerHTML = '';
    document.getElementById('minimizedContainer').innerHTML = '';
    postItCount = 0;
    activeCount = 0;
    minimizedCount = 0;
    quantpostit = 0;
    availableNumbers = [];
    updateCounter();
}

/**
 * Formata um objeto Date para o formato "dd/mm/aaaa hh:mm".
 * @param {Date} date - O objeto de data.
 * @returns {string} A data formatada.
 */
function formatDate(date) {
    const options = {
        day: '2-digit', month: '2-digit', year: 'numeric',
        hour: '2-digit', minute: '2-digit', hour12: false
    };
    return date.toLocaleString('pt-BR', options);
}

/**
 * Exibe as instruções de uso no modal.
 */
function showInstructions() {
    const instructionsText = `
        <h3>Instruções</h3>
        <ul>
            <li>Escreva algo (máx. 155 caracteres) e clique em 'Criar Post-it' ou pressione <b>Enter</b>.</li>
            <li>Arraste os post-its para movê-los pela tela.</li>
            <li>Use os botões no canto do post-it para:
                <ul>
                    <li><b>🎨</b>: Mudar a cor.</li>
                    <li><b>✎</b>: Editar o texto.</li>
                    <li><b>➖</b>: Minimizar o post-it.</li>
                    <li><b>❌</b>: Excluir o post-it.</li>
                </ul>
            </li>
            <li>Clique no <b>número</b> do post-it para visualizar seu conteúdo em um pop-up.</li>
            <li>Clique em um post-it na barra inferior para restaurá-lo.</li>
            <li>Use o botão <b>🗑️</b> para apagar todos os post-its.</li>
        </ul>
    `;
    showModal(instructionsText);
}