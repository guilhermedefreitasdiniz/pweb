const addTaskButton = document.querySelector('.add-task-button'); //1
const popup = document.getElementById('task-popup');
const closePopupButton = document.querySelector('.close-popup');
const taskForm = document.getElementById('task-form');
const todoColumn = document.getElementById('todo');
const searchBar = document.getElementById('search-bar');
const columns = document.querySelectorAll('.column');

//drag e drop
document.addEventListener('dragstart', (event) => {
    if (event.target.classList.contains('task')) {
        event.target.classList.add('dragging');
    }
});

document.addEventListener('dragend', (event) => {
    if (event.target.classList.contains('task')) {
        event.target.classList.remove('dragging');
    }
});

columns.forEach(column => {
    column.addEventListener('dragover', (event) => {
        event.preventDefault();
        const draggingTask = document.querySelector('.dragging');
        if (draggingTask) {
            column.appendChild(draggingTask);
        }
    });
});

//filtrar
searchBar.addEventListener('input', (event) => {
    const query = event.target.value.toLowerCase();
    const tasks = document.querySelectorAll('.task');

    tasks.forEach(task => {
        const taskText = task.textContent.toLowerCase();
        task.style.display = taskText.includes(query) ? 'block' : 'none';
    });
});

//abre popup
addTaskButton.addEventListener('click', () => {
    popup.classList.remove('hidden');
});

//fecha popup
closePopupButton.addEventListener('click', () => {
    popup.classList.add('hidden');
});

taskForm.addEventListener('submit', (event) => {
    event.preventDefault();

    //pega
    const title = document.getElementById('task-title').value;
    const priority = document.getElementById('task-priority').value;
    const description = document.getElementById('task-description').value;
    const responsible = document.getElementById('task-responsible').value;
    const deadline = document.getElementById('task-deadline').value;

    //cria
    const newTask = document.createElement('div');
    newTask.classList.add('task');
    newTask.setAttribute('draggable', 'true');
    newTask.setAttribute('data-priority', priority); // Apenas para referência

    //p cada campo
    const titleElement = document.createElement('h3');
    titleElement.textContent = title;
    newTask.appendChild(titleElement);

    const priorityElement = document.createElement('p');
    priorityElement.textContent = `Prioridade: ${priority}`;
    newTask.appendChild(priorityElement);

    if (description) {
        const descriptionElement = document.createElement('p');
        descriptionElement.textContent = `Descrição: ${description}`;
        newTask.appendChild(descriptionElement);
    }

    if (responsible) {
        const responsibleElement = document.createElement('p');
        responsibleElement.textContent = `Responsável: ${responsible}`;
        newTask.appendChild(responsibleElement);
    }

    if (deadline) {
        const deadlineElement = document.createElement('p');
        deadlineElement.textContent = `Data Limite: ${deadline}`;
        newTask.appendChild(deadlineElement);
    }


    const priorityColors = {
        'urgente': 'var(--cor-nota-urgente)',
        'alta': 'var(--cor-nota-alta)',
        'media': 'var(--cor-nota-media)',
        'baixa': 'var(--cor-nota-baixa)',
        '*': 'red' // caso n de
    };

    newTask.style.backgroundColor = priorityColors[priority] || priorityColors['*'];

    todoColumn.appendChild(newTask);

    popup.classList.add('hidden');

    taskForm.reset();
});

const settingsButton = document.querySelector('.engrenagem-sr'); // Botão da engrenagem
const settingsPopup = document.getElementById('settings-popup'); // Pop-up de configurações
const closeSettingsButton = settingsPopup.querySelector('.close-popup'); // Botão de fechar

settingsButton.addEventListener('click', () => {
    settingsPopup.classList.remove('hidden');
});

closeSettingsButton.addEventListener('click', () => {
    settingsPopup.classList.add('hidden');
});

settingsPopup.addEventListener('click', (event) => {
    if (event.target === settingsPopup) {
        settingsPopup.classList.add('hidden');
    }
});

const settingsForm = document.getElementById('settings-form');
const themeSelect = document.getElementById('theme-select');

settingsForm.addEventListener('submit', (event) => {
    event.preventDefault();
    const selectedTheme = themeSelect.value;

    if (selectedTheme === 'claro') {
        document.documentElement.style.setProperty('--cor-fundo', '#f5f5f5');
        document.documentElement.style.setProperty('--cor-texto', '#222222');
    } else if (selectedTheme === 'escuro') {
        document.documentElement.style.setProperty('--cor-fundo', '#222222');
        document.documentElement.style.setProperty('--cor-texto', '#f5f5f5');
    }
/*
    settingsPopup.classList.add('hidden');*/
});

document.addEventListener("DOMContentLoaded", function () {
  const tasksContainer = document.querySelector(".task-container");

  tasksContainer.addEventListener("click", function (e) {
    if (e.target.classList.contains("settings-icon")) {
      const settingsMenu = e.target.nextElementSibling;
      settingsMenu.style.display = settingsMenu.style.display === "block" ? "none" : "block";
    }
  });

  document.addEventListener("click", function (e) {
    if (!e.target.closest(".task-settings")) {
      const allMenus = document.querySelectorAll(".settings-menu");
      allMenus.forEach(function (menu) {
        menu.style.display = "none";
      });
    }
  });

  //editar tarefa
  tasksContainer.addEventListener("click", function (e) {
    if (e.target.classList.contains("edit-task")) {
      const task = e.target.closest(".task");
      const taskName = task.querySelector(".task-name").textContent;

      document.getElementById("taskName").value = taskName;
      document.getElementById("priority").value = task.dataset.priority || "";
      document.getElementById("dueDate").value = task.dataset.dueDate || "";
      document.getElementById("responsible").value = task.dataset.responsible || "";

      document.getElementById("editPopup").style.display = "flex";
      
      document.getElementById("editForm").addEventListener("submit", function (e) {
        e.preventDefault();

        task.querySelector(".task-name").textContent = document.getElementById("taskName").value;
        task.dataset.priority = document.getElementById("priority").value;
        task.dataset.dueDate = document.getElementById("dueDate").value;
        task.dataset.responsible = document.getElementById("responsible").value;

        //fecha
        document.getElementById("editPopup").style.display = "none";
      });
    }
  });

  document.getElementById("closePopup").addEventListener("click", function () {
    document.getElementById("editPopup").style.display = "none";
  });

  tasksContainer.addEventListener("click", function (e) {
    if (e.target.classList.contains("delete-task")) {
      const task = e.target.closest(".task");
      task.remove();
    }
  });
});





function saveBoardState() {
    const columns = document.querySelectorAll('.column');
    const boardState = {};

    columns.forEach(column => {
        const columnId = column.id;
        const tasks = column.querySelectorAll('.task');
        boardState[columnId] = Array.from(tasks).map(task => ({
            title: task.querySelector('h3')?.textContent || '',
            priority: task.getAttribute('data-priority') || '',
            description: task.querySelector('p:nth-child(3)')?.textContent.replace('Descrição: ', '') || '',
            responsible: task.querySelector('p:nth-child(4)')?.textContent.replace('Responsável: ', '') || '',
            deadline: task.querySelector('p:nth-child(5)')?.textContent.replace('Data Limite: ', '') || '',
            backgroundColor: task.style.backgroundColor,
            column: columnId
        }));
    });

    localStorage.setItem('kanbanBoardState', JSON.stringify(boardState));
}

function loadBoardState() {
    const savedState = localStorage.getItem('kanbanBoardState');
    if (!savedState) return;

    const boardState = JSON.parse(savedState);

    document.querySelectorAll('.task').forEach(task => task.remove());

    Object.entries(boardState).forEach(([columnId, tasks]) => {
        const column = document.getElementById(columnId);
        if (!column) return;

        tasks.forEach(taskData => {
            const newTask = document.createElement('div');
            newTask.classList.add('task');
            newTask.setAttribute('draggable', 'true');
            newTask.setAttribute('data-priority', taskData.priority);
            newTask.style.backgroundColor = taskData.backgroundColor;

            const titleElement = document.createElement('h3');
            titleElement.textContent = taskData.title;
            newTask.appendChild(titleElement);

            const priorityElement = document.createElement('p');
            priorityElement.textContent = `Prioridade: ${taskData.priority}`;
            newTask.appendChild(priorityElement);

            if (taskData.description) {
                const descriptionElement = document.createElement('p');
                descriptionElement.textContent = `Descrição: ${taskData.description}`;
                newTask.appendChild(descriptionElement);
            }

            if (taskData.responsible) {
                const responsibleElement = document.createElement('p');
                responsibleElement.textContent = `Responsável: ${taskData.responsible}`;
                newTask.appendChild(responsibleElement);
            }

            if (taskData.deadline) {
                const deadlineElement = document.createElement('p');
                deadlineElement.textContent = `Data Limite: ${taskData.deadline}`;
                newTask.appendChild(deadlineElement);
            }

            column.appendChild(newTask);
        });
    });
}

document.addEventListener('dragend', saveBoardState);

taskForm.addEventListener('submit', (event) => {
    
    setTimeout(saveBoardState, 0);
});

document.addEventListener('DOMContentLoaded', loadBoardState);

document.addEventListener('click', (event) => {
    if (event.target.classList.contains('delete-task')) {
        setTimeout(saveBoardState, 0);
    }
});

document.getElementById("editForm")?.addEventListener("submit", (event) => {
    setTimeout(saveBoardState, 0);
});

///////////
