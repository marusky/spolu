window.addEventListener('turbolinks:load', () => {

    const teamsContainer = document.querySelector('.teams-container')
    const width = teamsContainer.getBoundingClientRect().width

    const btnChevron = document.querySelector('.btn-chevron')
    const rowsCount = Math.ceil(teamsContainer.children.length / 3)
    teamsContainer.style.height = `${window.innerWidth / 4 + 19}px`;

    btnChevron.addEventListener('click', () => {
        if ([...btnChevron.classList].includes('open')) {
            btnChevron.classList.remove('open')
            teamsContainer.style.height = `${window.innerWidth / 4 + 19}px`;
            teamsContainer.style.marginBottom = '20px'
        } else {
            btnChevron.classList.add('open')
            teamsContainer.style.height = `${ 5 + rowsCount * (window.innerWidth / 4 + 17)}px`;
            teamsContainer.style.marginBottom = '50px'
        }
    })
})
